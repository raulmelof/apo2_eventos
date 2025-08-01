package dao;

import model.Palestrante;
import model.Palestra;
import database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import java.sql.Time;

public class Palestrante_PalestraDAO {

    private Connection connection;

    public Palestrante_PalestraDAO() {
        this.connection = new DBConnection().getConnection();
    }

    public boolean associacaoCreate(String cpfPalestrante, int idPalestra) {
        String sql = "INSERT INTO palestrante_palestra (cpfPalestrante, idPalestra) VALUES (?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cpfPalestrante);
            stmt.setInt(2, idPalestra);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                System.err.println("Erro: Palestrante já associado a esta palestra. " + e.getMessage());
            } else {
                System.err.println("Erro ao criar associação palestrante-palestra: " + e.getMessage());
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean associacaoDelete(String cpfPalestrante, int idPalestra) {
        String sql = "DELETE FROM palestrante_palestra WHERE cpfPalestrante = ? AND idPalestra = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cpfPalestrante);
            stmt.setInt(2, idPalestra);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao deletar associação palestrante-palestra: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Palestrante> palestrantesReadByPalestra(int idPalestra) {
        String sql = "SELECT p.* FROM palestrante p " +
                     "JOIN palestrante_palestra pp ON p.CPF = pp.cpfPalestrante " +
                     "WHERE pp.idPalestra = ?";
        List<Palestrante> palestrantes = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idPalestra);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Palestrante palestrante = new Palestrante();
                    palestrante.setCPF(rs.getString("CPF"));
                    palestrante.setNome(rs.getString("nome"));
                    palestrante.setEmail(rs.getString("email"));
                    palestrantes.add(palestrante);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar palestrantes por palestra: " + e.getMessage());
            e.printStackTrace();
        }
        return palestrantes;
    }

    public List<Palestra> palestrasReadByPalestrante(String cpfPalestrante) {
        String sql = "SELECT p.* FROM palestra p " +
                     "JOIN palestrante_palestra pp ON p.idPalestra = pp.idPalestra " +
                     "WHERE pp.cpfPalestrante = ?";
        List<Palestra> palestras = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cpfPalestrante);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Palestra palestra = new Palestra();
                    palestra.setIdPalestra(rs.getInt("idPalestra"));
                    palestra.setNomePalestra(rs.getString("nomePalestra"));
                    Date dbDataPalestra = rs.getDate("dataPalestra");
                    if (dbDataPalestra != null) {
                        palestra.setDataPalestra(dbDataPalestra.toLocalDate());
                    }
                    Time dbHorarioInicio = rs.getTime("horarioInicio");
                    if (dbHorarioInicio != null) {
                        palestra.setHorarioInicio(dbHorarioInicio.toLocalTime());
                    }
                    palestras.add(palestra);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar palestras por palestrante: " + e.getMessage());
            e.printStackTrace();
        }
        return palestras;
    }


    public void closeConnection() {
        try {
            if (this.connection != null && !this.connection.isClosed()) {
                this.connection.close();
            }
        } catch (SQLException e) {
            System.err.println("Erro ao fechar a conexão em PalestrantePalestraDAO: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
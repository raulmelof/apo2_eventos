package dao;

import model.Palestra;
import database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class PalestraDAO {

    private Connection connection;

    public PalestraDAO() {
        this.connection = new DBConnection().getConnection();
    }

    public int palestraCreate(Palestra palestra) {
        String sql = "INSERT INTO palestra (nomePalestra, dataPalestra, horarioInicio, horarioFinal, descricao, " +
                     "localizacao, vagas, link, cargaHoraria, chave, idEvento) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        int generatedId = -1;

        try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, palestra.getNomePalestra());
            stmt.setDate(2, Date.valueOf(palestra.getDataPalestra()));
            stmt.setTime(3, Time.valueOf(palestra.getHorarioInicio()));
            stmt.setTime(4, Time.valueOf(palestra.getHorarioFinal()));
            stmt.setString(5, palestra.getDescricao());
            stmt.setString(6, palestra.getLocalizacao());
            
            if (palestra.getVagas() != null) {
                stmt.setInt(7, palestra.getVagas());
            } else {
                stmt.setNull(7, java.sql.Types.INTEGER);
            }
            
            stmt.setString(8, palestra.getLink());
            stmt.setString(9, palestra.getCargaHoraria());
            stmt.setString(10, palestra.getChave());
            stmt.setInt(11, palestra.getIdEvento());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        generatedId = rs.getInt(1);
                        palestra.setIdPalestra(generatedId);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao criar palestra: " + e.getMessage());
            e.printStackTrace();
        }
        return generatedId;
    }

    public Palestra palestraReadById(int idPalestra) {
        String sql = "SELECT * FROM palestra WHERE idPalestra = ?";
        Palestra palestra = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idPalestra);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    palestra = new Palestra();
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
                    
                    Time dbHorarioFinal = rs.getTime("horarioFinal");
                    if (dbHorarioFinal != null) {
                        palestra.setHorarioFinal(dbHorarioFinal.toLocalTime());
                    }
                    
                    palestra.setDescricao(rs.getString("descricao"));
                    palestra.setLocalizacao(rs.getString("localizacao"));
                    palestra.setVagas(rs.getInt("vagas"));
                    if (rs.wasNull()) {
                        palestra.setVagas(null);
                    }
                    palestra.setLink(rs.getString("link"));
                    palestra.setCargaHoraria(rs.getString("cargaHoraria"));
                    palestra.setChave(rs.getString("chave"));
                    palestra.setIdEvento(rs.getInt("idEvento"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar palestra por ID: " + e.getMessage());
            e.printStackTrace();
        }
        return palestra;
    }

    public List<Palestra> palestraReadAllByEvento(int idEvento) {
        String sql = "SELECT * FROM palestra WHERE idEvento = ? ORDER BY dataPalestra, horarioInicio";
        List<Palestra> palestras = new ArrayList<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idEvento);
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
                    
                    Time dbHorarioFinal = rs.getTime("horarioFinal");
                    if (dbHorarioFinal != null) {
                        palestra.setHorarioFinal(dbHorarioFinal.toLocalTime());
                    }
                    
                    palestra.setDescricao(rs.getString("descricao"));
                    palestra.setLocalizacao(rs.getString("localizacao"));
                    palestra.setVagas(rs.getInt("vagas"));
                     if (rs.wasNull()) {
                        palestra.setVagas(null);
                    }
                    palestra.setLink(rs.getString("link"));
                    palestra.setCargaHoraria(rs.getString("cargaHoraria"));
                    palestra.setChave(rs.getString("chave"));
                    palestra.setIdEvento(rs.getInt("idEvento"));
                    palestras.add(palestra);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar palestras por evento: " + e.getMessage());
            e.printStackTrace();
        }
        return palestras;
    }

    public boolean palestraUpdate(Palestra palestra) {
        String sql = "UPDATE palestra SET nomePalestra = ?, dataPalestra = ?, horarioInicio = ?, horarioFinal = ?, " +
                     "descricao = ?, localizacao = ?, vagas = ?, link = ?, cargaHoraria = ?, chave = ?, idEvento = ? " +
                     "WHERE idPalestra = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, palestra.getNomePalestra());
            stmt.setDate(2, Date.valueOf(palestra.getDataPalestra()));
            stmt.setTime(3, Time.valueOf(palestra.getHorarioInicio()));
            stmt.setTime(4, Time.valueOf(palestra.getHorarioFinal()));
            stmt.setString(5, palestra.getDescricao());
            stmt.setString(6, palestra.getLocalizacao());
            
            if (palestra.getVagas() != null) {
                stmt.setInt(7, palestra.getVagas());
            } else {
                stmt.setNull(7, java.sql.Types.INTEGER);
            }
            
            stmt.setString(8, palestra.getLink());
            stmt.setString(9, palestra.getCargaHoraria());
            stmt.setString(10, palestra.getChave());
            stmt.setInt(11, palestra.getIdEvento());
            stmt.setInt(12, palestra.getIdPalestra());

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao atualizar palestra: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean palestraDelete(int idPalestra) {
        String sql = "DELETE FROM palestra WHERE idPalestra = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idPalestra);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao deletar palestra: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Palestra> listarParaProgramacao() {
        return palestraReadAllByEvento(1); 
    }

    public void closeConnection() {
        try {
            if (this.connection != null && !this.connection.isClosed()) {
                this.connection.close();
            }
        } catch (SQLException e) {
            System.err.println("Erro ao fechar a conexão em PalestraDAO: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
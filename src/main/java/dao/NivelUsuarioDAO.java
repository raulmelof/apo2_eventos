package dao;

import model.NivelUsuario;
import database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NivelUsuarioDAO {

    private Connection connection;

    public NivelUsuarioDAO() {
        this.connection = new DBConnection().getConnection();
    }

    public NivelUsuario nivelUsuarioReadById(int idNivelUsuario) {
        String sql = "SELECT idNivelUsuario, nomeNivel FROM nivelUsuario WHERE idNivelUsuario = ?";
        NivelUsuario nivel = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idNivelUsuario);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    nivel = new NivelUsuario();
                    nivel.setIdNivelUsuario(rs.getInt("idNivelUsuario"));
                    nivel.setNomeNivel(rs.getString("nomeNivel"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar NivelUsuario por ID: " + e.getMessage());
            e.printStackTrace();
        }
        return nivel;
    }

    public NivelUsuario nivelUsuarioReadByName(String nomeNivel) {
        String sql = "SELECT idNivelUsuario, nomeNivel FROM nivelUsuario WHERE nomeNivel = ?";
        NivelUsuario nivel = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, nomeNivel);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    nivel = new NivelUsuario();
                    nivel.setIdNivelUsuario(rs.getInt("idNivelUsuario"));
                    nivel.setNomeNivel(rs.getString("nomeNivel"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar NivelUsuario por nome: " + e.getMessage());
            e.printStackTrace();
        }
        return nivel;
    }

    public List<NivelUsuario> nivelUsuarioReadAll() {
        String sql = "SELECT idNivelUsuario, nomeNivel FROM nivelUsuario ORDER BY nomeNivel";
        List<NivelUsuario> niveis = new ArrayList<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                NivelUsuario nivel = new NivelUsuario();
                nivel.setIdNivelUsuario(rs.getInt("idNivelUsuario"));
                nivel.setNomeNivel(rs.getString("nomeNivel"));
                niveis.add(nivel);
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar todos os Niveis de Usuário: " + e.getMessage());
            e.printStackTrace();
        }
        return niveis;
    }

    public void closeConnection() {
        try {
            if (this.connection != null && !this.connection.isClosed()) {
                this.connection.close();
            }
        } catch (SQLException e) {
            System.err.println("Erro ao fechar a conexão em NivelUsuarioDAO: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
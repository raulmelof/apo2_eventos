package dao;

import model.Colab;
import model.Evento;
import database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Evento_ColabDAO {

    private Connection connection;

    public Evento_ColabDAO() {
        this.connection = new DBConnection().getConnection();
    }

    public boolean associacaoCreate(int idEvento, int idColab) {
        String sql = "INSERT INTO evento_colab (idEvento, idColab) VALUES (?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idEvento);
            stmt.setInt(2, idColab);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                System.err.println("Erro: Colaborador já associado a este evento. " + e.getMessage());
            } else {
                System.err.println("Erro ao criar associação evento-colaborador: " + e.getMessage());
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean associacaoDelete(int idEvento, int idColab) {
        String sql = "DELETE FROM evento_colab WHERE idEvento = ? AND idColab = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idEvento);
            stmt.setInt(2, idColab);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao deletar associação evento-colaborador: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean desassociarColabDeTodosEventos(int idColab) {
        String sql = "DELETE FROM evento_colab WHERE idColab = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idColab);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.err.println("Erro ao desassociar colaborador de todos os eventos: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean desassociarTodosColabsDeUmEvento(int idEvento) {
        String sql = "DELETE FROM evento_colab WHERE idEvento = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idEvento);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.err.println("Erro ao desassociar todos os colaboradores de um evento: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public List<Colab> colabsReadByEvento(int idEvento) {
        String sql = "SELECT c.* FROM colab c JOIN evento_colab ec ON c.idColab = ec.idColab WHERE ec.idEvento = ?";
        List<Colab> colabs = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idEvento);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Colab colab = new Colab();
                    colab.setIdColab(rs.getInt("idColab"));
                    colab.setNomeColab(rs.getString("nomeColab"));
                    colab.setLinkColab(rs.getString("linkColab"));
                    colab.setImgColab(rs.getString("imgColab"));
                    colab.setTamimgColab(rs.getString("tamimgColab"));
                    colabs.add(colab);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar colaboradores por evento: " + e.getMessage());
            e.printStackTrace();
        }
        return colabs;
    }


    public void closeConnection() {
        try {
            if (this.connection != null && !this.connection.isClosed()) {
                this.connection.close();
            }
        } catch (SQLException e) {
            System.err.println("Erro ao fechar a conexão em EventoColabDAO: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
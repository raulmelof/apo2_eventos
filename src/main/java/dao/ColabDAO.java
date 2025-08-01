package dao;

import model.Colab;
import database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ColabDAO {

    private Connection connection;

    public ColabDAO() {
        this.connection = new DBConnection().getConnection();
    }

    public int colabCreate(Colab colab) {
        String sql = "INSERT INTO colab (nomeColab, linkColab, imgColab, tamimgColab) VALUES (?, ?, ?, ?)";
        int generatedId = -1;

        try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, colab.getNomeColab());
            stmt.setString(2, colab.getLinkColab());
            stmt.setString(3, colab.getImgColab());
            stmt.setString(4, colab.getTamimgColab());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        generatedId = rs.getInt(1);
                        colab.setIdColab(generatedId);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao criar colaborador: " + e.getMessage());
            e.printStackTrace();
        }
        return generatedId;
    }

    public Colab colabReadById(int idColab) {
        String sql = "SELECT * FROM colab WHERE idColab = ?";
        Colab colab = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idColab);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    colab = new Colab();
                    colab.setIdColab(rs.getInt("idColab"));
                    colab.setNomeColab(rs.getString("nomeColab"));
                    colab.setLinkColab(rs.getString("linkColab"));
                    colab.setImgColab(rs.getString("imgColab"));
                    colab.setTamimgColab(rs.getString("tamimgColab"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar colaborador por ID: " + e.getMessage());
            e.printStackTrace();
        }
        return colab;
    }

    public List<Colab> colabReadAll() {
        String sql = "SELECT * FROM colab ORDER BY nomeColab";
        List<Colab> colabs = new ArrayList<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Colab colab = new Colab();
                colab.setIdColab(rs.getInt("idColab"));
                colab.setNomeColab(rs.getString("nomeColab"));
                colab.setLinkColab(rs.getString("linkColab"));
                colab.setImgColab(rs.getString("imgColab"));
                colab.setTamimgColab(rs.getString("tamimgColab"));
                colabs.add(colab);
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar todos os colaboradores: " + e.getMessage());
            e.printStackTrace();
        }
        return colabs;
    }

    public boolean colabUpdate(Colab colab) {
        String sql = "UPDATE colab SET nomeColab = ?, linkColab = ?, imgColab = ?, tamimgColab = ? WHERE idColab = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, colab.getNomeColab());
            stmt.setString(2, colab.getLinkColab());
            stmt.setString(3, colab.getImgColab());
            stmt.setString(4, colab.getTamimgColab());
            stmt.setInt(5, colab.getIdColab());

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao atualizar colaborador: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean colabDelete(int idColab) {
        String sql = "DELETE FROM colab WHERE idColab = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idColab);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao deletar colaborador: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public void closeConnection() {
        try {
            if (this.connection != null && !this.connection.isClosed()) {
                this.connection.close();
            }
        } catch (SQLException e) {
            System.err.println("Erro ao fechar a conexão em ColabDAO: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
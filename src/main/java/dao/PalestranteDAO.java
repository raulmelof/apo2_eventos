package dao;

import model.Palestrante;
import database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PalestranteDAO {

    private Connection connection;

    public PalestranteDAO() {
        this.connection = new DBConnection().getConnection();
    }

    public boolean palestranteCreate(Palestrante palestrante) {

        String sql = "INSERT INTO palestrante (CPF, nome, email, curriculo, facebook, youtube, instagram, linkedin, " +
                     "destaque, imagem, ordem, telefone) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, palestrante.getCPF());
            stmt.setString(2, palestrante.getNome());
            stmt.setString(3, palestrante.getEmail());
            stmt.setString(4, palestrante.getCurriculo());
            stmt.setString(5, palestrante.getFacebook());
            stmt.setString(6, palestrante.getYoutube());
            stmt.setString(7, palestrante.getInstagram());
            stmt.setString(8, palestrante.getLinkedin());
            stmt.setInt(9, palestrante.getDestaque());
            stmt.setString(10, palestrante.getImagem());
            stmt.setInt(11, palestrante.getOrdem());
            stmt.setString(12, palestrante.getTelefone());

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                 System.err.println("Erro: CPF de palestrante já cadastrado. " + e.getMessage());
            } else if (e.getErrorCode() == 1452) {
                 System.err.println("Erro: CPF não encontrado na tabela de usuários ou usuário não é palestrante. " + e.getMessage());
            } else {
                System.err.println("Erro ao criar palestrante: " + e.getMessage());
            }
            e.printStackTrace();
        }
        return false;
    }

    public Palestrante palestranteReadByCPF(String cpf) {
        String sql = "SELECT * FROM palestrante WHERE CPF = ?";
        Palestrante palestrante = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cpf);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    palestrante = new Palestrante();
                    palestrante.setCPF(rs.getString("CPF"));
                    palestrante.setNome(rs.getString("nome"));
                    palestrante.setEmail(rs.getString("email"));
                    palestrante.setCurriculo(rs.getString("curriculo"));
                    palestrante.setFacebook(rs.getString("facebook"));
                    palestrante.setYoutube(rs.getString("youtube"));
                    palestrante.setInstagram(rs.getString("instagram"));
                    palestrante.setLinkedin(rs.getString("linkedin"));
                    palestrante.setDestaque(rs.getInt("destaque"));
                    palestrante.setImagem(rs.getString("imagem"));
                    palestrante.setOrdem(rs.getInt("ordem"));
                    palestrante.setTelefone(rs.getString("telefone"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar palestrante por CPF: " + e.getMessage());
            e.printStackTrace();
        }
        return palestrante;
    }

    public List<Palestrante> palestranteReadAll() {
        String sql = "SELECT * FROM palestrante ORDER BY ordem, nome";
        List<Palestrante> palestrantes = new ArrayList<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Palestrante palestrante = new Palestrante();
                palestrante.setCPF(rs.getString("CPF"));
                palestrante.setNome(rs.getString("nome"));
                palestrante.setEmail(rs.getString("email"));
                palestrante.setCurriculo(rs.getString("curriculo"));
                palestrante.setFacebook(rs.getString("facebook"));
                palestrante.setYoutube(rs.getString("youtube"));
                palestrante.setInstagram(rs.getString("instagram"));
                palestrante.setLinkedin(rs.getString("linkedin"));
                palestrante.setDestaque(rs.getInt("destaque"));
                palestrante.setImagem(rs.getString("imagem"));
                palestrante.setOrdem(rs.getInt("ordem"));
                palestrante.setTelefone(rs.getString("telefone"));
                palestrantes.add(palestrante);
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar todos os palestrantes: " + e.getMessage());
            e.printStackTrace();
        }
        return palestrantes;
    }

    public boolean palestranteUpdate(Palestrante palestrante) {
        String sql = "UPDATE palestrante SET nome = ?, email = ?, curriculo = ?, facebook = ?, youtube = ?, " +
                     "instagram = ?, linkedin = ?, destaque = ?, imagem = ?, ordem = ?, telefone = ? " +
                     "WHERE CPF = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, palestrante.getNome());
            stmt.setString(2, palestrante.getEmail());
            stmt.setString(3, palestrante.getCurriculo());
            stmt.setString(4, palestrante.getFacebook());
            stmt.setString(5, palestrante.getYoutube());
            stmt.setString(6, palestrante.getInstagram());
            stmt.setString(7, palestrante.getLinkedin());
            stmt.setInt(8, palestrante.getDestaque());
            stmt.setString(9, palestrante.getImagem());
            stmt.setInt(10, palestrante.getOrdem());
            stmt.setString(11, palestrante.getTelefone());
            stmt.setString(12, palestrante.getCPF());

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao atualizar palestrante: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean palestranteDelete(String cpf) {
        String sql = "DELETE FROM palestrante WHERE CPF = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cpf);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao deletar palestrante: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Palestrante> listarDestaques() {
        String sql = "SELECT * FROM palestrante WHERE destaque = 1 ORDER BY ordem, nome";
        List<Palestrante> palestrantes = new ArrayList<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Palestrante palestrante = new Palestrante();
                palestrante.setCPF(rs.getString("CPF"));
                palestrante.setNome(rs.getString("nome"));
                palestrante.setEmail(rs.getString("email"));
                palestrante.setCurriculo(rs.getString("curriculo"));
                palestrante.setFacebook(rs.getString("facebook"));
                palestrante.setYoutube(rs.getString("youtube"));
                palestrante.setInstagram(rs.getString("instagram"));
                palestrante.setLinkedin(rs.getString("linkedin"));
                palestrante.setDestaque(rs.getInt("destaque"));
                palestrante.setImagem(rs.getString("imagem"));
                palestrante.setOrdem(rs.getInt("ordem"));
                palestrante.setTelefone(rs.getString("telefone"));
                palestrantes.add(palestrante);
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar palestrantes em destaque: " + e.getMessage());
            e.printStackTrace();
        }
        return palestrantes;
    }

    public void closeConnection() {
        try {
            if (this.connection != null && !this.connection.isClosed()) {
                this.connection.close();
            }
        } catch (SQLException e) {
            System.err.println("Erro ao fechar a conexão em PalestranteDAO: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
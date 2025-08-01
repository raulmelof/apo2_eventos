package dao;

import model.Usuario;
import model.NivelUsuario;
import database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    private Connection connection;

    public UsuarioDAO() {
        this.connection = new DBConnection().getConnection();
    }
    public Usuario autenticar(String email, String senhaDigitada) {
        String sql = "SELECT u.CPF, u.nome, u.email, u.telefone, u.statusEmail, u.formacao, u.uf, u.idNivelUsuario, nu.nomeNivel " +
                     "FROM usuario u " +
                     "JOIN nivelUsuario nu ON u.idNivelUsuario = nu.idNivelUsuario " +
                     "WHERE u.email = ? AND u.senha = ? AND u.ativo = 1";
        Usuario usuario = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, senhaDigitada);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setCpf(rs.getString("CPF"));
                    usuario.setNome(rs.getString("nome"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setTelefone(rs.getString("telefone"));
                    usuario.setStatusEmail(rs.getString("statusEmail"));
                    usuario.setFormacao(rs.getString("formacao"));
                    usuario.setUf(rs.getString("uf"));
                    
                    usuario.setIdNivelUsuario(rs.getInt("idNivelUsuario"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao autenticar usuário: " + e.getMessage());
        }
        return usuario;
    }

    public boolean emailJaExiste(String email) {
        String sql = "SELECT COUNT(*) FROM usuario WHERE email = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao verificar email: " + e.getMessage());
        }
        return false;
    }
    
    public boolean cpfJaExiste(String cpf) {
        String sql = "SELECT COUNT(*) FROM usuario WHERE CPF = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cpf);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao verificar CPF: " + e.getMessage());
        }
        return false;
    }
    public boolean usuarioCreate(Usuario usuario) {
        if (cpfJaExiste(usuario.getCpf())) {
            System.err.println("Erro: CPF já cadastrado.");
            return false;
        }
        if (emailJaExiste(usuario.getEmail())) {
            System.err.println("Erro: Email já cadastrado.");
            return false;
        }
        

        String sql = "INSERT INTO usuario (CPF, nome, email, telefone, senha, statusEmail, formacao, uf, idNivelUsuario) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, usuario.getCpf());
            stmt.setString(2, usuario.getNome());
            stmt.setString(3, usuario.getEmail());
            stmt.setString(4, usuario.getTelefone());
            stmt.setString(5, usuario.getSenha());
            stmt.setString(6, usuario.getStatusEmail());
            stmt.setString(7, usuario.getFormacao());
            
            if (usuario.getUf() != null) {
                stmt.setString(8, String.valueOf(usuario.getUf()));
            } else {
                stmt.setNull(8, java.sql.Types.CHAR);
            }
            
            stmt.setInt(9, usuario.getIdNivelUsuario());

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;

        } catch (SQLException e) {
            System.err.println("Erro ao inserir usuário: " + e.getMessage());
            return false;
        }
    }

    public Usuario buscarPorCPF(String cpf) {
        String sql = "SELECT u.CPF, u.nome, u.email, u.telefone, u.statusEmail, u.formacao, u.uf, u.idNivelUsuario, nu.nomeNivel " +
                     "FROM usuario u " +
                     "JOIN nivelUsuario nu ON u.idNivelUsuario = nu.idNivelUsuario " +
                     "WHERE u.CPF = ? AND u.ativo = 1";
        Usuario usuario = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cpf);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setCpf(rs.getString("CPF"));
                    usuario.setNome(rs.getString("nome"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setTelefone(rs.getString("telefone"));
                    usuario.setStatusEmail(rs.getString("statusEmail"));
                    usuario.setFormacao(rs.getString("formacao"));
                    usuario.setUf(rs.getString("uf"));
                    usuario.setIdNivelUsuario(rs.getInt("idNivelUsuario"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar usuário por CPF: " + e.getMessage());
        }
        return usuario;
    }

    public List<Usuario> usuarioReadAll(boolean incluirInativos) {
        String sql = "SELECT u.CPF, u.nome, u.email, u.telefone, u.statusEmail, u.formacao, u.uf, u.idNivelUsuario, nu.nomeNivel, u.ativo " +
                     "FROM usuario u " +
                     "LEFT JOIN nivelUsuario nu ON u.idNivelUsuario = nu.idNivelUsuario ";

        if (!incluirInativos) {
            sql += "WHERE u.ativo = 1 ";
        }
        sql += "ORDER BY u.nome";
        
        List<Usuario> usuarios = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setCpf(rs.getString("CPF"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setStatusEmail(rs.getString("statusEmail"));
                usuario.setFormacao(rs.getString("formacao"));
                usuario.setUf(rs.getString("uf"));
                usuario.setIdNivelUsuario(rs.getInt("idNivelUsuario"));
                usuario.setNomeNivel(rs.getString("nomeNivel"));
                usuario.setAtivo(rs.getInt("ativo"));
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            System.err.println("erro ao listar usuarios: " + e.getMessage());
            e.printStackTrace();
        }
        return usuarios;
    }
    
    public boolean usuarioDesativar(String cpf) {
        String sql = "UPDATE usuario SET ativo = 0 WHERE CPF = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cpf);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("erro ao desativar usuario: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean usuarioReativar(String cpf) {
        String sql = "UPDATE usuario SET ativo = 1 WHERE CPF = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cpf);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("erro ao reativar usuario: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean usuarioUpdate(Usuario usuario) {
        String sql = "UPDATE usuario SET nome = ?, email = ?, telefone = ?, formacao = ?, uf = ?, idNivelUsuario = ?, ativo = ? " +
                     "WHERE CPF = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getTelefone());
            stmt.setString(4, usuario.getFormacao());
            stmt.setString(5, usuario.getUf());
            stmt.setInt(6, usuario.getIdNivelUsuario());
            stmt.setInt(7, usuario.getAtivo());
            stmt.setString(8, usuario.getCpf());

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
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
            System.err.println("Erro ao fechar a conexão: " + e.getMessage());
        }
    }
}
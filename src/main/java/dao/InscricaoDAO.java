package dao;

import model.Inscricao;
import database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class InscricaoDAO {

    private Connection connection;

    public InscricaoDAO() {
        this.connection = new DBConnection().getConnection();
    }

    public boolean inscricaoJaExiste(String cpfUsuario, int idPalestra, int idEvento) {
        String sql = "SELECT COUNT(*) FROM inscricao WHERE cpfUsuario = ? AND idPalestra = ? AND idEvento = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cpfUsuario);
            stmt.setInt(2, idPalestra);
            stmt.setInt(3, idEvento);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao verificar se inscrição existe: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public int inscricaoCreate(Inscricao inscricao) {
        if (inscricaoJaExiste(inscricao.getCpfUsuario(), inscricao.getIdPalestra(), inscricao.getIdEvento())) {
            System.err.println("Erro: Usuário já inscrito nesta palestra para este evento.");
            return -1;
        }

        String sql = "INSERT INTO inscricao (cpfUsuario, idPalestra, presenca, dataInscricao, idEvento, statusCertificado, idCertificadoGerado) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        int generatedId = -1;

        try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, inscricao.getCpfUsuario());
            stmt.setInt(2, inscricao.getIdPalestra());
            stmt.setInt(3, inscricao.getPresenca());
            stmt.setTimestamp(4, Timestamp.valueOf(inscricao.getDataInscricao()));
            stmt.setInt(5, inscricao.getIdEvento());
            stmt.setString(6, inscricao.getStatusCertificado());

            if (inscricao.getIdCertificadoGerado() != null) {
                stmt.setInt(7, inscricao.getIdCertificadoGerado());
            } else {
                stmt.setNull(7, java.sql.Types.INTEGER);
            }


            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        generatedId = rs.getInt(1);
                        inscricao.setIdInscricao(generatedId);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao criar inscrição: " + e.getMessage());
            e.printStackTrace();
        }
        return generatedId;
    }

    public Inscricao inscricaoReadById(int idInscricao) {
        String sql = "SELECT * FROM inscricao WHERE idInscricao = ?";
        Inscricao inscricao = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idInscricao);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    inscricao = new Inscricao();
                    inscricao.setIdInscricao(rs.getInt("idInscricao"));
                    inscricao.setCpfUsuario(rs.getString("cpfUsuario"));
                    inscricao.setIdPalestra(rs.getInt("idPalestra"));
                    inscricao.setPresenca(rs.getInt("presenca"));
                    Timestamp dbDataInscricao = rs.getTimestamp("dataInscricao");
                    if (dbDataInscricao != null) {
                        inscricao.setDataInscricao(dbDataInscricao.toLocalDateTime());
                    }
                    inscricao.setIdEvento(rs.getInt("idEvento"));
                    inscricao.setStatusCertificado(rs.getString("statusCertificado"));
                    inscricao.setIdCertificadoGerado(rs.getInt("idCertificadoGerado"));
                    if (rs.wasNull()) {
                        inscricao.setIdCertificadoGerado(null);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar inscrição por ID: " + e.getMessage());
            e.printStackTrace();
        }
        return inscricao;
    }
    
    public Inscricao inscricaoReadByUsuarioPalestraEvento(String cpfUsuario, int idPalestra, int idEvento) {
        String sql = "SELECT * FROM inscricao WHERE cpfUsuario = ? AND idPalestra = ? AND idEvento = ?";
        Inscricao inscricao = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cpfUsuario);
            stmt.setInt(2, idPalestra);
            stmt.setInt(3, idEvento);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    inscricao = new Inscricao();
                    inscricao.setIdInscricao(rs.getInt("idInscricao"));
                    inscricao.setCpfUsuario(rs.getString("cpfUsuario"));
                    inscricao.setIdPalestra(rs.getInt("idPalestra"));
                    inscricao.setPresenca(rs.getInt("presenca"));
                    Timestamp dbDataInscricao = rs.getTimestamp("dataInscricao");
                    if (dbDataInscricao != null) {
                        inscricao.setDataInscricao(dbDataInscricao.toLocalDateTime());
                    }
                    inscricao.setIdEvento(rs.getInt("idEvento"));
                    inscricao.setStatusCertificado(rs.getString("statusCertificado"));
                    inscricao.setIdCertificadoGerado(rs.getInt("idCertificadoGerado"));
                    if (rs.wasNull()) {
                        inscricao.setIdCertificadoGerado(null);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar inscrição específica: " + e.getMessage());
            e.printStackTrace();
        }
        return inscricao;
    }


    public List<Inscricao> inscricoesReadByUsuario(String cpfUsuario) {
        String sql = "SELECT i.*, p.nomePalestra, p.dataPalestra, p.horarioInicio " +
                "FROM inscricao i " +
                "JOIN palestra p ON i.idPalestra = p.idPalestra " +
                "WHERE i.cpfUsuario = ? " +
                "ORDER BY p.dataPalestra, p.horarioInicio";
                
		   List<Inscricao> inscricoes = new ArrayList<>();
		
		   try (PreparedStatement stmt = connection.prepareStatement(sql)) {
		       stmt.setString(1, cpfUsuario);
		       try (ResultSet rs = stmt.executeQuery()) {
		           while (rs.next()) {
		               Inscricao inscricao = new Inscricao();
		               
		               inscricao.setIdInscricao(rs.getInt("idInscricao"));
		               inscricao.setCpfUsuario(rs.getString("cpfUsuario"));
		               inscricao.setIdPalestra(rs.getInt("idPalestra"));
		               inscricao.setPresenca(rs.getInt("presenca"));
		               Timestamp dbDataInscricao = rs.getTimestamp("dataInscricao");
		               if (dbDataInscricao != null) {
		                   inscricao.setDataInscricao(dbDataInscricao.toLocalDateTime());
		               }
		               inscricao.setIdEvento(rs.getInt("idEvento"));
		               inscricao.setStatusCertificado(rs.getString("statusCertificado"));
		               inscricao.setIdCertificadoGerado(rs.getInt("idCertificadoGerado"));
		               if (rs.wasNull()) {
		                    inscricao.setIdCertificadoGerado(null);
		               }
		
		               inscricao.setNomePalestra(rs.getString("nomePalestra"));
		               inscricao.setDataPalestra(rs.getDate("dataPalestra").toLocalDate());
		               inscricao.setHorarioInicio(rs.getTime("horarioInicio").toLocalTime());
		
		               inscricoes.add(inscricao);
		           }
		       }
		   } catch (SQLException e) {
		       System.err.println("Erro ao listar inscrições por usuário: " + e.getMessage());
		       e.printStackTrace();
		   }
		   return inscricoes;
    }
    
    public List<Inscricao> inscricoesReadByPalestra(int idPalestra) {
        String sql = "SELECT * FROM inscricao WHERE idPalestra = ? ORDER BY dataInscricao";
        List<Inscricao> inscricoes = new ArrayList<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idPalestra);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Inscricao inscricao = new Inscricao();
                    inscricao.setIdInscricao(rs.getInt("idInscricao"));
                    inscricao.setCpfUsuario(rs.getString("cpfUsuario"));
                    inscricao.setIdPalestra(rs.getInt("idPalestra"));
                    inscricao.setPresenca(rs.getInt("presenca"));
                    Timestamp dbDataInscricao = rs.getTimestamp("dataInscricao");
                    if (dbDataInscricao != null) {
                        inscricao.setDataInscricao(dbDataInscricao.toLocalDateTime());
                    }
                    inscricao.setIdEvento(rs.getInt("idEvento"));
                    inscricao.setStatusCertificado(rs.getString("statusCertificado"));
                    inscricao.setIdCertificadoGerado(rs.getInt("idCertificadoGerado"));
                     if (rs.wasNull()) {
                        inscricao.setIdCertificadoGerado(null);
                    }
                    inscricoes.add(inscricao);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar inscrições por palestra: " + e.getMessage());
            e.printStackTrace();
        }
        return inscricoes;
    }

    public boolean inscricaoUpdatePresenca(int idInscricao, int presenca) {
        String novoStatusCertificado = (presenca == 1) ? "Apto Emissao" : "Aguardando Presenca";
        String sql = "UPDATE inscricao SET presenca = ?, statusCertificado = ? WHERE idInscricao = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, presenca);
            stmt.setString(2, novoStatusCertificado);
            stmt.setInt(3, idInscricao);

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao atualizar presença da inscrição: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean inscricaoUpdateCertificadoGerado(int idInscricao, int idCertificadoGerado) {
        String sql = "UPDATE inscricao SET idCertificadoGerado = ?, statusCertificado = 'Emitido' WHERE idInscricao = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idCertificadoGerado);
            stmt.setInt(2, idInscricao);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao atualizar ID do certificado gerado na inscrição: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }


    public boolean inscricaoDelete(int idInscricao) {
        String sql = "DELETE FROM inscricao WHERE idInscricao = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idInscricao);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao deletar inscrição: " + e.getMessage());
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
            System.err.println("Erro ao fechar a conexão em InscricaoDAO: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
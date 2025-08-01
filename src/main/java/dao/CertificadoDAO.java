package dao;

import model.Certificado;
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

public class CertificadoDAO {

    private Connection connection;

    public CertificadoDAO() {
        this.connection = new DBConnection().getConnection();
    }

    public boolean certificadoJaExiste(String cpfUsuario, int idPalestra) {
        String sql = "SELECT COUNT(*) FROM certificado WHERE cpfUsuario = ? AND idPalestra = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cpfUsuario);
            stmt.setInt(2, idPalestra);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao verificar se certificado existe: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public int certificadoCreate(Certificado certificado) {
        if (certificadoJaExiste(certificado.getCpfUsuario(), certificado.getIdPalestra())) {
            System.err.println("Erro: Certificado já emitido para este usuário e palestra.");
            return -1;
        }

        String sql = "INSERT INTO certificado (cpfUsuario, idPalestra, codigoValidacao, dataEmissao, caminhoArquivoPDF) " +
                     "VALUES (?, ?, ?, ?, ?)";
        int generatedId = -1;

        try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, certificado.getCpfUsuario());
            stmt.setInt(2, certificado.getIdPalestra());
            stmt.setString(3, certificado.getCodigoValidacao());
            stmt.setTimestamp(4, Timestamp.valueOf(certificado.getDataEmissao()));
            stmt.setString(5, certificado.getCaminhoArquivoPDF());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        generatedId = rs.getInt(1);
                        certificado.setIdCertificado(generatedId);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao criar certificado: " + e.getMessage());
            e.printStackTrace();
        }
        return generatedId;
    }

    public Certificado certificadoReadById(int idCertificado) {
        String sql = "SELECT * FROM certificado WHERE idCertificado = ?";
        Certificado certificado = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idCertificado);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    certificado = new Certificado();
                    certificado.setIdCertificado(rs.getInt("idCertificado"));
                    certificado.setCpfUsuario(rs.getString("cpfUsuario"));
                    certificado.setIdPalestra(rs.getInt("idPalestra"));
                    certificado.setCodigoValidacao(rs.getString("codigoValidacao"));
                    Timestamp dbDataEmissao = rs.getTimestamp("dataEmissao");
                    if (dbDataEmissao != null) {
                        certificado.setDataEmissao(dbDataEmissao.toLocalDateTime());
                    }
                    certificado.setCaminhoArquivoPDF(rs.getString("caminhoArquivoPDF"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar certificado por ID: " + e.getMessage());
            e.printStackTrace();
        }
        return certificado;
    }

    public Certificado certificadoReadByUsuarioAndPalestra(String cpfUsuario, int idPalestra) {
        String sql = "SELECT * FROM certificado WHERE cpfUsuario = ? AND idPalestra = ?";
        Certificado certificado = null;
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cpfUsuario);
            stmt.setInt(2, idPalestra);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    certificado = new Certificado();
                    certificado.setIdCertificado(rs.getInt("idCertificado"));
                    certificado.setCpfUsuario(rs.getString("cpfUsuario"));
                    certificado.setIdPalestra(rs.getInt("idPalestra"));
                    certificado.setCodigoValidacao(rs.getString("codigoValidacao"));
                    Timestamp dbDataEmissao = rs.getTimestamp("dataEmissao");
                    if (dbDataEmissao != null) {
                        certificado.setDataEmissao(dbDataEmissao.toLocalDateTime());
                    }
                    certificado.setCaminhoArquivoPDF(rs.getString("caminhoArquivoPDF"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar certificado por usuário e palestra: " + e.getMessage());
            e.printStackTrace();
        }
        return certificado;
    }
    
    public List<Certificado> certificadosReadByUsuario(String cpfUsuario) {
        String sql = "SELECT c.*, p.nomePalestra, p.dataPalestra " +
                     "FROM certificado c " +
                     "JOIN palestra p ON c.idPalestra = p.idPalestra " +
                     "WHERE c.cpfUsuario = ? " +
                     "ORDER BY c.dataEmissao DESC";
                     
        List<Certificado> certificados = new ArrayList<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cpfUsuario);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Certificado certificado = new Certificado();
                    
                    certificado.setIdCertificado(rs.getInt("idCertificado"));
                    certificado.setCpfUsuario(rs.getString("cpfUsuario"));
                    certificado.setIdPalestra(rs.getInt("idPalestra"));
                    certificado.setCodigoValidacao(rs.getString("codigoValidacao"));
                    Timestamp dbDataEmissao = rs.getTimestamp("dataEmissao");
                    if (dbDataEmissao != null) {
                        certificado.setDataEmissao(dbDataEmissao.toLocalDateTime());
                    }
                    certificado.setCaminhoArquivoPDF(rs.getString("caminhoArquivoPDF"));
                    
                    certificado.setNomePalestra(rs.getString("nomePalestra"));
                    certificado.setDataPalestra(rs.getDate("dataPalestra").toLocalDate());

                    certificados.add(certificado);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar certificados por usuário: " + e.getMessage());
            e.printStackTrace();
        }
        return certificados;
    }

    public Certificado certificadoReadByCodigoValidacao(String codigoValidacao) {
        String sql = "SELECT cert.*, u.nome as nomeUsuario, p.nomePalestra, p.cargaHoraria " +
                     "FROM certificado cert " +
                     "JOIN usuario u ON cert.cpfUsuario = u.CPF " +
                     "JOIN palestra p ON cert.idPalestra = p.idPalestra " +
                     "WHERE cert.codigoValidacao = ?";
        Certificado certificado = null;
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, codigoValidacao);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    certificado = new Certificado();
                    certificado.setIdCertificado(rs.getInt("idCertificado"));
                    certificado.setCpfUsuario(rs.getString("cpfUsuario"));
                    certificado.setIdPalestra(rs.getInt("idPalestra"));
                    certificado.setCodigoValidacao(rs.getString("codigoValidacao"));
                    Timestamp dbDataEmissao = rs.getTimestamp("dataEmissao");
                    if (dbDataEmissao != null) {
                        certificado.setDataEmissao(dbDataEmissao.toLocalDateTime());
                    }
                    certificado.setCaminhoArquivoPDF(rs.getString("caminhoArquivoPDF"));

                    certificado.setNomeUsuario(rs.getString("nomeUsuario"));
                    certificado.setNomePalestra(rs.getString("nomePalestra"));
                    certificado.setCargaHorariaPalestra(rs.getString("cargaHoraria"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar certificado por código de validação: " + e.getMessage());
            e.printStackTrace();
        }
        return certificado;
    }

    public void closeConnection() {
        try {
            if (this.connection != null && !this.connection.isClosed()) {
                this.connection.close();
            }
        } catch (SQLException e) {
            System.err.println("Erro ao fechar a conexão em CertificadoDAO: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
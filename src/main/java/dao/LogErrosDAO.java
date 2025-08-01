package dao;

import model.LogErros;
import database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

public class LogErrosDAO {

    private Connection connection;

    public LogErrosDAO() {
        this.connection = new DBConnection().getConnection();
    }

    public boolean logErroCreate(LogErros log) {
        String sql = "INSERT INTO logErros (logData, logDescricao, ip, cpfUsuario) VALUES (?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            if (log.getLogData() != null) {
                 stmt.setTimestamp(1, Timestamp.valueOf(log.getLogData()));
            } else {
                 stmt.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
            }
            stmt.setString(2, log.getLogDescricao());
            stmt.setString(3, log.getIp());
            stmt.setString(4, log.getCpfUsuario());

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao criar log de erro: " + e.getMessage());
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
            System.err.println("Erro ao fechar a conexão em LogErrosDAO: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
package dao;

import model.Evento;
import database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class EventoDAO {

    private Connection connection;

    public EventoDAO() {
        this.connection = new DBConnection().getConnection();
    }

    public int eventoCreate(Evento evento) {
        String sql = "INSERT INTO evento (nomeEvento, dataInicio, dataFim, ativo, linkPesquisa) VALUES (?, ?, ?, ?, ?)";
        int generatedId = -1;

        try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, evento.getNomeEvento());
            stmt.setDate(2, Date.valueOf(evento.getDataInicio()));
            stmt.setDate(3, Date.valueOf(evento.getDataFim()));
            stmt.setInt(4, evento.getAtivo());
            stmt.setString(5, evento.getLinkPesquisa());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        generatedId = rs.getInt(1);
                        evento.setIdEvento(generatedId);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return generatedId;
    }

    public Evento eventoReadById(int idEvento) {
        String sql = "SELECT * FROM evento WHERE idEvento = ?";
        Evento evento = null;
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idEvento);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    evento = new Evento();
                    evento.setIdEvento(rs.getInt("idEvento"));
                    evento.setNomeEvento(rs.getString("nomeEvento"));
                    Date dbDataInicio = rs.getDate("dataInicio");
                    if (dbDataInicio != null) evento.setDataInicio(dbDataInicio.toLocalDate());
                    Date dbDataFim = rs.getDate("dataFim");
                    if (dbDataFim != null) evento.setDataFim(dbDataFim.toLocalDate());
                    evento.setAtivo(rs.getInt("ativo"));
                    evento.setLinkPesquisa(rs.getString("linkPesquisa"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return evento;
    }

    public List<Evento> eventoReadAll() {
        String sql = "SELECT * FROM evento ORDER BY dataInicio DESC";
        List<Evento> eventos = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Evento evento = new Evento();
                evento.setIdEvento(rs.getInt("idEvento"));
                evento.setNomeEvento(rs.getString("nomeEvento"));
                Date dbDataInicio = rs.getDate("dataInicio");
                if (dbDataInicio != null) evento.setDataInicio(dbDataInicio.toLocalDate());
                Date dbDataFim = rs.getDate("dataFim");
                if (dbDataFim != null) evento.setDataFim(dbDataFim.toLocalDate());
                evento.setAtivo(rs.getInt("ativo"));
                evento.setLinkPesquisa(rs.getString("linkPesquisa"));
                eventos.add(evento);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return eventos;
    }

    public boolean eventoUpdate(Evento evento) {
        String sql = "UPDATE evento SET nomeEvento = ?, dataInicio = ?, dataFim = ?, ativo = ?, linkPesquisa = ? WHERE idEvento = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, evento.getNomeEvento());
            stmt.setDate(2, Date.valueOf(evento.getDataInicio()));
            stmt.setDate(3, Date.valueOf(evento.getDataFim()));
            stmt.setInt(4, evento.getAtivo());
            stmt.setString(5, evento.getLinkPesquisa());
            stmt.setInt(6, evento.getIdEvento());
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eventoDesativar(int idEvento) {
        String sql = "UPDATE evento SET ativo = 0 WHERE idEvento = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idEvento);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eventoReativar(int idEvento) {
        String sql = "UPDATE evento SET ativo = 1 WHERE idEvento = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idEvento);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public Evento eventoReadActive() {
        String sql = "SELECT * FROM evento WHERE ativo = 1 LIMIT 1";
        Evento evento = null;
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    evento = new Evento();
                    evento.setIdEvento(rs.getInt("idEvento"));
                    evento.setNomeEvento(rs.getString("nomeEvento"));
                    Date dbDataInicio = rs.getDate("dataInicio");
                    if (dbDataInicio != null) evento.setDataInicio(dbDataInicio.toLocalDate());
                    Date dbDataFim = rs.getDate("dataFim");
                    if (dbDataFim != null) evento.setDataFim(dbDataFim.toLocalDate());
                    evento.setAtivo(rs.getInt("ativo"));
                    evento.setLinkPesquisa(rs.getString("linkPesquisa"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return evento;
    }

    public void closeConnection() {
        try {
            if (this.connection != null && !this.connection.isClosed()) {
                this.connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
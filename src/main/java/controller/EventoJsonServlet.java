package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dao.EventoDAO;
import model.Evento;
import java.time.LocalDate;
import util.LocalDateAdapter;

@WebServlet("/EventoJsonServlet")
public class EventoJsonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        EventoDAO eventoDAO = null;
        String json = "";
        Gson gson = new GsonBuilder()
                        .registerTypeAdapter(LocalDate.class, new LocalDateAdapter())
                        .create();
        
        try {
            eventoDAO = new EventoDAO();
            String idEventoStr = request.getParameter("idEvento");

            if (idEventoStr != null && !idEventoStr.isEmpty()) {
                int idEvento = Integer.parseInt(idEventoStr);
                Evento evento = eventoDAO.eventoReadById(idEvento);
                json = gson.toJson(evento);
            } else {
                List<Evento> listaEventos = eventoDAO.eventoReadAll();
                json = "{\"data\": " + gson.toJson(listaEventos) + "}";
            }
            
            out.print(json);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"" + e.getMessage() + "\"}");
        } finally {
            if (eventoDAO != null) {
                eventoDAO.closeConnection();
            }
            out.flush();
        }
    }
}
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.LocalTime;
import util.LocalDateAdapter;
import util.LocalTimeAdapter;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import dao.EventoDAO;
import dao.PalestraDAO;
import model.Evento;
import model.Palestra;

@WebServlet("/PalestraJsonServlet")
public class PalestraJsonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        PalestraDAO palestraDAO = null;
        EventoDAO eventoDAO = null;
        String json = "";
        
        try {
            palestraDAO = new PalestraDAO();
            eventoDAO = new EventoDAO();
            
            Evento eventoAtivo = eventoDAO.eventoReadActive();
            List<Palestra> listaPalestras = new ArrayList<>();
            
            if (eventoAtivo != null) {
                listaPalestras = palestraDAO.palestraReadAllByEvento(eventoAtivo.getIdEvento());
            }
            
            Gson gson = new GsonBuilder()
                            .registerTypeAdapter(LocalDate.class, new LocalDateAdapter())
                            .registerTypeAdapter(LocalTime.class, new LocalTimeAdapter())
                            .create();
            
            json = gson.toJson(listaPalestras);
            
            out.print(json);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"" + e.getMessage().replace("\"", "'") + "\"}");
        } finally {
            if (palestraDAO != null) {
                palestraDAO.closeConnection();
            }
            if (eventoDAO != null) {
                eventoDAO.closeConnection();
            }
            out.flush();
        }
    }
}
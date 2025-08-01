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

import dao.PalestranteDAO;
import model.Palestrante;


@WebServlet("/PalestranteJsonServlet")
public class PalestranteJsonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        PalestranteDAO palestranteDAO = null;
        String json = "";
        Gson gson = new Gson();
        
        try {
            palestranteDAO = new PalestranteDAO();
            
            List<Palestrante> listaPalestrantes = palestranteDAO.listarDestaques();
            
            json = gson.toJson(listaPalestrantes);
            
            out.print(json);

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"" + e.getMessage() + "\"}");
        } finally {
            if (palestranteDAO != null) {
                palestranteDAO.closeConnection();
            }
            out.flush();
        }
    }
}
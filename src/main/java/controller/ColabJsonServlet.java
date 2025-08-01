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

import dao.ColabDAO;
import model.Colab;

@WebServlet("/ColabJsonServlet")
public class ColabJsonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        ColabDAO colabDAO = null;
        try {
            colabDAO = new ColabDAO();
            List<Colab> listaColabs = colabDAO.colabReadAll();

            Gson gson = new Gson();
            String json = "{\"data\": " + gson.toJson(listaColabs) + "}";
            
            out.print(json);

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"" + e.getMessage() + "\"}");
        } finally {
            if (colabDAO != null) {
                colabDAO.closeConnection();
            }
            out.flush();
        }
    }
}
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

import dao.UsuarioDAO;
import model.Usuario;

@WebServlet("/UsuarioJsonServlet")
public class UsuarioJsonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        UsuarioDAO usuarioDAO = null;
        String json = "";
        Gson gson = new Gson();
        
        try {
            usuarioDAO = new UsuarioDAO();
            String cpf = request.getParameter("cpf");

            if (cpf != null && !cpf.isEmpty()) {
                Usuario usuario = usuarioDAO.buscarPorCPF(cpf); 
                json = gson.toJson(usuario);
            } else {
                List<Usuario> listaUsuarios = usuarioDAO.usuarioReadAll(true);
                json = "{\"data\": " + gson.toJson(listaUsuarios) + "}";
            }
            
            out.print(json);

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"" + e.getMessage() + "\"}");
        } finally {
            if (usuarioDAO != null) {
                usuarioDAO.closeConnection();
            }
            out.flush();
        }
    }
}
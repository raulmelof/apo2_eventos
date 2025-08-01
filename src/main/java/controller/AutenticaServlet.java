package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsuarioDAO;
import model.Usuario;

@WebServlet("/AutenticaServlet")
public class AutenticaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AutenticaServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        
        if (email == null || email.trim().isEmpty() || senha == null || senha.trim().isEmpty()) {
            request.setAttribute("mensagemErro", "Email e senha são obrigatórios!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        UsuarioDAO usuarioDAO = null;
        try {
            usuarioDAO = new UsuarioDAO();
            Usuario usuarioAutenticado = usuarioDAO.autenticar(email, senha);

            if (usuarioAutenticado != null) {
                HttpSession session = request.getSession();
                session.setAttribute("usuarioLogado", usuarioAutenticado);
                session.setAttribute("nomeUsuario", usuarioAutenticado.getNome());
                session.setAttribute("nivelUsuarioId", usuarioAutenticado.getIdNivelUsuario());

                response.sendRedirect("index.jsp");

            } else {
                request.setAttribute("mensagemErro", "Email ou senha inválidos!");
                
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensagemErro", "Ocorreu um erro no sistema. Tente novamente.");
            
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } finally {
            if (usuarioDAO != null) {
                usuarioDAO.closeConnection();
            }
        }
    }
}
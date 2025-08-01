package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsuarioDAO;
import model.Usuario;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String redirectPage = request.getContextPath() + "/admin/admin_usuario.jsp";
        UsuarioDAO usuarioDAO = new UsuarioDAO();

        try {
            if ("create".equals(action)) {
                Usuario novoUsuario = new Usuario();
                novoUsuario.setCpf(request.getParameter("cpf"));
                novoUsuario.setNome(request.getParameter("nome"));
                novoUsuario.setEmail(request.getParameter("email"));
                novoUsuario.setSenha(request.getParameter("senha"));
                novoUsuario.setTelefone(request.getParameter("telefone"));
                novoUsuario.setFormacao(request.getParameter("formacao"));
                novoUsuario.setUf(request.getParameter("uf"));
                novoUsuario.setIdNivelUsuario(Integer.parseInt(request.getParameter("idNivelUsuario")));
                novoUsuario.setStatusEmail("Pendente");

                if(usuarioDAO.usuarioCreate(novoUsuario)) redirectPage += "?status=create_success";
                else redirectPage += "?status=create_error";

            } else if ("register".equals(action)) {
                Usuario novoUsuario = new Usuario();
                novoUsuario.setCpf(request.getParameter("cpf"));
                novoUsuario.setNome(request.getParameter("nome"));
                novoUsuario.setEmail(request.getParameter("email"));
                novoUsuario.setSenha(request.getParameter("senha"));
                novoUsuario.setTelefone(request.getParameter("celular"));
                novoUsuario.setFormacao(request.getParameter("formacao"));
                novoUsuario.setUf(request.getParameter("uf"));
                novoUsuario.setStatusEmail("Pendente");

                novoUsuario.setIdNivelUsuario(2);
                
                
               

                if (usuarioDAO.usuarioCreate(novoUsuario)) {
                    redirectPage = request.getContextPath() + "/login.jsp?status=register_success";
                } else {
                    redirectPage = request.getContextPath() + "/index.jsp?status=register_error";
                }
                } else if ("update".equals(action)) {
                Usuario usuarioEditado = new Usuario();
                usuarioEditado.setCpf(request.getParameter("cpf"));
                usuarioEditado.setNome(request.getParameter("nome"));
                usuarioEditado.setEmail(request.getParameter("email"));
                usuarioEditado.setTelefone(request.getParameter("telefone"));
                usuarioEditado.setFormacao(request.getParameter("formacao"));
                usuarioEditado.setUf(request.getParameter("uf"));
                usuarioEditado.setIdNivelUsuario(Integer.parseInt(request.getParameter("idNivelUsuario")));
                usuarioEditado.setAtivo(Integer.parseInt(request.getParameter("ativo")));
                
                if(usuarioDAO.usuarioUpdate(usuarioEditado)) redirectPage += "?status=update_success";
                else redirectPage += "?status=update_error";

            } else if ("delete".equals(action)) {
                String cpfParaDeletar = request.getParameter("cpf");
                if(usuarioDAO.usuarioDesativar(cpfParaDeletar)) {
                    redirectPage += "?status=deactivate_success";
                } else {
                    redirectPage += "?status=deactivate_error";
                }
            } else if ("reactivate".equals(action)) {
                String cpfParaReativar = request.getParameter("cpf");
                if(usuarioDAO.usuarioReativar(cpfParaReativar)) {
                    redirectPage += "?status=reactivate_success";
                } else {
                    redirectPage += "?status=reactivate_error";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectPage += "?status=system_error";
        } finally {
            usuarioDAO.closeConnection();
        }
        response.sendRedirect(redirectPage);
    }
}
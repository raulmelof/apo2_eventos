package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.InscricaoDAO;
import model.Inscricao;
import model.Usuario;

@WebServlet("/InscricaoServlet")
public class InscricaoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JsonObject jsonResponse = new JsonObject();
        
        HttpSession session = request.getSession(false);
        Usuario usuarioLogado = (session != null) ? (Usuario) session.getAttribute("usuarioLogado") : null;

        if (usuarioLogado == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Usuário não autenticado. Por favor, faça o login.");
            out.print(jsonResponse.toString());
            out.flush();
            return;
        }

        try {
            int idPalestra = Integer.parseInt(request.getParameter("idPalestra"));
            
            int idEvento = 1; 

            Inscricao novaInscricao = new Inscricao();
            novaInscricao.setCpfUsuario(usuarioLogado.getCpf());
            novaInscricao.setIdPalestra(idPalestra);
            novaInscricao.setIdEvento(idEvento);
            novaInscricao.setDataInscricao(LocalDateTime.now());
            novaInscricao.setPresenca(0);
            novaInscricao.setStatusCertificado("Aguardando Presenca");
            
            InscricaoDAO inscricaoDAO = new InscricaoDAO();
            int novoId = inscricaoDAO.inscricaoCreate(novaInscricao);
            inscricaoDAO.closeConnection();

            if (novoId > 0) {
                jsonResponse.addProperty("status", "success");
                jsonResponse.addProperty("message", "Inscrição realizada com sucesso!");
            } else {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "Você já está inscrito nesta palestra.");
            }

        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "ID da palestra inválido.");
            e.printStackTrace();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Ocorreu um erro no servidor. Tente novamente.");
            e.printStackTrace();
        }

        out.print(jsonResponse.toString());
        out.flush();
    }
}
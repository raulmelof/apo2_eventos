package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;

import com.google.gson.JsonObject;

import dao.InscricaoDAO;
import model.Inscricao;
import model.Usuario;
import dao.CertificadoDAO;
import model.Certificado;
import java.util.UUID;


@WebServlet("/admin/CheckinServlet")
public class CheckinServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JsonObject jsonResponse = new JsonObject();
        
        HttpSession session = request.getSession(false);
        Usuario adminLogado = (session != null) ? (Usuario) session.getAttribute("usuarioLogado") : null;

        if (adminLogado == null || adminLogado.getIdNivelUsuario() != 1) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Acesso negado. Apenas administradores podem realizar check-in.");
            out.print(jsonResponse.toString());
            out.flush();
            return;
        }

        InscricaoDAO inscricaoDAO = null;
        
        try {
            String cpfUsuario = request.getParameter("cpfUsuario");
            int idPalestra = Integer.parseInt(request.getParameter("idPalestra"));
            int idEvento = 1;

            inscricaoDAO = new InscricaoDAO();
            Inscricao inscricao = inscricaoDAO.inscricaoReadByUsuarioPalestraEvento(cpfUsuario, idPalestra, idEvento);

            if (inscricao == null) {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "Este participante não está inscrito nesta palestra.");
            } else if (inscricao.getPresenca() == 1) {
                jsonResponse.addProperty("status", "info");
                jsonResponse.addProperty("message", "Check-in para este participante já foi realizado anteriormente.");
            } else {
                boolean sucessoPresenca = inscricaoDAO.inscricaoUpdatePresenca(inscricao.getIdInscricao(), 1);
                
                if (sucessoPresenca) {
                    CertificadoDAO certificadoDAO = new CertificadoDAO();
                    Certificado novoCertificado = new Certificado();

                    novoCertificado.setCpfUsuario(cpfUsuario);
                    novoCertificado.setIdPalestra(idPalestra);
                    novoCertificado.setDataEmissao(LocalDateTime.now());
                    
                    novoCertificado.setCodigoValidacao(UUID.randomUUID().toString());
                    
                    int idCertificadoGerado = certificadoDAO.certificadoCreate(novoCertificado);
                    certificadoDAO.closeConnection();

                    if (idCertificadoGerado > 0) {
                        inscricaoDAO.inscricaoUpdateCertificadoGerado(inscricao.getIdInscricao(), idCertificadoGerado);
                        
                        jsonResponse.addProperty("status", "success");
                        jsonResponse.addProperty("message", "Check-in e certificado de '" + inscricao.getCpfUsuario() + "' gerados com sucesso!");
                    } else {
                        throw new Exception("Falha ao criar o registro do certificado.");
                    }

                } else {
                    throw new Exception("Falha ao atualizar a presença no banco de dados.");
                }
            }

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Ocorreu um erro no servidor: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (inscricaoDAO != null) {
                inscricaoDAO.closeConnection();
            }
            out.print(jsonResponse.toString());
            out.flush();
        }
    }
}
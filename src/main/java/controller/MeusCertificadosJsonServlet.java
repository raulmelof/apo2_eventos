package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import dao.CertificadoDAO;
import model.Certificado;
import model.Usuario;
import util.LocalDateAdapter;
import util.LocalDateTimeAdapter;
import util.LocalTimeAdapter;

@WebServlet("/MeusCertificadosJsonServlet")
public class MeusCertificadosJsonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        Usuario usuarioLogado = (session != null) ? (Usuario) session.getAttribute("usuarioLogado") : null;

        if (usuarioLogado == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            out.print("{\"error\":\"Acesso não autorizado.\"}");
            out.flush();
            return;
        }

        CertificadoDAO certificadoDAO = null;
        try {
            certificadoDAO = new CertificadoDAO();
            List<Certificado> meusCertificados = certificadoDAO.certificadosReadByUsuario(usuarioLogado.getCpf());

            Gson gson = new GsonBuilder()
                            .registerTypeAdapter(LocalDate.class, new LocalDateAdapter())
                            .registerTypeAdapter(LocalTime.class, new LocalTimeAdapter())
                            .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                            .create();
            
            String json = gson.toJson(meusCertificados);
            out.print(json);

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\":\"Ocorreu um erro no servidor.\"}");
            e.printStackTrace();
        } finally {
            if (certificadoDAO != null) {
                certificadoDAO.closeConnection();
            }
            out.flush();
        }
    }
}
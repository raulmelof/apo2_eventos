package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.EventoDAO;
import model.Evento;

@WebServlet("/EventoServlet")
public class EventoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        String redirectPage = request.getContextPath() + "/admin/admin_evento.jsp";
        EventoDAO eventoDAO = new EventoDAO();

        try {
            if ("create".equals(action)) {
                String nomeEvento = request.getParameter("nomeEvento");
                LocalDate dataInicio = LocalDate.parse(request.getParameter("dataInicio"));
                LocalDate dataFim = LocalDate.parse(request.getParameter("dataFim"));
                String linkPesquisa = request.getParameter("linkPesquisa");
                int ativo = (request.getParameter("ativo") != null && request.getParameter("ativo").equals("1")) ? 1 : 0;
                
                Evento novoEvento = new Evento();
                novoEvento.setNomeEvento(nomeEvento);
                novoEvento.setDataInicio(dataInicio);
                novoEvento.setDataFim(dataFim);
                novoEvento.setLinkPesquisa(linkPesquisa);
                novoEvento.setAtivo(ativo);
                
                if(eventoDAO.eventoCreate(novoEvento) > 0) redirectPage += "?status=create_success";
                else redirectPage += "?status=create_error";

            } else if ("update".equals(action)) {
                int idEvento = Integer.parseInt(request.getParameter("idEvento"));
                String nomeEvento = request.getParameter("nomeEvento");
                LocalDate dataInicio = LocalDate.parse(request.getParameter("dataInicio"));
                LocalDate dataFim = LocalDate.parse(request.getParameter("dataFim"));
                String linkPesquisa = request.getParameter("linkPesquisa");
                int ativo = (request.getParameter("ativo") != null && request.getParameter("ativo").equals("1")) ? 1 : 0;
                
                Evento eventoEditado = new Evento();
                eventoEditado.setIdEvento(idEvento);
                eventoEditado.setNomeEvento(nomeEvento);
                eventoEditado.setDataInicio(dataInicio);
                eventoEditado.setDataFim(dataFim);
                eventoEditado.setLinkPesquisa(linkPesquisa);
                eventoEditado.setAtivo(ativo);

                if(eventoDAO.eventoUpdate(eventoEditado)) redirectPage += "?status=update_success";
                else redirectPage += "?status=update_error";

            } else if ("delete".equals(action)) {
                int idEvento = Integer.parseInt(request.getParameter("idEvento"));
                if(eventoDAO.eventoDesativar(idEvento)) redirectPage += "?status=deactivate_success";
                else redirectPage += "?status=deactivate_error";

            } else if ("reactivate".equals(action)) {
                 int idEvento = Integer.parseInt(request.getParameter("idEvento"));
                 if(eventoDAO.eventoReativar(idEvento)) redirectPage += "?status=reactivate_success";
                 else redirectPage += "?status=reactivate_error";
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectPage += "?status=system_error";
        } finally {
            eventoDAO.closeConnection();
        }
        
        response.sendRedirect(redirectPage);
    }
}
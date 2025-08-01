<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Certificado, dao.CertificadoDAO, java.time.format.DateTimeFormatter" %>
<%
    String codigo = request.getParameter("codigo");
    Certificado certificado = null;
    String erro = null;

    if (codigo == null || codigo.trim().isEmpty()) {
        erro = "Código de validação não fornecido.";
    } else {
        CertificadoDAO dao = new CertificadoDAO();
        try {
            certificado = dao.certificadoReadByCodigoValidacao(codigo);
            if (certificado == null) {
                erro = "Certificado inválido ou não encontrado.";
            }
        } catch (Exception e) {
            erro = "Ocorreu um erro ao buscar os dados do certificado.";
            e.printStackTrace();
        } finally {
            dao.closeConnection();
        }
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certificado de Participação</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f0f0f0; }
        .certificate-container { 
            max-width: 800px; 
            margin: 50px auto; 
            padding: 40px; 
            border: 10px solid #0d6efd; 
            background: white; 
            font-family: 'Times New Roman', serif;
        }
        .certificate-title { font-size: 3rem; font-weight: bold; color: #0d6efd; }
        .certificate-text { font-size: 1.2rem; line-height: 1.8; }
        .certificate-footer { margin-top: 50px; }
        @media print {
            body { background-color: white; }
            .no-print { display: none; }
            .certificate-container { margin: 0; border: 5px solid black; }
        }
    </style>
</head>
<body>

    <div class="container text-center">
        <% if (erro != null) { %>
            <div class="alert alert-danger mt-5" style="max-width: 800px; margin: auto;"><%= erro %></div>
        <% } else { %>
            <div class="certificate-container">
                <h1 class="certificate-title">CERTIFICADO</h1>
                <p class="lead mt-4">Certificamos que</p>
                <h2 class="display-5 my-3"><%= certificado.getNomeUsuario() %></h2>
                <p class="certificate-text">
                    participou da palestra <strong>"<%= certificado.getNomePalestra() %>"</strong>,
                    com carga horária de <%= certificado.getCargaHorariaPalestra() %>,
                    realizada durante o evento ENCOAD.
                </p>
                <div class="certificate-footer">
                    <p>Emitido em: <%= certificado.getDataEmissao().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %></p>
                    <hr>
                    <p class="text-muted small">Código de Validação: <%= certificado.getCodigoValidacao() %></p>
                </div>
            </div>
            <button onclick="window.print()" class="btn btn-primary mt-4 no-print">Imprimir Certificado</button>
        <% } %>
    </div>

</body>
</html>
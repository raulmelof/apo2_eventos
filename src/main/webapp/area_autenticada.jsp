<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Usuario" %>
<%
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
    if (usuarioLogado == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minha Área - <%= usuarioLogado.getNome() %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
    <style type="text/css">
    
    .navbar {

    background: black;
    height: 5.5%;
    position: -webkit-sticky;
    position: sticky;
    top: 0;
    z-index: 1000;

}

.navbar-brand {

    color: rgb(255, 255, 255);
    font-weight: 700;

}

.nav-link {

    font-weight: 700;
    color: rgba(255, 255, 255, 0.87);

}
    
    </style>
    
</head>
<body>
    <jsp:include page="common/navbar.jsp" />

    <div class="container my-5">
        <h1 class="mb-4">Minha Área</h1>
        
        <div class="card">
            <div class="card-header">
                <h3>Bem-vindo(a), <%= usuarioLogado.getNome() %>!</h3>
            </div>
            <div class="card-body">
                <p><strong>E-mail:</strong> <%= usuarioLogado.getEmail() %></p>
                <p><strong>CPF:</strong> <%= usuarioLogado.getCpf() %></p>
                
                <hr>
                
                <div class="text-center my-4">
			        <h5>Seu QR Code para Check-in</h5>
			        <p>Apresente este código na entrada da palestra.</p>
			        <img src="${pageContext.request.contextPath}/QRCodeServlet" alt="QR Code para Check-in" 
			             style="border: 1px solid #ddd; padding: 5px; border-radius: 5px;">
			    </div>
                
                <h4 class="mt-4">Minhas Inscrições em Palestras</h4>
				<div id="lista-minhas-inscricoes" class="list-group">
				    </div>
                
                <h4 class="mt-4">Meus Certificados</h4>
				<div id="lista-meus-certificados" class="list-group">
				    </div>
                
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {

        function carregarMinhasInscricoes() {
            const container = $('#lista-minhas-inscricoes');
            container.html('<p class="text-muted">Carregando suas inscrições...</p>');

            $.ajax({
                url: '${pageContext.request.contextPath}/MinhasInscricoesJsonServlet',
                type: 'GET',
                dataType: 'json',
                success: function(inscricoes) {
                    container.empty();
                    if (inscricoes && inscricoes.length > 0) {
                        inscricoes.forEach(function(inscricao) {
                            const dataObj = new Date(inscricao.dataPalestra + 'T12:00:00');
                            const dataFormatada = dataObj.toLocaleDateString('pt-BR', { day: '2-digit', month: '2-digit', year: 'numeric', timeZone: 'UTC' });
                            const horaFormatada = inscricao.horarioInicio.substring(0, 5);
                            const itemHTML = 
                                '<div class="list-group-item list-group-item-action flex-column align-items-start">' +
                                    '<div class="d-flex w-100 justify-content-between">' +
                                        '<h5 class="mb-1">' + inscricao.nomePalestra + '</h5>' +
                                        '<small>' + dataFormatada + '</small>' +
                                    '</div>' +
                                    '<p class="mb-1">Horário: ' + horaFormatada + '</p>' +
                                    '<small>Status do Certificado: ' + inscricao.statusCertificado + '</small>' +
                                '</div>';
                            container.append(itemHTML);
                        });
                    } else {
                        container.html('<p>Você ainda não se inscreveu em nenhuma palestra.</p>');
                    }
                },
                error: function(xhr) {  }
            });
        }

        function carregarMeusCertificados() {
            const container = $('#lista-meus-certificados');
            container.html('<p class="text-muted">Carregando seus certificados...</p>');

            $.ajax({
                url: '${pageContext.request.contextPath}/MeusCertificadosJsonServlet',
                type: 'GET',
                dataType: 'json',
                success: function(certificados) {
                    container.empty();
                    if (certificados && certificados.length > 0) {
                        certificados.forEach(function(certificado) {
                            const dataEmissaoObj = new Date(certificado.dataEmissao);
                            const dataEmissaoFormatada = dataEmissaoObj.toLocaleDateString('pt-BR', { day: '2-digit', month: '2-digit', year: 'numeric' });
                            const linkCertificado = 'certificado.jsp?codigo=' + certificado.codigoValidacao;
                            
                            const itemHTML = 
                                '<div class="list-group-item d-flex justify-content-between align-items-center">' +
                                    '<div>' +
                                        '<h5 class="mb-1">Certificado: ' + certificado.nomePalestra + '</h5>' +
                                        '<small>Emitido em: ' + dataEmissaoFormatada + '</small>' +
                                    '</div>' +
                                    '<a href="' + linkCertificado + '" class="btn btn-primary btn-sm">Visualizar</a>' +
                                '</div>';
                            container.append(itemHTML);
                        });
                    } else {
                        container.html('<p>Você ainda não possui certificados para exibir.</p>');
                    }
                },
                error: function(xhr) {}
            });
        }

        carregarMinhasInscricoes();
        carregarMeusCertificados();

    });
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Evento, dao.EventoDAO" %>
<%
    List<Evento> eventos = null;
    EventoDAO eventoDAO = new EventoDAO();
    try {
        eventos = eventoDAO.eventoReadAll();
    } finally {
        eventoDAO.closeConnection();
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Gerenciar Palestras</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .container { margin-top: 30px; }
        .card { margin-bottom: 30px; }
    </style>
</head>
<body>

    <jsp:include page="common/navbar.jsp">
	    <jsp:param name="activePage" value="usuarios"/>
	</jsp:include>

    <div class="container-fluid px-4">
        <h1 class="mb-4">Gerenciamento de Palestras</h1>

        <div class="card">
            <div class="card-header">Adicionar Nova Palestra</div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/PalestraServlet" method="post">
                    <input type="hidden" name="action" value="create">
                    
                    <div class="mb-3">
                        <label for="nomePalestra" class="form-label">Nome da Palestra</label>
                        <input type="text" class="form-control" id="nomePalestra" name="nomePalestra" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="descricao" class="form-label">Descrição</label>
                        <textarea class="form-control" id="descricao" name="descricao" rows="3" required></textarea>
                    </div>

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="idEvento" class="form-label">Evento</label>
                            <select id="idEvento" name="idEvento" class="form-select" required>
                                <option value="">Selecione o Evento</option>
                                <% if (eventos != null) { for (Evento evento : eventos) { %>
                                    <option value="<%= evento.getIdEvento() %>"><%= evento.getNomeEvento() %></option>
                                <% }} %>
                            </select>
                        </div>
                        <div class="col-md-4 mb-3">
                           <label for="dataPalestra" class="form-label">Data</label>
                           <input type="date" class="form-control" id="dataPalestra" name="dataPalestra" required>
                        </div>
                        <div class="col-md-2 mb-3">
                           <label for="horarioInicio" class="form-label">Início</label>
                           <input type="time" class="form-control" id="horarioInicio" name="horarioInicio" required>
                        </div>
                        <div class="col-md-2 mb-3">
                           <label for="horarioFinal" class="form-label">Fim</label>
                           <input type="time" class="form-control" id="horarioFinal" name="horarioFinal" required>
                        </div>
                    </div>

                    <div class="row">
                         <div class="col-md-4 mb-3">
                           <label for="localizacao" class="form-label">Localização</label>
                           <input type="text" class="form-control" id="localizacao" name="localizacao" required>
                        </div>
                         <div class="col-md-4 mb-3">
                           <label for="link" class="form-label">Link (se online)</label>
                           <input type="url" class="form-control" id="link" name="link">
                        </div>
                        <div class="col-md-2 mb-3">
                           <label for="vagas" class="form-label">Vagas</label>
                           <input type="number" class="form-control" id="vagas" name="vagas">
                        </div>
                         <div class="col-md-2 mb-3">
                           <label for="cargaHoraria" class="form-label">Carga Horária</label>
                           <input type="text" class="form-control" id="cargaHoraria" name="cargaHoraria" placeholder="Ex: 2h 30m">
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Salvar Palestra</button>
                </form>
            </div>
        </div>

        <div class="card">
            <div class="card-header">Palestras do Evento Ativo</div>
            <div class="card-body">
                <table id="tabelaPalestras" class="table table-striped" style="width:100%">
                    <thead>
                        <tr>
                            <th>ID</th><th>Nome</th><th>Data</th><th>Horário</th><th>Local</th><th>Ações</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    <script>
        $(document).ready(function() {
            $('#tabelaPalestras').DataTable({
                "ajax": "${pageContext.request.contextPath}/PalestraJsonServlet",
                "columns": [
                    { "data": "idPalestra" },
                    { "data": "nomePalestra" },
                    { "data": "dataPalestra" },
                    { "data": "horarioInicio" },
                    { "data": "localizacao" },
                    { "data": null, "render": function (data, type, row) {
                        return '<button class="btn btn-warning btn-sm">Editar</button> <button class="btn btn-danger btn-sm ms-2">Excluir</button>';
                    }, "orderable": false }
                ],
                "language": {
                    "sEmptyTable": "nenhum registro encontrado",
                    "sInfo": "mostrando de _START_ até _END_ de _TOTAL_ registros",
                    "sInfoEmpty": "mostrando 0 até 0 de 0 registros",
                    "sInfoFiltered": "(filtrados de _MAX_ registros)",
                    "sInfoPostFix": "",
                    "sInfoThousands": ".",
                    "sLengthMenu": "_MENU_ resultados por página",
                    "sLoadingRecords": "carregando...",
                    "sProcessing": "processando...",
                    "sZeroRecords": "nenhum registro encontrado",
                    "sSearch": "pesquisar",
                    "oPaginate": {
                        "sNext": "próximo",
                        "sPrevious": "anterior",
                        "sFirst": "primeiro",
                        "sLast": "último"
                    },
                    "oAria": {
                        "sSortAscending": ": ordenar colunas de forma ascendente",
                        "sSortDescending": ": ordenar colunas de forma descendente"
                    }
                }
            });
        });
    </script>
</body>
</html>
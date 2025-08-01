<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Gerenciar Colaboradores</title>
    
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

    <div class="container">
        <h1 class="mb-4">Gerenciamento de Colaboradores</h1>

        <div class="card">
            <div class="card-header">Adicionar Novo Colaborador</div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/ColabServlet" method="post">
                    <input type="hidden" name="action" value="create">

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="nomeColab" class="form-label">Nome do Colaborador</label>
                            <input type="text" class="form-control" id="nomeColab" name="nomeColab" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="linkColab" class="form-label">Link (URL)</label>
                            <input type="url" class="form-control" id="linkColab" name="linkColab" placeholder="https://exemplo.com">
                        </div>
                    </div>
                    <div class="row">
                         <div class="col-md-6 mb-3">
                            <label for="imgColab" class="form-label">URL da Imagem (Logo)</label>
                            <input type="text" class="form-control" id="imgColab" name="imgColab" required>
                        </div>
                         <div class="col-md-6 mb-3">
                            <label for="tamimgColab" class="form-label">Tamanho da Imagem (opcional)</label>
                            <input type="text" class="form-control" id="tamimgColab" name="tamimgColab" placeholder="Ex: 50px">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Salvar Colaborador</button>
                </form>
            </div>
        </div>

        <div class="card">
            <div class="card-header">Colaboradores Cadastrados</div>
            <div class="card-body">
                <table id="tabelaColaboradores" class="table table-striped" style="width:100%">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Link</th>
                            <th>Ações</th>
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
            // Inicializa a tabela de colaboradores
            $('#tabelaColaboradores').DataTable({
                "processing": true,
                "ajax": "${pageContext.request.contextPath}/ColabJsonServlet", // Aponta para o seu Servlet de JSON
                "columns": [
                    { "data": "idColab" },
                    { "data": "nomeColab" },
                    { 
                        "data": "linkColab",
                        "render": function(data, type, row) {
                            if (type === 'display' && data) {
                                return '<a href="' + data + '" target="_blank">' + data + '</a>';
                            }
                            return data;
                        }
                    },
                    { 
                        "data": null,
                        "render": function (data, type, row) {
                            // Botões de ação para cada linha
                            let editButton = '<button class="btn btn-warning btn-sm">Editar</button>';
                            let deleteButton = '<button class="btn btn-danger btn-sm ms-2">Excluir</button>';
                            return editButton + ' ' + deleteButton;
                        },
                        "orderable": false
                    }
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
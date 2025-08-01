<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Gerenciar Eventos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; } .container { margin-top: 30px; } .card { margin-bottom: 30px; }
    </style>
</head>
<body>

    <jsp:include page="common/navbar.jsp">
	    <jsp:param name="activePage" value="usuarios"/>
	</jsp:include>

    <div class="container">
        <h1 class="mb-4">Gerenciamento de Eventos</h1>

        <div class="card">
            <div class="card-header">Adicionar Novo Evento</div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/EventoServlet" method="post">
                    <input type="hidden" name="action" value="create">
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label for="nomeEvento" class="form-label">Nome do Evento</label>
                            <input type="text" class="form-control" id="nomeEvento" name="nomeEvento" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="dataInicio" class="form-label">Data de Início</label>
                            <input type="date" class="form-control" id="dataInicio" name="dataInicio" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="dataFim" class="form-label">Data de Fim</label>
                            <input type="date" class="form-control" id="dataFim" name="dataFim" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label for="linkPesquisa" class="form-label">Link da Pesquisa de Satisfação</label>
                            <input type="url" class="form-control" id="linkPesquisa" name="linkPesquisa">
                        </div>
                    </div>
                    <div class="form-check mb-3">
                      <input class="form-check-input" type="checkbox" name="ativo" value="1" id="ativo" checked>
                      <label class="form-check-label" for="ativo">Marcar como evento ativo?</label>
                    </div>
                    <button type="submit" class="btn btn-primary">Salvar Evento</button>
                </form>
            </div>
        </div>

        <div class="card">
            <div class="card-header">Eventos Cadastrados</div>
            <div class="card-body">
                <table id="tabelaEventos" class="table table-striped" style="width:100%">
                    <thead>
                        <tr>
                            <th>ID</th><th>Nome</th><th>Data Início</th><th>Data Fim</th><th>Status</th><th>Ações</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editEventoModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header"><h5 class="modal-title">Editar Evento</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
                <div class="modal-body">
                    <form id="editEventoForm" action="${pageContext.request.contextPath}/EventoServlet" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" id="editIdEvento" name="idEvento">
                        <div class="mb-3"><label for="editNomeEvento" class="form-label">Nome</label><input type="text" class="form-control" id="editNomeEvento" name="nomeEvento" required></div>
                        <div class="row">
                            <div class="col-md-6 mb-3"><label for="editDataInicio" class="form-label">Data Início</label><input type="date" class="form-control" id="editDataInicio" name="dataInicio" required></div>
                            <div class="col-md-6 mb-3"><label for="editDataFim" class="form-label">Data Fim</label><input type="date" class="form-control" id="editDataFim" name="dataFim" required></div>
                        </div>
                        <div class="mb-3"><label for="editLinkPesquisa" class="form-label">Link Pesquisa</label><input type="url" class="form-control" id="editLinkPesquisa" name="linkPesquisa"></div>
                        <div class="form-check mb-3"><input class="form-check-input" type="checkbox" name="ativo" value="1" id="editAtivo"><label class="form-check-label" for="editAtivo">Evento Ativo</label></div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" form="editEventoForm" class="btn btn-primary">Salvar Alterações</button>
                </div>
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
            var table = $('#tabelaEventos').DataTable({
                "ajax": "${pageContext.request.contextPath}/EventoJsonServlet",
                "columns": [
                    { "data": "idEvento" }, { "data": "nomeEvento" }, { "data": "dataInicio" },
                    { "data": "dataFim" },
                    { "data": "ativo", "render": function(d) { return d == 1 ? '<span class="badge bg-success">Ativo</span>' : '<span class="badge bg-secondary">Inativo</span>'; }},
                    { "data": null, "render": function (data, type, row) {
                        let editBtn = `<button class="btn btn-warning btn-sm btn-edit" data-id="${row.idEvento}">Editar</button>`;
                        let deleteBtn = row.ativo == 1 ? `<button class="btn btn-danger btn-sm ms-2 btn-delete" data-id="${row.idEvento}" data-nome="${row.nomeEvento}">Desativar</button>` : `<button class="btn btn-info btn-sm ms-2 btn-reactivate" data-id="${row.idEvento}" data-nome="${row.nomeEvento}">Reativar</button>`;
                        return editBtn + ' ' + deleteBtn;
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

            $('#tabelaEventos tbody').on('click', '.btn-delete, .btn-reactivate', function() {
                let id = $(this).data('id');
                let nome = $(this).data('nome');
                let action = $(this).hasClass('btn-delete') ? 'delete' : 'reactivate';
                let actionText = $(this).hasClass('btn-delete') ? 'DESATIVAR' : 'REATIVAR';
                
                if (confirm(`tem certeza que deseja ${actionText} o evento: ${nome}?`)) {
                    let form = $('<form>', {'action': '${pageContext.request.contextPath}/EventoServlet','method': 'post'})
                               .append($('<input>', {'name': 'action','value': action,'type': 'hidden'}))
                               .append($('<input>', {'name': 'idEvento','value': id,'type': 'hidden'}));
                    $('body').append(form);
                    form.submit();
                }
            });
            
            $('#tabelaEventos tbody').on('click', '.btn-edit', function() {
                let id = $(this).data('id');
                $.ajax({
                    url: '${pageContext.request.contextPath}/EventoJsonServlet?idEvento=' + id,
                    method: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        $('#editIdEvento').val(data.idEvento);
                        $('#editNomeEvento').val(data.nomeEvento);
                        $('#editDataInicio').val(data.dataInicio);
                        $('#editDataFim').val(data.dataFim);
                        $('#editLinkPesquisa').val(data.linkPesquisa);
                        $('#editAtivo').prop('checked', data.ativo == 1);
                        var editModal = new bootstrap.Modal(document.getElementById('editEventoModal'));
                        editModal.show();
                    },
                    error: function() { alert('erro ao buscar dados do evento.'); }
                });
            });
            
            
        });
    </script>
</body>
</html>
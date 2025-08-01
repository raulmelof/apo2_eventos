<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Gerenciar Usuários</title>
    
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
        <h1 class="mb-4">Gerenciamento de Usuários</h1>

        <div class="card">
            <div class="card-header">Adicionar Novo Usuário</div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/UsuarioServlet" method="post">
                    <input type="hidden" name="action" value="create">

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="cpf" class="form-label">CPF</label>
                            <input type="text" class="form-control" id="cpf" name="cpf" required>
                        </div>
                        <div class="col-md-8 mb-3">
                            <label for="nome" class="form-label">Nome Completo</label>
                            <input type="text" class="form-control" id="nome" name="nome" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                         <div class="col-md-6 mb-3">
                            <label for="senha" class="form-label">Senha</label>
                            <input type="password" class="form-control" id="senha" name="senha" required>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="telefone" class="form-label">Telefone</label>
                            <input type="text" class="form-control" id="telefone" name="telefone">
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="formacao" class="form-label">Formação</label>
                            <input type="text" class="form-control" id="formacao" name="formacao">
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="uf" class="form-label">UF</label>
                            <select id="uf" name="uf" class="form-select">
                                <option value="">Selecione...</option>
                                <option value="AC">AC</option>
                                <option value="AL">AL</option>
                                <option value="AP">AP</option>
                                <option value="AM">AM</option>
                                <option value="BA">BA</option>
                                <option value="CE">CE</option>
                                <option value="DF">DF</option>
                                <option value="ES">ES</option>
                                <option value="GO">GO</option>
                                <option value="MA">MA</option>
                                <option value="MT">MT</option>
                                <option value="MS">MS</option>
                                <option value="MG">MG</option>
                                <option value="PA">PA</option>
                                <option value="PB">PB</option>
                                <option value="PR">PR</option>
                                <option value="PE">PE</option>
                                <option value="PI">PI</option>
                                <option value="RJ">RJ</option>
                                <option value="RN">RN</option>
                                <option value="RS">RS</option>
                                <option value="RO">RO</option>
                                <option value="RR">RR</option>
                                <option value="SC">SC</option>
                                <option value="SP">SP</option>
                                <option value="SE">SE</option>
                                <option value="TO">TO</option>
                            </select>
                        </div>
                    </div>
                     <div class="row">
                         <div class="col-md-4 mb-3">
                            <label for="idNivelUsuario" class="form-label">Nível de Acesso</label>
                            <select id="idNivelUsuario" name="idNivelUsuario" class="form-select" required>
                                <option value="1">Administrador</option>
                                <option value="2" selected>Participante</option>
                                <option value="3">Palestrante</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Salvar Usuário</button>
                </form>
            </div>
        </div>

        <div class="card">
            <div class="card-header">Usuários Cadastrados</div>
            <div class="card-body">
                <table id="tabelaUsuarios" class="table table-striped" style="width:100%">
                    <thead>
                        <tr>
                            <th>CPF</th>
                            <th>Nome</th>
                            <th>Email</th>
                            <th>Nível</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
        
        <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-lg">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="editUserModalLabel">Editar Usuário</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body">
		                <form id="editUserForm" action="${pageContext.request.contextPath}/UsuarioServlet" method="post">
		                    <input type="hidden" name="action" value="update">
		                    <input type="hidden" id="editCpf" name="cpf">
		
		                    <div class="row">
		                        <div class="col-md-12 mb-3">
		                            <label for="editNome" class="form-label">Nome Completo</label>
		                            <input type="text" class="form-control" id="editNome" name="nome" required>
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col-md-6 mb-3">
		                            <label for="editEmail" class="form-label">Email</label>
		                            <input type="email" class="form-control" id="editEmail" name="email" required>
		                        </div>
		                         <div class="col-md-6 mb-3">
		                            <label for="editTelefone" class="form-label">Telefone</label>
		                            <input type="text" class="form-control" id="editTelefone" name="telefone">
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col-md-6 mb-3">
		                            <label for="editFormacao" class="form-label">Formação</label>
		                            <input type="text" class="form-control" id="editFormacao" name="formacao">
		                        </div>
		                        <div class="col-md-6 mb-3">
		                            <label for="editUf" class="form-label">UF</label>
		                            <select id="editUf" name="uf" class="form-select">
		                                <option value="">Selecione...</option>
		                                <option value="AC">AC</option>
		                                <option value="SP">SP</option>
		                                </select>
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col-md-6 mb-3">
		                           <label for="editIdNivelUsuario" class="form-label">Nível de Acesso</label>
		                           <select id="editIdNivelUsuario" name="idNivelUsuario" class="form-select" required>
		                               <option value="1">Administrador</option>
		                               <option value="2">Participante</option>
		                               <option value="3">Palestrante</option>
		                           </select>
		                        </div>
		                         <div class="col-md-6 mb-3">
		                           <label for="editAtivo" class="form-label">Status</label>
		                           <select id="editAtivo" name="ativo" class="form-select" required>
		                               <option value="1">Ativo</option>
		                               <option value="0">Inativo</option>
		                           </select>
		                        </div>
		                    </div>
		                </form>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
		                <button type="submit" form="editUserForm" class="btn btn-primary">Salvar Alterações</button>
		            </div>
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
	        var table = $('#tabelaUsuarios').DataTable({
	            "processing": true,
	            "ajax": "${pageContext.request.contextPath}/UsuarioJsonServlet",
	            "columns": [
	                { "data": "cpf" },
	                { "data": "nome" },
	                { "data": "email" },
	                { "data": "nomeNivel" },
	                { "data": "ativo", "render": function(d) { return d == 1 ? '<span class="badge bg-success">Ativo</span>' : '<span class="badge bg-danger">Inativo</span>'; }},
	                { "data": null, "render": function (data, type, row) {
	                    let editBtn = `<button class="btn btn-warning btn-sm btn-edit" data-cpf="${row.cpf}">Editar</button>`;
	                    let deleteBtn = row.ativo == 1 ? `<button class="btn btn-danger btn-sm ms-2 btn-delete" data-cpf="${row.cpf}" data-nome="${row.nome}">Desativar</button>` : `<button class="btn btn-info btn-sm ms-2 btn-reactivate" data-cpf="${row.cpf}" data-nome="${row.nome}">Reativar</button>`;
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
	
	        $('#tabelaUsuarios tbody').on('click', '.btn-delete', function() {
	            let cpf = $(this).data('cpf');
	            let nome = $(this).data('nome');
	            if (confirm('tem certeza que deseja DESATIVAR o usuario: ' + nome + '?')) {
	                let form = $('<form>', {'action': '${pageContext.request.contextPath}/UsuarioServlet','method': 'post'})
	                           .append($('<input>', {'name': 'action','value': 'delete','type': 'hidden'}))
	                           .append($('<input>', {'name': 'cpf','value': cpf,'type': 'hidden'}));
	                $('body').append(form);
	                form.submit();
	            }
	        });
	        
	        $('#tabelaUsuarios tbody').on('click', '.btn-reactivate', function() {
	            let cpf = $(this).data('cpf');
	            let nome = $(this).data('nome');
	            
	            if (confirm('tem certeza que deseja REATIVAR o usuario: ' + nome + '?')) {
	                let form = $('<form>', {'action': '${pageContext.request.contextPath}/UsuarioServlet','method': 'post'})
	                           .append($('<input>', {'name': 'action','value': 'reactivate','type': 'hidden'}))
	                           .append($('<input>', {'name': 'cpf','value': cpf,'type': 'hidden'}));
	                $('body').append(form);
	                form.submit();
	            }
	        });
	        
	        $('#tabelaUsuarios tbody').on('click', '.btn-edit', function() {
	            let cpf = $(this).data('cpf');
	            
	            $.ajax({
	                url: '${pageContext.request.contextPath}/UsuarioJsonServlet?cpf=' + cpf,
	                method: 'GET',
	                dataType: 'json',
	                success: function(data) {
	                    $('#editCpf').val(data.cpf);
	                    $('#editNome').val(data.nome);
	                    $('#editEmail').val(data.email);
	                    $('#editTelefone').val(data.telefone);
	                    $('#editFormacao').val(data.formacao);
	                    $('#editUf').val(data.uf);
	                    $('#editIdNivelUsuario').val(data.idNivelUsuario);
	                    $('#editAtivo').val(data.ativo);
	                    
	                    var editModal = new bootstrap.Modal(document.getElementById('editUserModal'));
	                    editModal.show();
	                },
	                error: function() {
	                    alert('erro ao buscar dados do usuario.');
	                }
	            });
	        });
	    });
	</script>

</body>
</html>
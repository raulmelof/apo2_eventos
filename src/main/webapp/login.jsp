<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5" style="margin-top: 10vh;">
                <div class="card shadow">
                    <div class="card-body">
                        <h3 class="card-title text-center mb-4">Acessar Minha Conta</h3>
                        <form action="${pageContext.request.contextPath}/AutenticaServlet" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">E-mail</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="senha" class="form-label">Senha</label>
                                <input type="password" class="form-control" id="senha" name="senha" required>
                            </div>
                            <%
						        String mensagemErro = (String) request.getAttribute("mensagemErro");
						        if (mensagemErro != null) {
						    %>
						        <div class="alert alert-danger">
						            <%= mensagemErro %>
						        </div>
						    <%
						        }
    %>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Entrar</button>
                            </div>
                        </form>
                        <div class="text-center mt-3">
                            <a href="#">Esqueceu sua senha?</a>
                        </div>
                        <hr>
                        <div class="text-center">
                            <span>Não tem uma conta?</span>
                            <a href="${pageContext.request.contextPath}/index.jsp#formsinscricao">Cadastre-se</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
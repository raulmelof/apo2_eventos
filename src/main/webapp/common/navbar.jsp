<%@ page import="model.Usuario" %>

<nav class="navbar navbar-expand-md navbar-dark sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
            <img src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/favicon.ico" alt="CRASP LOGO"
                 style="width: 35px; height: 35;">
        </a>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">ENCOAD</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav ms-auto mb-2 mb-md-0">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp#programacao">Programação</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp#speakers">Speakers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Infos</a>
                </li>

                <%
                    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

                    if (usuarioLogado != null) {
                %>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/area_autenticada.jsp" title="Minha Área">
                                Olá, <%= usuarioLogado.getNome().split(" ")[0] %>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/LogoutServlet" title="Sair">
                                <i class="fa-solid fa-right-from-bracket"></i>
                            </a>
                        </li>
                <%
                    } else {
                %>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp#formsinscricao">Inscreva-se</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/login.jsp" title="Login / Acessar conta">
                                <i class="fa-solid fa-circle-user" style="font-size: 1.4rem; vertical-align: middle;"></i>
                            </a>
                        </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>
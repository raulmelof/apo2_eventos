<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String activePage = request.getParameter("activePage");
    if (activePage == null) {
        activePage = "";
    }
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">painel admin</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="adminNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link <%= "usuarios".equals(activePage) ? "active" : "" %>" 
                       href="${pageContext.request.contextPath}/admin/admin_usuario.jsp">Usuários</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= "eventos".equals(activePage) ? "active" : "" %>" 
                       href="${pageContext.request.contextPath}/admin/admin_evento.jsp">Eventos</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link <%= "palestras".equals(activePage) ? "active" : "" %>" 
                       href="${pageContext.request.contextPath}/admin/admin_palestra.jsp">Palestras</a>
                </li>
            </ul>
            <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-outline-light">Sair</a>
        </div>
    </div>
</nav>
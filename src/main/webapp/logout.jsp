<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.getSession().setAttribute("login", false);
	request.getSession().setAttribute("nome",  "");
	response.sendRedirect("index.jsp");
%>
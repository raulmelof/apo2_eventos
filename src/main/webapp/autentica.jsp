
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String email = request.getParameter("email");
	String senha = request.getParameter("senha");
	
	if (email != null && email != "" && senha != null && senha != ""){
		email = email.replace("'", "`");
		senha = senha.replace("'", "`");
	}
		
 	String host 	= "localhost";
 	String port 	= "3306";
 	String schema 	= "bd_apo2";
 	String user		= "root";
 	String password	= "";
 	String strOut = "";
 	try {
 		Class.forName("com.mysql.cj.jdbc.Driver").getConstructor().newInstance();
 		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
 	 	String timezone = "&useTimezone=true&serverTimezone=UTC";
 		String url = "jdbc:mysql://"+host+":"+port+"/"+schema+"?user="+user+"&password="+password+timezone;
 		Connection connection = DriverManager.getConnection(url);
		String cmdSql = "" +
	 			"SELECT 	* " + //idUsuario,email,senha,idNivelUsuario,nome,cpf,endereco,bairro,cidade,uf,cep,telefone,foto,ativo"+ 
	 			"FROM 	    bd_apo2.pessoa " +
				"WHERE 		email = '" + email + "'"+ 
 				"AND 		senha = '" + senha + "'";
 		Statement statement = connection.createStatement();
 		ResultSet rs =  statement.executeQuery(cmdSql);
		if ( rs.next() ) {
			strOut = "{ \"login\":\"true\",\"nome\":\""+rs.getString("nome")+"\" }";
			
			request.getSession().setAttribute("login", true);
			request.getSession().setAttribute("nome",  rs.getString("nome"));
			
		} else{
			strOut = "{ \"login\":\"false\" }";
			request.getSession().setAttribute("login", false);
			
		}
 	} catch (Exception e) {
	 	out.write(e.getMessage());
 	}
	out.println(strOut);
%>
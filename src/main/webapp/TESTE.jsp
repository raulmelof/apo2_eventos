
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
 	String schema 	= "lojinha";
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
	 			"SELECT 	* "+ //idUsuario,email,senha,idNivelUsuario,nome,cpf,endereco,bairro,cidade,uf,cep,telefone,foto,ativo"+ 
	 			"FROM 	    lojinha.usuarios " +
				"WHERE 		email = '" + email + "'"+ 
 				"AND 		senha = '" + senha + "'";
 		Statement statement = connection.createStatement();
 		ResultSet rs =  statement.executeQuery(cmdSql);
		strOut = "[\n";
		while (rs.next()) {
			strOut += "\n\t{";
			strOut +=  "\n\t\t\"idUsuario\":" + rs.getInt("idUsuario") + ",";
			strOut +=  "\n\t\t\"email\":\"" + rs.getString("email") + "\",";
			strOut +=  "\n\t\t\"senha\":\"" + rs.getString("senha") + "\",";
			strOut +=  "\n\t\t\"idNivelUsuario\":" + rs.getInt("idNivelUsuario") + ",";
			strOut +=  "\n\t\t\"nome\":\"" + rs.getString("nome") + "\",";
			strOut +=  "\n\t\t\"cpf\":\"" + rs.getString("cpf") + "\",";
			strOut +=  "\n\t\t\"endereco\":\"" + rs.getString("endereco") + "\",";
			strOut +=  "\n\t\t\"bairro\":\"" + rs.getString("bairro") + "\",";
			strOut +=  "\n\t\t\"cidade\":\"" + rs.getString("cidade") + "\",";
			strOut +=  "\n\t\t\"uf\":\"" + rs.getString("uf") + "\",";
			strOut +=  "\n\t\t\"cep\":\"" + rs.getString("cep") + "\",";
			strOut +=  "\n\t\t\"telefone\":\"" + rs.getString("telefone") + "\"";
			strOut += "\n\t},\n";
		}
		strOut = strOut.substring(0, strOut.length() - 2);
		strOut += "]\n";
 	} catch (Exception e) {
	 	out.write(e.getMessage());
 	}
	out.println(strOut);
%>
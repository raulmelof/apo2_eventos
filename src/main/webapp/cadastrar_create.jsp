<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String strOut = "";
if ( ! request.getParameterMap().isEmpty()){

	String CPF = request.getParameter("CPF").replace("'", "");
	String nome = request.getParameter("nome").replace("'", "");
	String email = request.getParameter("email").replace("'", "");
	String telefone = request.getParameter("telefone").replace("'", "");
	String senha = request.getParameter("senha").replace("'", "");
	String uf = request.getParameter("uf").replace("'", "");
	String formacao = request.getParameter("formacao").replace("'", "");
	String possui_registro = request.getParameter("possui_registro").replace("'", "");
	String como_soube = request.getParameter("como_soube").replace("'", "");
	String jaParticipou = request.getParameter("jaParticipou").replace("'", "");
	String termo = request.getParameter("termo").replace("'", "");
	
	
	// criar um insert e enviar ao banco de dados
	// out.println(" cadastrar o sujeito com email:" + email );
	
 	String host 	= "localhost";
 	String port 	= "3306";
 	String schema 	= "bd_apo2";
 	String user		= "root";
 	String password	= "";
 	
 	try {
 		Class.forName("com.mysql.cj.jdbc.Driver").getConstructor().newInstance();
 		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
 	 	String timezone = "&useTimezone=true&serverTimezone=UTC";
 		String url = "jdbc:mysql://"+host+":"+port+"/"+schema+"?user="+user+"&password="+password+timezone;
 		Connection connection = DriverManager.getConnection(url);
		String cmdSql = "" +
		"INSERT INTO bd_apo2.pessoa (CPF, nome, email, telefone, senha, formacao, possui_registro, como_soube, termo, uf, jaParticipou) " +
	    "VALUES ('" + CPF + "', '" + nome + "', '" + email + "', '" + telefone + "', '" + senha + "', '" +
	    		formacao + "', '" + possui_registro + "', '" + como_soube + "', '" + termo + "', '" + uf + "', '" + jaParticipou + "')";
		
		Statement statement = connection.createStatement();
        int rowsAffected = statement.executeUpdate(cmdSql); // Use executeUpdate para INSERT, UPDATE ou DELETE

        // Verificando se a operação foi bem-sucedida
        if (rowsAffected > 0) {
            strOut = "{ \"insert\":\"true\" }";
        } else {
            strOut = "{ \"insert\":\"false\" }";
        }

 	} catch (Exception e) {
	  //out.write(e.getMessage());
 		strOut = "{ \"insert\":\"false\", \"erro\":\""+e.getMessage()+"\"  }";
 	}
	
 	
}else{
	strOut = "{ \"insert\":\"false\", \"numParameter\" }";
}

out.println(strOut);

%>
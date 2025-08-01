
<%@page import="multitools.JsonUtilities"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

if (! ((boolean)(request.getSession().getAttribute("login")))) {
	response.sendRedirect("fail.json");
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
		" SELECT 	id, logData, logDescricao, ip "+ 
		" FROM 	    bd_apo2.logErros";
 		Statement statement = connection.createStatement();
 		ResultSet rs =  statement.executeQuery(cmdSql);
		JsonUtilities jsonUtilities = new JsonUtilities();
		strOut = jsonUtilities.parse(rs);
 	} catch (Exception e) {
 		strOut = "{\"erro\":\"" + e.getMessage() + "\"}";
 	}
 	response.setContentType("application/json");
 	response.setCharacterEncoding("UTF-8");
	out.println(strOut);
%>
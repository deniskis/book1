<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<style>
			th {
				background-color: #A52A2A
			}
		</style>
	</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
// String id = request.getParameter("userId");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "book";
	String userId = "root";
	String password = "";
/*
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
*/
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	int resultSetChange;
/*
	2	nazvanie_knigi	varchar(255)	utf8_general_ci	
	3	zanr	varchar(255)
	4	author	varchar(255)
	5	god_vipuska	int(11)
*/
%>
<h2 align="center"><strong>Retrieve data from database in jsp</strong></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr>
	<th>nazvanie_knigi</th>
	<th>zanr</th>
	<th>author</th>
	<th>god_vipuska</th>
</tr>
<%

	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}

	try{ 
	
		String jdbcutf8 = ""; //  "&useUnicode=true&characterEncoding=UTF-8";	
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userId, password );
		String rez_vvoda = request.getParameter("search");

		if ( rez_vvoda != null) {
		
			String	zanr = 	request.getParameter("zanr");
		
		
		statement=connection.createStatement();		
		String sql = "SELECT   `nazvanie_knigi` , `author` , `zanr`,`god_vipuska`" + " FROM `knigi`" + " LEFT JOIN `author`"
					+ " ON   `knigi`.`id_authora` = `author`.`id_authora`" + "LEFT JOIN `zanr`"
					+ " ON `knigi`.`id_zanra` = `zanr`.`id_zanra`"
					+ " WHERE `zanr` = '" + zanr + "'" ;

		resultSet = statement.executeQuery(sql);
		}
		while( resultSet.next() ){
%>
<tr style="background-color: #DEB887">
	<td><%= resultSet.getString ( "nazvanie_knigi" ) %></td>
	<td><%= resultSet.getString ( "zanr" ) %></td>
	<td><%= resultSet.getString  ("author" ) %></td>
	<td><%= resultSet.getInt( "god_vipuska" ) %></td>

</tr>

<% 
		}

	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
</table>
<form method="post" action="">
<table>
<tr>
<th>vvedite zanr</th>
<tr>

		<td>
			<input type="text" name="zanr" value="">
		</td>
		<td>
			<input type="submit" name="search" value="search">
		</td>
</tr>
</table>
</form>

</body>
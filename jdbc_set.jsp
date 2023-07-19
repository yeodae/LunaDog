<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	Connection conn;
	Class.forName("oracle.jdbc.driver.OracleDriver"); // MySQL 드라이버 로드
	String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
	String db_id = "SYSTEM";
	String db_pw = "test123";
	conn = DriverManager.getConnection(db_url, db_id, db_pw);
	out.println("DB 연결 완료");
%>

<%--
 	Statement stmt = conn.createStatement();
 	ResultSet rs = stmt.executeQuery("select * from student");
 	
 	while(rs.next()){
 		String name = rs.getString("stu_name");
 		String no = rs.getString("stu_no");
 	
 	--%>
</body>
</html>
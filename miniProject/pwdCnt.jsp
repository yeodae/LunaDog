<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../jdbc_set.jsp" %>
	
	<%
		Statement stmt = null;
		ResultSet rs = null;
		
		String uId = request.getParameter("uId");
		
		stmt = conn.createStatement();
		String sql = "SELECT * FROM TBL_USER WHERE CNT";
		rs = stmt.executeQuery(sql);
		
		rs.next();
		out.println("비밀번호"+rs.getString("CNT")+"회 실패!");
	 %>
</body>
</html>
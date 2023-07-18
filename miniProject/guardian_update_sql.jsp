<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../jsp_heid_set.jsp" %>
<form name="updateForm" action="user_page.jsp">
	<%
	request.setCharacterEncoding("UTF-8");
	
	String uName = request.getParameter("uName");
	String phone = request.getParameter("phone");
	String util = request.getParameter("util");
	String sales = request.getParameter("sales");
	String ment = request.getParameter("ment");
	String allment = request.getParameter("ALLMENT");
	/* String date = new java.util.Date().toLocaleString();
	out.println(date); */
	
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		String sql = "UPDATE YEO_TBL_GUARDIAN SET PHONE = '"+phone+
					"', UTIL = '"+util+
					"', SALES = '"+sales+ 
					"', MENT = '"+ment+
					"' WHERE U_NAME = '"+uName+"'";
		String cnt = "UPDATE YEO_TBL_GUARDIAN SET VISIT = VISIT + 1 WHERE U_NAME = '"+uName+"'";
		String sale = "UPDATE YEO_TBL_GUARDIAN SET ALLSALES = ALLSALES + SALES WHERE U_NAME = '"+uName+"'";
		String allme = "UPDATE YEO_TBL_GUARDIAN SET ALLMENT = CONCAT(ALLMENT, MENT, '\n') WHERE U_NAME = '"+uName+"'";		
		
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		stmt.executeUpdate(cnt);
		stmt.executeUpdate(sale);
		stmt.executeUpdate(allme);
		
		}catch(SQLException e){
		out.println(e.getMessage());
	}
	
%>
</form>
</body>
</html>
<script>
		alert("저장 되었습니다.");
		window.close();
		window.opener.getReturn();
</script>
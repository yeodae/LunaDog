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
<form name="updateForm" action="user2.jsp">
	<%
		request.setCharacterEncoding("UTF-8");
		String uId = request.getParameter("uId");
		String pwd = request.getParameter("pwd");
		String uName = request.getParameter("name");
		String phone = request.getParameter("phone");
		String pName = request.getParameter("pName");
		String memo = request.getParameter("memo");
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			String sql ="";
			if(pwd.equals("") || pwd == null){
				sql = "UPDATE YEO_TBL_USER SET U_NAME = '"+uName+
						"', PHONE = '"+phone+
						"', PET_NAME = '"+pName+
						"', MEMO = '"+memo+
						"' WHERE U_ID = '"+uId+"'";
			}else{
				sql = "UPDATE TBL_USER SET U_NAME = '"+uName+
						"', PHONE = '"+phone+
						"', PET_NAME = '"+pName+
						"', MEMO = '"+memo+
						"', PWD = '"+pwd+
						"'WHERE U_ID = '"+uId+"'";
			}
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			
			}catch(SQLException e){
			out.println(e.getMessage());
		}
		
	%>
	</form>
</body>
</html>
<script>
		alert("정상 변경 되었습니다.");
		window.close();
		window.opener.getReturn();
</script>
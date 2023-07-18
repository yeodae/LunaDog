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
	<%
		request.setCharacterEncoding("UTF-8");
		String uId = request.getParameter("uId");
		String pwd = request.getParameter("pwd1");
		String uName = request.getParameter("uName");
		String phone = request.getParameter("phone");
		String pName = request.getParameter("pName");
		String pType = request.getParameter("pType");
		String memo = request.getParameter("memo");
		String evt = request.getParameter("evt");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "INSERT INTO YEO_TBL_USER (U_ID,U_PW,U_NAME,PHONE,PET_NAME,PET_TYPE,MEMO) VALUES('"+ uId +
					"', '" + pwd +
					"', '" + uName +
					"', '" + phone +
					"', '" + pName +
					"', '" + pType +
					"', '"+ memo +"')";
			String gda = "INSERT INTO YEO_TBL_GUARDIAN (U_NAME,PHONE,EVENT,MENT) VALUES('"+uName+"','"+phone+"','"+evt+"','"+memo+"')";
			
			stmt.executeUpdate(sql);
			stmt.executeUpdate(gda);
			out.println(uName + "님과 " + pName + "의 가입을 환영합니다!");
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	<input type="button" value="로그인" onclick="login()">
</body>
</html>
<script>
	function login(){
		location.href = "login.jsp"
	}
</script>
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
<form name="check">
	<%
		String uName = request.getParameter("uName");
		String kind = request.getParameter("kind");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try {
			stmt = conn.createStatement();
			String update = "UPDATE YEO_TBL_GUARDIAN SET EVENT = '" + kind + "' WHERE U_NAME = '" + uName + "'";
			stmt.executeUpdate(update);
			if(kind.equals("Y")){
				out.println("수신허용되었습니다.");
			} else {
				out.println("수신거부되었습니다.");
			}
			
			
		} catch (SQLException ex) {
			out.println("YEO_TBL_USER 테이블 변경에 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	<input type=button onclick="back()" value="닫기">
</form>
</body>
</html>
<script>
function back(){
	window.opener.getReturn();
	window.close();
}
	
</script>
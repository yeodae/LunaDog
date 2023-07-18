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
		ResultSet rs = null;
		Statement stmt = null;

		try {
			String select = "SELECT * FROM YEO_TBL_USER WHERE U_ID = '" + uId + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(select);
			if(rs.next()){
				if("Y".equals(rs.getString("BANYN"))){
					String delete = "DELETE FROM YEO_TBL_USER WHERE U_ID = '" + uId + "'";
					stmt.executeUpdate(delete);
					out.println("정상적으로 삭제 했습니다.");
				} else {
					out.println("정지된 회원만 삭제할 수 있습니다.");
				} 
			} else {
				out.println("해당 고객이 존재하지 않습니다.");
			}
		} catch (SQLException ex) {
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	<input type="button" onclick="back()" value="되돌아가기">
</body>
</html>
<script>
	function back(){
		location.href="user.jsp";
	}
</script>
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
		String pName = request.getParameter("pName");
		String phone = request.getParameter("phone");
		String dDay = request.getParameter("dDay");
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String cut = request.getParameter("cut");
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "UPDATE YEO_TBL_RESERVE SET PET_NAME = '"+pName+
						"', PHONE = '"+phone+
						"', DDAY = '"+dDay+
						"', STARTDATE = '"+sDate+
						"', ENDDATE = '"+eDate+
						"', CUT = '"+cut+
						"' WHERE PET_NAME = '"+pName+"'";
		
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
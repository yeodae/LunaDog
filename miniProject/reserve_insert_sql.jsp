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
		String phone = request.getParameter("phone");
		String pName = request.getParameter("pName");
		String dDay = request.getParameter("dDay");
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String cut = request.getParameter("cut");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			
			String sql = "INSERT INTO YEO_TBL_RESERVE (PET_NAME,PHONE,DDAY,STARTDATE,ENDDATE,CUT) VALUES('"+ pName +
					"', '" + phone +
					"', '" + dDay +
					"', '" + sDate +
					"', '" + eDate +
					"', '" + cut +"')";
			
			stmt.executeUpdate(sql);
			out.println("예약 되었습니다.");
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
</body>
</html>
<script>
	alert("예약되었습니다.");
	window.close();
	
</script>
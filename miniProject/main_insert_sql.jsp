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
		String pName = request.getParameter("pName");
		String pType = request.getParameter("pType");
		String pKind = request.getParameter("pKind");
		String pGender = request.getParameter("pGender");
		String pNeu = request.getParameter("pNeu");
		String age = request.getParameter("age");
		String pNo = request.getParameter("pNo");
		String pHeight = request.getParameter("pHeight");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "INSERT INTO YEO_TBL_PET (PET_NAME,PET_TYPE,PET_KIND,PET_GENDER,PET_NEU,PET_AGE,PET_NO,PET_HEIGHT) VALUES('"+ pName +
					"', '" + pType +
					"', '" + pKind +
					"', '" + pGender +
					"', '" + pNeu +
					"', '" + age +
					"', '" + pNo +
					"', '"+ pHeight +"')";
			
			stmt.executeUpdate(sql);
			out.println("정상등록되었습니다.");
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
</body>
</html>
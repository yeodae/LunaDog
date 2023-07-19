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
		String uId = request.getParameter("uId");
		String pwd = request.getParameter("pwd");
		String status = request.getParameter("status");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM YEO_TBL_USER WHERE U_ID = '" + uId + "' AND U_PW = '" + pwd + "' AND STATUS = '" + status + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				// 사용자 정지 여부
				if(rs.getString("BANYN").equals("Y")){
					out.println("정지된 회원입니다. 매너 지키세요");
				} else if(rs.getInt("CNT") >= 5){ // 5번 이상 실패
					out.println("비밀번호 5번 이상 실패! 관리자 한테 문의하셈");
				} else {
					session.setAttribute("userId", uId);
					session.setAttribute("userName", rs.getString("U_NAME"));
					session.setAttribute("status", rs.getString("STATUS"));
					// 로그인 시도 횟수 초기화
					String update = "UPDATE YEO_TBL_USER SET CNT = 0 WHERE U_ID = '" + uId + "'";
					stmt.executeUpdate(update);
					if(status.equals("A")){ // 관리자
						response.sendRedirect("main.jsp");
					} else { // 일반 사용자
						response.sendRedirect("main.jsp");
					}
				}
			} else {
				sql = "SELECT * FROM YEO_TBL_USER WHERE U_ID = '" + uId + "'";
				rs = stmt.executeQuery(sql);
				if(rs.next()){
					if(rs.getInt("CNT") >= 5){ // 5번 이상 실패
						out.println("비밀번호 5번 이상 실패! 관리자 한테 문의하셈");
					} else {
						String update = "UPDATE YEO_TBL_USER SET CNT = CNT + 1 WHERE U_ID = '" + uId + "'";
						stmt.executeUpdate(update);
						response.sendRedirect("find.jsp");
					}
				}
			}
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	<input type="button" onclick="back()" value="되돌아가기">
</form>
</body>
</html>
<script>
	function back(){
		location.href="login.jsp";
	}
</script>
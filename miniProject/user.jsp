<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String uId = (String) session.getAttribute("userId");
		String uName = (String) session.getAttribute("userName");
		String uSt = (String) session.getAttribute("status");
		out.println(uName + "님 환영합니다.");
		
		/* int mi = session.getMaxInactiveInterval() / 60;
		out.println(mi + "분");
		
		session.setMaxInactiveInterval(60 * 60);
		mi = session.getMaxInactiveInterval() / 60;
		out.println(mi + "분"); */
	%><%
	if(uSt.equals("A")){%>
	<input type="button" value="관리자화면으로 이동" onclick="admin()">
	<%}%>
	<input type="button" value="로그아웃" onclick="logout()">
</body>
</html>
<script>
	function admin(){
		location.href="user2.jsp";
	}

	function logout(){
		location.href="login.jsp";
	}
	
	</script>
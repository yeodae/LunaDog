<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="pet">
	<%@ include file="../jsp_heid_set.jsp" %>
	
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
		
		/* String uId = (String) session.getAttribute("userId");
		out.println(uId); */
		
		
	%>
	<input type="text" name="user" value="<%=uId%>" hidden>
	<%
	if(uSt.equals("A")){%>
	<input type="button" value="관리자화면으로 이동" onclick="admin()">
	<%}%>
	<div>
		<input type="button" value="반려동물 정보 입력" onclick="petUpd('<%=uId%>')">
	</div>
	<input type="button" value="로그아웃" onclick="logout()">
	</form>
</body>
</html>
<script>

	function logout(){
		location.href="login.jsp";
	}
	
	function petUpd(uId){ //유저 정보 수정
		var uId = document.pet.user.value;
		window.open("main_insert.jsp?uId="+uId,"petUpdate"
				,"width=500, height=500");
		var form = document.pet;
		form.submit();
	}
	
	</script>
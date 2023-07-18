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
		/* session.removeAttribute("userId");
		session.removeAttribute("userName"); */
		/* session.invalidate(); */
		if(request.isRequestedSessionIdValid()){
			out.println("세션만료");
			session.invalidate();
		}
		
		/* String uId = (String) session.getAttribute("userId");
		out.println(uId); */
		
		
	%>
	<form action="check.jsp">
		<div><input placeholder="아이디" name="uId"></div>
		<div><input placeholder="패스워드" type="password" name="pwd"></div>
		<div>
			<label><input type="radio" name="status" value="U">일반회원</label>
			<label><input type="radio" name="status" value="A">관리자</label>
		</div>
		<div><input type="submit" value="로그인"></div>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 		@font-face {
    font-family: 'Ramche';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Ramche.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
	}
         *{
          font-family: "Ramche";
         }
         
        body{
        	box-sizing: border-box; 
            margin: 0;
             padding: 0;
             margin-top: 100px;
        }
        #container{
            width: 300px;
            border: 1px solid white;
            text-align: center;
            margin: 0 auto; 
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            box-shadow: -5px -5px 10px #fff, 5px 5px 30px

            #babebc;
            width: 400px;
            min-height: 480px;
            overflow: hidden;
            
            min-height: calc(100% - 120px);
             margin-top:100px;
             font-size:15px;
        }
		form input {
            background: #eee;
            padding: 16px;
            margin: 8px 0;
            width: 60%;
            border: 0;
            outline: none;
            border-radius: 20px;
            box-shadow: inset 7px 2px 10px #babebc, inset -5px -5px 12px #fff;
        }
         input:hover{
            font-weight: bold;
            }
            
         #logoBox{
            margin: 0 auto;
            padding: 0;
            width: 300px;   
        }
        
		footer{
			 margin-top: 100px; 
			}
</style>
</head>
<body>
	<div id="container">
<form name="list">
<img src="로고2.jpg" id="logoBox">
<%@ include file="header2.jsp" %>
	<%
		String uId = (String) session.getAttribute("userId");
		String uName = (String) session.getAttribute("userName");
		String uSt = (String) session.getAttribute("status");
		
		/* int mi = session.getMaxInactiveInterval() / 60;
		out.println(mi + "분");
		
		session.setMaxInactiveInterval(60 * 60);
		mi = session.getMaxInactiveInterval() / 60;
		out.println(mi + "분"); */
	%>
		<input type="text" name="user" value="<%=uId%>" hidden>
	<%
	if(uSt.equals("A")){
	%>
	
	<span style="font-size:15px"><div><strong><%=uName%></strong>님 환영합니다!</div></span>
	<br>
	<input type="button" value="예약관리" onclick="reserve()">
	<input type="button" value="관리자화면으로 이동" onclick="admin()">
	<%}%>
	<input type="button" value="로그아웃" onclick="logout()">
	</div>
	</form>
	<footer><jsp:include page="footer2.jsp"/></footer>
</body>
</html>
<script>
	function reserve(){
		var form = document.list;
		location.href = "reserve.jsp?uId=" + form.user.value;
	}
	function admin(){
		location.href="user2.jsp";
	}

	function logout(){
		location.href="login.jsp";
	}
	
	</script>
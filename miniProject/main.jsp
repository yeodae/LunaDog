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
             margin-top: 150px;
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
            margin-top:150px;
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
			.find{
			width: 30%;
			}
</style>
</head>
<body>
	<div id="container">
<form name="pet">
<img src="로고2.jpg" id="logoBox">
	<%@ include file="../jsp_heid_set.jsp" %>
	<%@ include file="header2.jsp" %>
	<%
		
		/* String uId = (String) session.getAttribute("userId"); */
		String uName = (String) session.getAttribute("userName");
		String uSt = (String) session.getAttribute("status");
	
		/* int mi = session.getMaxInactiveInterval() / 60;
		out.println(mi + "분");
		
		session.setMaxInactiveInterval(60 * 60);
		mi = session.getMaxInactiveInterval() / 60;
		out.println(mi + "분"); */
		
	 	/* String uId = (String) session.getAttribute("userId"); */
	/* 	out.println(uId); */
		
		
	%>
	<input type="text" name="user" value="<%=uId%>" hidden>
	
	<%
	if(uSt.equals("A")){%>
	<input type="button" value="관리자화면으로 이동" onclick="admin()">
	<%}%>
	<span style="font-size:15px"><div><strong><%=uName%></strong>님 환영합니다!</div></span>
	<div>
		<input type="button" value="MY예약확인" onclick="user_reserve()">
		</div>
	<div>
		<input type="button" value="반려동물 정보 입력" onclick="petUpd('<%=uId%>')">
		</div>
	<input type="button" value="로그아웃" onclick="logout()" class="find">
	</form>
	</div>
	 <footer><jsp:include page="footer2.jsp"/></footer>
</body>
</html>
<script>
	function user_reserve(){
		var uId = document.pet.user.value;
		window.open("user_reserve.jsp?uId="+uId,"petUpdate"
				,"width=500, height=500");
		var form = document.pet;
		form.submit();
	}

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
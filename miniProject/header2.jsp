<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        @import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);

:root {
	/** color **/
	--baseColor : #333;
	--blueColor : rgb(233, 151, 0);
	/** size **/
	--baseContainer : 1270px;
	/** padding **/
	
}
html {
    font-size:13px;
    font-size: large;
}
body {
    font-size: 0.5rem;
    font-family: 'NanumSquare', sans-serif;
    color:var(--baseColor);
}
li{
    list-style: none;
}
a{
    text-decoration: none;
    
}
#himg{
    height: 130px;
    width: 130px;
}

a:link, a:visited, a:hover, a:active {color:var(--baseColor);}

.container {width:var(--baseContainer);margin:0 auto;}
header {position:fixed;width:100%;top:0;left:0;background:rgb(255 255 255 / 86%);}
header img {width:11.875rem;padding:0.75rem 0;}
header > div {display: flex;justify-content: space-between;align-items: center;}
header h1 {position:absolute;left:-2000px;}
header nav ul {display:flex;text-align: center;}
header nav ul li {padding: 0 10px;width: 150px;}
header nav ul li a {position:relative;display:inline-block;line-height:2rem;font-weight: bold;font-size:1.0625rem;}
/* header nav ul li.active a, */
header nav ul li:hover a {color: var(--blueColor);}
header nav ul li a:after {opacity:0;content:"";position:absolute;width:100%;height:2px;background-color:var(--blueColor);left:0;bottom:0;transition:all 0.3s ease-in-out;}
/* header nav ul li.active a:after, */
header nav ul li:hover a:after {opacity:1;}
    </style>
</head>
<body>
 <header>
    	<div class="container">
	    	<h1>회사 홈페이지 헤더 메뉴</h1>
	    	<img src="로고만.jpg" title="회사 로고" id="himg"/>
	    	<nav>
	    		<ul>
	    			<li class="active"><a href="#">홈</a></li>
	    			<li><a href="#">About</a></li>
	    			<li><a href="https://www.instagram.com/lunadog__official/">인스타그램</a></li>
	    			<!-- <li><a href="join.jsp">회원가입</a></li> -->
	    			<% 
	    			String uId = (String) session.getAttribute("userId");
	    				if(uId!=null){
	    					%>
	    					<li><a href="price.jsp?">미용비용</a></li>
	    					<li><a href="login.jsp">로그아웃</a></li>
	    					<%
	    				}else if(uId==null){
	    					session.setAttribute("uId",null);
	    					session.setMaxInactiveInterval(0);
	    					%>
	    					<li><a href="join.jsp">회원가입</a></li>
	    					<li><a href="login.jsp">로그인</a></li>
	    					<%
	    				}			
	    			%>
	    			<!-- <li><a href="login.jsp">로그인</a></li> -->
	    		</ul>
	    	</nav>
    	</div>
    </header>
</body>
</html>
<script>
	function getReturn(){
		location.reload();
	}
</script>
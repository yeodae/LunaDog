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
        .div{
        	width: 300px;
        	height: 400px;
            border: 1px solid white;
            text-align: center;
            margin: 0 auto; 
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            box-shadow: -5px -5px 10px #fff, 5px 5px 30px

            #babebc;
            overflow: hidden;
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
        .find{
        	width : 25%;
        	padding: 8px;
        }
        .find:hover{
        	font-weight: bold;
        }
        img{
            margin: 0 auto;
            display: flex;
        }
</style>
</head>
<body>
	<img src="로그인사진.png" alt="">
	<div class="div">
	<form name="list" action="findId_sql.jsp">
	<%@ include file="../jsp_heid_set.jsp" %>
	<div>
		<h2>아이디 찾기</h2>
		<input type="text" name="uName" placeholder="보호자이름">
		</div>
		<div>
		<input type="text" name="phone" placeholder="핸드폰번호">
	</div>
	<div><input type="submit" value="검색" class="find"></div>
	<div><input type="button" value="취소" class="find" onclick="back()"></div>
	</form>
	</div>
</body>
</html>
<script>	
function back(){
	location.href = "login.jsp";
}
	</script>
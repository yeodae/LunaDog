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
        }
        #container{
        	line-height: 20px;
            width: 905px;
            height : auto;
            border: 1px solid white;
            text-align: center;
            margin: 0 auto; 
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            box-shadow: -5px -5px 10px white, 5px 5px 30px white;
            overflow: hidden;
            
            min-height: calc(100% - 120px);
 			font-size:15px;
        }
		img {
		  transition: all 0.3s linear;
		}
		img:hover {
		  transform: scale(1.05);
		  overflow: hidden
		}
         [type="submit"] {
        vertical-align: middle;
        appearance: none;
        background-color: white;
        box-shadow: none;
        padding: 10px;
        width: 50px;
      	margin-top:12px;
        }  
</style>
</head>
<body>
<%@ include file="../jsp_heid_set.jsp" %>
<div id="container">
<form name="list">
	<div>
		<img alt="price1" src="가격표.png">
	</div>
	<div>
		<img alt="price2" src="가격표2.png">
	</div>
	<input type="submit" value="닫기" onclick="back()">
	
</form>
</div>
</body>
</html>
<script>
function back(){
	window.opener.getReturn();
	window.close();
}
</script>
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
            box-shadow: -5px -5px 10px #fff, 5px 5px 30px #babebc;
            overflow: hidden;
            
            min-height: calc(100% - 120px);
             margin-top:50px;
             font-size:15px;
        }
		img {
		  transition: all 0.3s linear;
		}
		img:hover {
		  transform: scale(1.1);
		  overflow: hidden
		}
         [type="submit"] {
        vertical-align: middle;
        appearance: none;
        background-color: white;
        box-shadow: none;
        padding: 2px;
        width: 2px;
      
        }
          label:hover{
            border-bottom: 3px solid orange;
            cursor: pointer;
        }
        footer{
			 margin-top: 50px; 
			}
</style>
</head>
<body>
<%@ include file="../jsp_heid_set.jsp" %>
<%@ include file="header2.jsp" %>
<div id="container">
<form name="list">
	<div>
		<img alt="price1" src="가격표.png">
	</div>
	<div>
		<img alt="price2" src="가격표2.png">
	</div>
	
	
</form>
</div>
<footer><jsp:include page="footer2.jsp"/></footer>
</body>
</html>
<script>
	function page(uId){//상세페이지
		var form = document.list;
		location.href = "user_page.jsp?uId=" + form.user.value;
	}
	function getReturn(){
		location.reload();
	}
</script>
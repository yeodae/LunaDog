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
             margin-top: 10px;
        }
        #container{
            width: 200px;
            height : 100px;
            border: 1px solid white;
            text-align: center;
            margin: 0 auto; 
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            box-shadow: -5px -5px 10px #fff, 5px 5px 30px

            #babebc;
            width: 200px;
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
          input:hover{
            font-weight: bold;
            }
            
            #logoBox{
            margin: 0 auto;
            padding: 0;
            width: 300px;   
        }
         [type="radio"] {
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
        input:checked + label {
            color:rgb(233, 151, 0);
            border-bottom: 3px solid orange;
            font-weight: bold;
        }
         [type="submit"]{
            width: 20%;
            padding: 10px;
        }
</style>
</head>
<body>
<%@ include file="../jsp_heid_set.jsp" %>
<div id="container">
<form name="check">
	<%
		String uName = request.getParameter("uName");
		String kind = request.getParameter("kind");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try {
			stmt = conn.createStatement();
			String update = "UPDATE YEO_TBL_GUARDIAN SET EVENT = '" + kind + "' WHERE U_NAME = '" + uName + "'";
			stmt.executeUpdate(update);
			if(kind.equals("Y")){
				out.println("수신허용되었습니다.");
			} else {
				out.println("수신거부되었습니다.");
			}
			
			
		} catch (SQLException ex) {
			out.println("YEO_TBL_USER 테이블 변경에 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	<input type=button onclick="back()" value="닫기">
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
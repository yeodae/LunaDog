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
             margin-top: 50px;
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
       #logoBox{
            margin: 0 auto;
            padding: 0;
            width: 300px;
        }
</style>
</head>
<body>
<%@ include file="../jsp_heid_set.jsp" %>
<div class="div">
<form>
	<img src="로고2.jpg" id="logoBox">
	<div>
<%
		request.setCharacterEncoding("UTF-8");
		String pName = request.getParameter("pName");
		ResultSet rs = null;
		Statement stmt = null;

		try {
			String select = "SELECT * FROM YEO_TBL_RESERVE WHERE PET_NAME = '" + pName + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(select);
			if(rs.next()){
					String delete = "DELETE FROM YEO_TBL_RESERVE WHERE PET_NAME = '" + pName + "'";
					stmt.executeUpdate(delete);
					out.println("정상적으로 삭제 했습니다.");
				
			} else {
				out.println("해당 회원이 존재하지 않습니다.");
			}
		} catch (SQLException ex) {
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	</div>
	<input type="button" onclick="back()" value="되돌아가기" class="find">
	</form>
</div>
</body>
</html>
<script>
	function back(){
		window.close();
		window.opener.getReturn();
	}
	function getReturn(){
		location.reload();
	}
</script>
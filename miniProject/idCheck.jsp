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
             margin-top: 5px;
        }
        .div{
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
        </style>
</head>
<body>
<%@ include file="../jsp_heid_set.jsp" %>
<div class="div">
<form name="check">
	<%
		String uId = request.getParameter("uId");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM YEO_TBL_USER WHERE U_ID = '" + uId + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				out.println("사용중인 아이디 입니다. 다른 아이디를 입력해주세요.");
		%>
				<input name="flg" value="N" hidden>
		<%
			} else {
				out.println("사용 가능한 아이디 입니다.");
		%>
				<input name="flg" value="Y" hidden>
		<%
			}
				
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	<input type="button" onclick="back()" value="되돌아가기">
</form>
</div>
</body>
</html>
<script>
	function back(){
		window.opener.getReturn(document.check.flg.value);
		window.close();
	}
</script>
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
       #logoBox{
            margin: 0 auto;
            padding: 0;
            width: 300px;   
        }
</style>
</head>
<body id="Jbody">
<div class="div">
<form>
<img src="로고2.jpg" alt="" id="logoBox">
	<%@ include file="../jsp_heid_set.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		String uId = request.getParameter("uId");
		String pwd = request.getParameter("pwd1");
		String uName = request.getParameter("uName");
		String phone = request.getParameter("phone");
		String pName = request.getParameter("pName");
		String pType = request.getParameter("pType");
		String memo = request.getParameter("memo");
		String evt = request.getParameter("evt");
		String pwhint = request.getParameter("pwhint");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "INSERT INTO YEO_TBL_USER (U_ID,U_PW,U_NAME,PHONE,PET_NAME,PET_TYPE,MEMO,PWHINT) VALUES('"+ uId +
					"', '" + pwd +
					"', '" + uName +
					"', '" + phone +
					"', '" + pName +
					"', '" + pType +
					"', '" + memo +
					"', '"+ pwhint +"')";
			String gda = "INSERT INTO YEO_TBL_GUARDIAN (U_NAME,PHONE,EVENT,MENT) VALUES('"+uName+"','"+phone+"','"+evt+"','"+memo+"')";
			
			stmt.executeUpdate(sql);
			stmt.executeUpdate(gda);
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
            <br>
             <div><h2><span style="font-size: 30px;"><%=uName %></spna> 님 환영합니다!</h2></div>
            <div><input type="button" value="로그인 이동" onclick="login()" class="find"></div> 
        </div>
       </form>
</body>
</html>
<script>
	function login(){
		location.href = "login.jsp"
	}
</script>
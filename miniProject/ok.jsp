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
		String phone = request.getParameter("phone");
		
		ResultSet rs = null;
		Statement stmt = null;
		
		try {
				
			String select = "SELECT * FROM YEO_TBL_RESERVE R INNER JOIN YEO_TBL_PET P ON R.PET_NAME = P.PET_NAME INNER JOIN YEO_TBL_GUARDIAN G ON G.PHONE = R.PHONE WHERE R.PHONE = '" + phone + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(select);
			if(rs.next()){
					String uName = rs.getString("U_NAME");
					String pName = rs.getString("PET_NAME");
					String pKind = rs.getString("PET_KIND");
					String pHeight = rs.getString("PET_HEIGHT");
					String cut = rs.getString("CUT");
					String visit = rs.getString("VISIT");
					String dDay = rs.getString("DDAY");
					
					String insert = "INSERT INTO YEO_TBL_HISTORY (U_NAME,PET_NAME,PET_KIND,PET_HEIGHT,CUT,VISIT,DDAY) VALUES('"+ uName +
							"', '" + pName +
							"', '" + pKind +
							"', '" + pHeight +
							"', '" + cut +
							"', '" + visit +
							"', '" + dDay +"')";
					stmt.executeUpdate(insert);
					
					String delete = "DELETE FROM YEO_TBL_RESERVE WHERE PHONE = '" + phone + "'";
					stmt.executeUpdate(delete);
					
					out.println("완료되었습니다.");
			} else {
				out.println("에러가뜹니당~");
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
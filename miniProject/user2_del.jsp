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
<div id="container">
	<form>
	<%@ include file="../jsp_heid_set.jsp" %>
<%
		request.setCharacterEncoding("UTF-8");
		String uId = request.getParameter("uId");
		ResultSet rs = null;
		Statement stmt = null;

		try {
			String select = "SELECT * FROM YEO_TBL_USER WHERE U_ID = '" + uId + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(select);
			if(rs.next()){
				if("Y".equals(rs.getString("BANYN"))){
					String delete = "DELETE FROM YEO_TBL_USER WHERE U_ID = '" + uId + "'";
					stmt.executeUpdate(delete);
					out.println("정상적으로 삭제 했습니다.");
				} else {
					out.println("정지된 회원만 삭제할 수 있습니다.");
				} 
			} else {
				out.println("해당 고객이 존재하지 않습니다.");
			}
		} catch (SQLException ex) {
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	<input type="button" onclick="back()" value="되돌아가기">
	</form>
	</div>
</body>
</html>
<script>
	function back(){
		location.href="user2.jsp";
	}
</script>
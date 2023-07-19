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
	<%@ include file="../jsp_heid_set.jsp" %>
	<div id="container">
<form name="updateForm" action="guardian_update_sql.jsp">
	<%
		request.setCharacterEncoding("UTF-8");
		String uName = request.getParameter("uName");
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			stmt = conn.createStatement();
			String select = "SELECT * FROM YEO_TBL_GUARDIAN WHERE U_NAME = '"+uName+"'";
			rs = stmt.executeQuery(select);
			if(rs.next()){
				String phone
					=rs.getString("PHONE") != null ? rs.getString("PHONE") : "";
				String util
					=rs.getString("UTIL") != null ? rs.getString("UTIL") : "";
				String visit
					=rs.getString("VISIT") != null ? rs.getString("VISIT") : "";
				String sales
					=rs.getString("SALES") != null ? rs.getString("SALES") : "";
				String ment
					=rs.getString("MENT") != null ? rs.getString("MENT") : "";
				String allment
				=rs.getString("ALLMENT") != null ? rs.getString("ALLMENT") : "";
				%>
				<input name="uName" value="<%= uName %>" hidden>
				<div>보호자 : <input name="uName" type="text" value="<%= rs.getString("U_NAME")%>"></div>
				<div>연락처 : <input name="phone" type="text" value="<%= phone %>"></div>
				<div>이용권 : <select name="util" value="<%=util%>">
						<option><%=util %></option>
						<option>없음</option>
						<option>무료 목욕 이용권</option>
						<option>무료 스파 이용권</option>
						<option>무료 머드 이용권</option>
						<option>달 정기권</option>
				</select></div>
				<div>매출 : <input name="sales" type="text" value="<%= sales %>"></div>
				<div>전달사항 : <input name="ment" type="text" value="<%= ment %>"></div>
				
				<%
			}
			}catch(SQLException e){
			out.println(e.getMessage());
		}
		
	%>
	<input type="submit" onclick="userUpdate()" value="저장">
	
</form>
</div>
</body>
</html>
<script>

</script>
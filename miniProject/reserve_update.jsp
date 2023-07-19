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
            width: 25%;
            padding: 10px;
        }
</style>
</head>
<body>
	<%@ include file="../jsp_heid_set.jsp" %>
	<div id="container">
<form name="updateForm" action="reserve_update_sql.jsp">
	<%
		request.setCharacterEncoding("UTF-8");
		String pName = request.getParameter("pName");
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			stmt = conn.createStatement();
			String select = "SELECT * FROM YEO_TBL_RESERVE WHERE PET_NAME = '"+pName+"'";
			rs = stmt.executeQuery(select);
			if(rs.next()){
				String phone
					=rs.getString("PHONE") != null ? rs.getString("PHONE") : "";
				pName
					=rs.getString("PET_NAME") != null ? rs.getString("PET_NAME") : "";
				String dDay
					=rs.getString("DDAY") != null ? rs.getString("DDAY") : "";
				String sDate
					=rs.getString("STARTDATE") != null ? rs.getString("STARTDATE") : "";
				String eDate
					=rs.getString("ENDDATE") != null ? rs.getString("ENDDATE") : "";
				String cut
				=rs.getString("CUT") != null ? rs.getString("CUT") : "";
				%>
				<input name="uId" value="<%= pName %>" hidden>
				<h2>예약 변경</h2>
				<div>반려동물명 : <input name="pName" type="text" value="<%=pName%>"></div>
				<div>연락처 : <input name="phone" type="text" value="<%=phone%>"></div>
				<div>예약일자: <input name="dDay" type="text" value="<%= dDay %>"></div>
				<div>시작시간 : <input name="sDate" type="text" value="<%= sDate %>"></div>
				<div>종료시간 : <input name="eDate" type="text" value="<%= eDate %>"></div>
				<div>요구사항 : <input name="cut" type="text" value="<%= cut %>"></div>
				
				<%
			}
			
			}catch(SQLException e){
			out.println(e.getMessage());
		}
		
	%>
	<input type="submit" value="예약변경" onclick="userUpdate()">
</form>
</div>
</body>
</html>
<script>

</script>
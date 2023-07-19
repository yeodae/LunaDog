<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
		border-collapse: collapse;
		text-align : center;
	}
	th, td{
		border : 1px solid black;
		padding : 5px 10px;
	}
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
         [type="button"]{
            width: 20%;
            padding: 10px;
        }
        table{
         text-align: center;
        
            margin: 0 auto; 
        }
</style>
</head>
<body>
<%@ include file="../jsp_heid_set.jsp" %>
<div id="container">
<form name="list">
		
		<%
			ResultSet rs = null;
			Statement stmt = null;
			
			String pName = request.getParameter("pName");
			try {
				String sql = "SELECT * FROM YEO_TBL_HISTORY WHERE PET_NAME = '"+pName+"'";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					String uName = rs.getString("U_NAME"); 
					String pKind = rs.getString("PET_KIND");
					String pHeight 
						= rs.getString("PET_HEIGHT") != null ? rs.getString("PET_HEIGHT") : "재측정 필요";
					String cut 
						= rs.getString("CUT") != null ? rs.getString("CUT") : "방문후 상담";
					String visit 
						= rs.getString("VISIT")  != null ? rs.getString("VISIT") : "-";
					String dDay = rs.getString("DDAY");
					
		%>
		
		<div><H3><%=uName%>님은 <span style="color:rgb(233, 151, 0);">루나독</span>에 <span style="color:rgb(233, 151, 0);"><%=visit%>번</span> 방문해주셨어요!</H2></div>
		
		<div><h2>이전 방문기록</h2></div>
		<table>
		<tr>
			<th>반려동물이름</th>			
			<th>품종</th>
			<th>체중</th>
			<th>미용메모</th>		
			<th>미용날짜</th>
		</tr>
		<tr>
			<td><%=pName%></td>
			<td><%=pKind%></td>
			<td><%=pHeight%></td>
			<td><%=cut%></td>
			<td><%=dDay%></td>
			</tr>
		<%
				}
			}catch (SQLException ex) {
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} 
		%>

	</table>
	
		
	<div><input type="button" value="확인" onclick="back()"></div>
	
</form>
</div>
</body>
</html>
<script>
	function history(){
		var form = document.list;
		location.href = "history.jsp?uId=" + form.user.value;
	}

	function back(){
		window.close();
		window.opener.getReturn();
}
</script>
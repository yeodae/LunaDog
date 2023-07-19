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
             margin-top: 5px;
        }
        #container{
        	line-height: 20px;
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
			
			String uId = request.getParameter("uId");
			try {
				String sql = "select *from YEO_TBL_RESERVE R INNER JOIN YEO_TBL_USER U ON R.PET_NAME = U.PET_NAME WHERE U_ID = '"+uId+"'";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					String phone = rs.getString("PHONE"); 
					String dDay = rs.getString("DDAY");
					String sDate = rs.getString("STARTDATE");
					String eDate = rs.getString("ENDDATE");
					String cut 
						= rs.getString("CUT") != null ? rs.getString("CUT") : "방문후 상담";
					String pName 
						= rs.getString("PET_NAME")  != null ? rs.getString("PET_NAME") : "-";
					
		%>
		<h1>댕댕이 <span style="color:rgb(233, 151, 0);">알림장</span></h1>
	
		<table>
		<tr>
			<th>예약댕댕</th>
			<td><%=pName%></td>
			</tr>
			<tr>
			<th>보호자 연락처</th>	
			<td><%=phone%></td>
			</tr>	
			<tr>	
			<th>예약일자</th>
			<td><%=dDay%></td>
			</tr>
			<tr>
			<th>시작시간</th>
			<td><%=sDate%></td>
			</tr>
			<tr>
			<th>예상종료시간</th>	
			<td><%=eDate%></td>
			</tr>
			
			<input name="user" value="<%=rs.getString("PET_NAME")%>"hidden>
			
		<%
				}
			}catch (SQLException ex) {
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} 
		%>

	</table>
	<input type="button" value="이전내역" onclick="history()">
	<H4>예약변경이나 취소를 원하신다면<br>관리자<span style="font-size:30px">(1544-7777)</span>에게 문의해주세요. </H4>
		<H5>예약시간보다 10분 일찍 와주시면 여유로운 미용에 <span style="color:rgb(233, 151, 0);">도움</span>이 됩니다.<br>
		<span style="color:rgb(233, 151, 0);">당일취소시 예약금 환불</span>이 어려우니<br>하루전날 연락주시면 감사드리겠습니다.<br>
		예약시간에서 <span style="color:rgb(233, 151, 0);">15분 초과시 자동 취소</span>됩니다.</H5>
		
	<div><input type="button" value="확인" onclick="back()"></div>
	
</form>
</div>
</body>
</html>
<script>
	function history(){
		var form = document.list;
		location.href = "history.jsp?pName=" + form.user.value;
	}

	function back(){
		window.close();
		window.opener.getReturn();
}
</script>
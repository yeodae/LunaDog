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
</style>
</head>
<body>
<%@ include file="../jsp_heid_set.jsp" %>
<form name="list">
	<div>
	<h1>보호자 정보</h1>
	<table>
		<tr>
			<th>보호자</th>
			<th>연락처</th>
			<th>이용권</th>
			<th>방문기록</th>
			<th>매출</th>
			<th>이벤트수신여부</th>
			
		</tr>
		<%
			ResultSet rs = null;
			Statement stmt = null;
			try {
				String sql = "select * FROM YEO_TBL_USER Y INNER JOIN YEO_TBL_GUARDIAN G ON Y.U_NAME = G.U_NAME INNER JOIN YEO_TBL_PET P ON Y.PET_NAME = P.PET_NAME WHERE STATUS = 'U' ORDER BY U_ID ASC";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					String uId = rs.getString("U_ID"); 
					String pw = rs.getString("U_PW");
					String uName = rs.getString("U_NAME");
					String phone 
						= rs.getString("PHONE") != null ? rs.getString("PHONE") : "-";
					String pName 
						= rs.getString("PET_NAME")  != null ? rs.getString("PET_NAME") : "-";
					String pType
						= rs.getString("PET_TYPE") != null ? rs.getString("PET_TYPE") : "-";
					String visit
						= rs.getString("VISIT") != null ? rs.getString("VISIT") : "첫방문";
					String util
						= rs.getString("UTIL") !=  null ? rs.getString("UTIL") : "미보유";
					String banYn 
						= rs.getString("BANYN").equals("Y") ? "정지" : "";
					String btnYn
						= rs.getString("BANYN").equals("Y") ? "해제" : "정지";
					int cnt = rs.getInt("CNT"); 
					String memo
						= rs.getString("MEMO") != null ? rs.getString("MEMO") : "공백";
					String sales
						= rs.getString("SALES") != "0" ? rs.getString("SALES") : "0";
					String event
						= rs.getString("EVENT") != "Y" ? rs.getString("EVENT") : "N";
					
		%>
			<tr>
				
				<input type="radio" name="user" value="<%=uId%>" hidden>
				<td><%=uName%></td>
				<td><%=phone%></td>
				<td><%=util%></td>
				<td><%=visit%></td>
				<td><%=sales%></td>
				<td><%=event%></td>
			</tr>
			
		<%
				}
			}catch (SQLException ex) {
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} 
		%>
	</table>
	</div>
	<hr>
	<div>
		<h1>반려견 정보</h1>
	<table>
		<tr>
			<th>반려동물</th>
			<th>종류</th>
			<th>품종</th>
			<th>성별</th>
			<th>중성화</th>
			<th>나이</th>
			<th>동물등록번호</th>
			<th>몸무게</th>
			<th>반려동물메모</th>
			
		</tr>
		<%
			
			try {
				String sql = "select * FROM YEO_TBL_USER Y INNER JOIN YEO_TBL_GUARDIAN G ON Y.U_NAME = G.U_NAME INNER JOIN YEO_TBL_PET P ON Y.PET_NAME = P.PET_NAME WHERE STATUS = 'U' ORDER BY U_ID ASC";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					String uId = rs.getString("U_ID"); 
					String pw = rs.getString("U_PW");
					String uName = rs.getString("U_NAME");
					String phone 
						= rs.getString("PHONE") != null ? rs.getString("PHONE") : "-";
					String pName 
						= rs.getString("PET_NAME")  != null ? rs.getString("PET_NAME") : "-";
					String pType
						= rs.getString("PET_TYPE") != null ? rs.getString("PET_TYPE") : "-";
					String pKind
						= rs.getString("PET_KIND") != null ? rs.getString("PET_KIND") : "-";
					String pGender
						= rs.getString("PET_GENDER") != "M" ? rs.getString("PET_GENDER") : "W";
					String pNeu
						= rs.getString("PET_NEU") != "X" ? rs.getString("PET_NEU") : "O";
					String age
						= rs.getString("PET_AGE") != null ? rs.getString("PET_AGE") : "-";
					String pNo
						= rs.getString("PET_NO") != null ? rs.getString("PET_NO") : "-";
					String pHeight
						= rs.getString("PET_HEIGHT") != null ? rs.getString("PET_HEIGHT") : "-";
					String visit
						= rs.getString("VISIT") != null ? rs.getString("VISIT") : "첫방문";
					String util
						= rs.getString("UTIL") !=  null ? rs.getString("UTIL") : "미보유";
					String banYn 
						= rs.getString("BANYN").equals("Y") ? "정지" : "";
					String btnYn
						= rs.getString("BANYN").equals("Y") ? "해제" : "정지";
					int cnt = rs.getInt("CNT"); 
					String memo
						= rs.getString("MEMO") != null ? rs.getString("MEMO") : "공백";
					String sales
						= rs.getString("SALES") != "0" ? rs.getString("SALES") : "0";		
		%>
			<tr>
				
				<input type="radio" name="user" value="<%=uId%>" hidden>
				<td><%=pName%></td>
				<td><%=pType%></td>
				<td><%=pKind%></td>
				<td><%=pGender%></td>
				<td><%=pNeu%></td>
				<td><%=age%></td>
				<td><%=pNo%></td>
				<td><%=pHeight%></td>
				<td><%=memo%></td>
			</tr>

		<%
				}
			}catch (SQLException ex) {
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} 
		%>
	</table>
	
	<input type = "button" name="PetAdd" value="반려견추가" onclick="PetAdd()">
			
	</div>
	
</form>
</body>
</html>
<script>
	
	function getReturn(){
		location.reload();
	}
</script>
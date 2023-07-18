<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../jsp_heid_set.jsp" %>
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
</body>
</html>
<script>

</script>
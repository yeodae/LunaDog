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
<form name="updateForm" action="user_update_sql.jsp">
	<%
		request.setCharacterEncoding("UTF-8");
		String uId = request.getParameter("uId");
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			stmt = conn.createStatement();
			String select = "SELECT * FROM YEO_TBL_USER WHERE U_ID = '"+uId+"'";
			rs = stmt.executeQuery(select);
			if(rs.next()){
				String phone
					=rs.getString("PHONE") != null ? rs.getString("PHONE") : "";
				String pName
					=rs.getString("PET_NAME") != null ? rs.getString("PET_NAME") : "";
				String memo
					=rs.getString("MEMO") != null ? rs.getString("MEMO") : "";
				%>
				<input name="uId" value="<%= uId %>" hidden>
				<div>비밀번호 : <input name="pwd" type="password"></div>
				<div>보호자명 : <input name="name" type="text" value="<%= rs.getString("U_NAME")%>"></div>
				<div>연락처&nbsp;: <input name="phone" type="text" value="<%= phone %>"></div>
				<div>반려동물명 : <input name="pName" type="text" value="<%= pName %>"></div>
				<div>메모 : <input name="memo" type="text" value="<%= memo %>"></div>
				
				<%
			}
			
			}catch(SQLException e){
			out.println(e.getMessage());
		}
		
	%>
	<input type="submit" onclick="userUpdate()">
</form>
</body>
</html>
<script>

</script>
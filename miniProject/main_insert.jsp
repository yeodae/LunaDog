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
<form name="updateForm" action="main_insert_sql.jsp">

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
			String pName
			=rs.getString("PET_NAME") != null ? rs.getString("PET_NAME") : "";
			%>
			<div>반려동물명 : <input name="pName" value="<%=pName%>" type="text"></div>
			<div>반려동물종류 : <input name="pType" type="text" value="<%=rs.getString("PET_TYPE")%>"></div>
			<div>품　　종: <input name="pKind" type="text"></div>
			<div>성　　별 : 수컷<input name="pGender" type="radio" value="M">
					암컷<input name="pGender" type="radio" value="W"></div>
			<div>중성화여부 : O<input name="pNeu" type="radio" value="O">
					X<input name="pNeu" type="radio" value="X"></div>
			<div>나　　이 : <input name="age" type="text"></div>
			<div>동물등록번호 : <input name="pNo" type="text" ></div>
			<div>체　　중 : <input name="pHeight" type="text"></div>
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
function userJoin(){
	var form = document.userForm;
	form.submit();
}
	
</script>
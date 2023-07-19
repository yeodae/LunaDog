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
	<%@ include file="../jsp_heid_set.jsp" %>
<form name="userForm" action="main_insert_sql.jsp">
<h3><span style="color:rgb(233, 151, 0);">반려동물 정보</span>입력</h3>
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
			<div><input name="pName" value="<%=pName%>" type="text" placeholder="반려동물이름"></div>
			<div><input name="pType" type="text" value="<%=rs.getString("PET_TYPE")%>" placeholder="반려동물종류"></div>
			<div><input name="pKind" type="text" placeholder="품종"></div>
			<div><input type="radio" id="pGen1" name="pGender" value="M" class="pGender" checked>
            <label for="pGen1">남아</label>
            <input type="radio" id="pGen2" name="pGender" value="W" class="pGender">
            <label for="pGen2">여아</label>
 			</div>
			<div><input type="radio" id="pNe1" name="pNeu" value="M" class="pNeu" checked>
			<label for="pNe1">중성화O</label>
            <input type="radio" id="pNe2" name="pNeu" value="W" class="pNeu">
            <label for="pNe2">중성화X</label>
			<div><input name="age" type="text" placeholder="반려동물나이"></div>
			<div><input name="pNo" type="text" placeholder="동물등록번호"></div>
			<div><input name="pHeight" type="text" placeholder="반려동물체중"></div>
		<%
		}
	
		}catch(SQLException e){
		out.println(e.getMessage());
		}
	%>

	<input type="button" value="정보추가" onclick="petJoin()">
</form>
</div>
</body>
</html>
<script>
function petJoin(){
	var form = document.userForm;
	
	var regType1 = /^[ㄱ-ㅎ|가-힣]+$/;
	if(!regType1.test(form.pName.value) ){
		alert("반려동물명은 한글로만 입력해주세요");
		form.pName.select();
		return;
	}
	if(!regType1.test(form.pType.value) ){
		alert("반려동물종류는 한글로만 입력해주세요");
		form.pType.select();
		return;
	}
	if(!regType1.test(form.pKind.value) ){
		alert("품종은 한글로만 입력해주세요");
		form.pKind.select();
		return;
	}
	var numb = /^[0-9]+$/;
	if(!numb.test(form.age.value) ){
		alert("반려동물나이는 숫자로만 입력해주세요");
		form.pKind.select();
		return;
	}
	if(form.pName.value == "" || form.pName.value == undefined){
		alert("반려동물명은 필수 값 입니다.");
		form.pName.focus();
		return;
	}
	
	form.submit();
}
	
</script>
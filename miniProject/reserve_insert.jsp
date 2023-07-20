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
<form name="updateForm" action="reserve_insert_sql.jsp">

	<%
	request.setCharacterEncoding("UTF-8");
	String uId = request.getParameter("uId");
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		stmt = conn.createStatement();
		String select = "select * from YEO_TBL_USER WHERE STATUS = 'U' ORDER BY U_ID ASC";
		rs = stmt.executeQuery(select);
		
		if(rs.next()){
			String pName
			=rs.getString("PET_NAME") != null ? rs.getString("PET_NAME") : "";
			%>
			<h2>예약 추가</h2>
			<div>반려동물명:<input name="pName" type="text"></div>
			<div>연락처　:<input name="phone" type="text"></div>
			<div>예약일자:<input name=dDay type="date" ></div>
			<div>시작시간:<input name=sDate type="time" min="10:00" max="18:00"></div>
			<div>종료시간:<input name="eDate" type="time" min="11:00" max="20:00"></div>
			<div>전달메모: <input name="cut" type="text" placeholder="요구사항 입력란"></div>

		<%
		}
	
		}catch(SQLException e){
		out.println(e.getMessage());
		}
	%>

	<input type="submit" value="예약하기" onclick="resIns()">
</form>
</div>
</body>
</html>
<script>
function resIns(){
	var form = document.updateForm;
	form.submit();
}
if(form.sDate.value<=form.eDate.value){
	alert("종료시간이 시작시간보다 빠릅니다.");
	return;
}

	
</script>
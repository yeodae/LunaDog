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
             margin-top: 150px;
        }
        #container{
        	line-height: 20px;
            width: 1200px;
            border: 1px solid white;
            text-align: center;
            margin: 0 auto; 
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            box-shadow: -5px -5px 10px #fff, 5px 5px 30px

            #babebc;
            overflow: hidden;
            
            min-height: calc(100% - 120px);
             margin-top:50px;
             font-size:15px;
        }
		form input {
            background: #eee;
            padding: 16px;
            margin: 8px 0;
            width: 100%;
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
         [type="submit"] {
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
        
        table{
         text-align: center;
        
            margin: 0 auto; 
        }
        #submit{
         	width: 10%;
        }
        footer{
			 margin-top: 100px; 
			}
</style>
</head>
<body>
<%@ include file="../jsp_heid_set.jsp" %>
<%@ include file="header2.jsp" %>
<div id="container">
<form name="list">
	<table>
		<tr>
			<th>반려동물이름</th>
			<th>연락처</th>			
			<th>예약일자</th>
			<th>시작시간</th>
			<th>종료시간</th>	
			<th>수정</th>	
			<th>원하는 스타일</th>
			<th>삭제</th>
			<th>상태</th>
			
		</tr>
		<%
			ResultSet rs = null;
			Statement stmt = null;
			
			uId = request.getParameter("uId");
			
			try {
				String sql = "select * from YEO_TBL_RESERVE WHERE STATUS = 'U' ORDER BY DDAY ASC";
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
			<tr>
				<input name="user" value="<%=rs.getString("PET_NAME")%>"hidden>
				<td><span style="font-weight:bold"><%=pName%></span></td>
				<td><%=phone%></td>
				<td><span style="color:rgb(233, 151, 0); font-weight:bold"><%=dDay%></span></td>
				<td><span style="color:rgb(233, 151, 0);"><%=sDate%></span></td>
				<td><%=eDate%></td>
				<td><input type="button" value="예약변경" onclick="timeUpdate('<%=pName%>')"></td>
				<td><%=cut%></td>
				<td><input type="button" value="예약취소" onclick="reserveDel('<%=pName%>')"></td>
				<td><input type="button" value="완료" onclick="ok('<%=phone%>')"></td>
			</tr>
			
		<%
				}
			}catch (SQLException ex) {
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} 
		%>
	</table>
	<input type="button" id="submit" onclick="rInsert('<%=request.getParameter("U_ID")%>')" value="예약추가"/>
</form>
</div>
 <footer><jsp:include page="footer2.jsp"/></footer>
</body>
</html>
<script>
	function reserveDel(pName){
		if(!confirm("정말 삭제하시겠습니까?")){
			return;
		} 
		window.open("reserve_del.jsp?pName="+pName,"reservedelete"
				,"width=500, height=500");
	}
	function ok(phone){
		if(!confirm("미용이 끝났습니까?")){
			return;
		} 
		window.open("ok.jsp?phone="+phone,"end"
				,"width=500, height=500");
	}
	function rInsert(phone){ //예약추가
		window.open("reserve_insert.jsp?phone="+phone,"reserve"
				,"width=500, height=500");
	}
	function timeUpdate(pName){ //예약시간변경
		window.open("reserve_update.jsp?pName="+pName,"timeupdate"
				,"width=500, height=500");
	}
	function getReturn(){
		location.reload();
	}
</script>
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
            width: 900px;
            border: 1px solid white;
            text-align: center;
            margin: 0 auto; 
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            box-shadow: -5px -5px 10px #fff, 5px 5px 30px #babebc;
            overflow: hidden;
            padding-bottom: 100px;
             min-height: calc(100% - 120px);
             margin-top:150px;
             font-size:15px;
        }
		form input {
            background: #eee;
            padding: 16px;
            margin: 8px 0;
            width: 90%;
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
        #btn{
        	width: 30%;
        }
        footer{
			 margin-top: 100px; 
			}
	
</style>
</head>
<body>
<div id="container">
<%@ include file="../jsp_heid_set.jsp" %>
<%@ include file="header2.jsp" %>
<form name="list">
	<div>
	<h1><span style="color:rgb(233, 151, 0);">보호자 정보</span></h1>
	<table>
		<tr>
			<th>보호자</th>
			<th>연락처</th>
			<th>이용권</th>
			<th>방문횟수</th>
			<th>직전매출</th>
			<th>총매출</th>
			<th>알림톡수신여부</th>
			<th>방문일지기록</th>
			
		</tr>
		<%
			ResultSet rs = null;
			Statement stmt = null;
			uId = request.getParameter("uId");
			
			try {
				String sql = "select * FROM YEO_TBL_USER Y INNER JOIN YEO_TBL_GUARDIAN G ON Y.U_NAME = G.U_NAME INNER JOIN YEO_TBL_PET P ON Y.PET_NAME = P.PET_NAME WHERE U_ID = '"+uId+"'";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
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
						= rs.getString("UTIL") != null ? rs.getString("UTIL") : "미보유";
					String memo
						= rs.getString("MEMO") != null ? rs.getString("MEMO") : "공백";
					String sales
						= rs.getString("SALES") != "0" ? rs.getString("SALES") : "0";
					String evtyn
						= rs.getString("EVENT").equals("Y") ? "ON" : "OFF";
					String ment
						= rs.getString("MENT") != null ? rs.getString("MENT") : "없음";
		%>
			<tr>
				
				<input type="radio" name="user" value="<%=uId%>" hidden>
				<td><%=uName%></td>
				<td><%=phone%></td>
				<td><%=util%></td>
				<td><%=visit%></td>
				<td><%=sales%>원</td>
				<td><%=rs.getInt("ALLSALES")%>원</td>
				<td><input type="button" value="<%=evtyn%>"  onclick="ynChange('<%=rs.getString("EVENT")%>','<%=uName%>')"></td>
				<td><input type="button" value="기록하기" onclick="coco('<%=uName%>')"></td>
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

	<div>
		<h1><span style="color:rgb(233, 151, 0);">반려견 정보</span></h1>
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
				String sql = "select * FROM YEO_TBL_USER Y INNER JOIN YEO_TBL_GUARDIAN G ON Y.U_NAME = G.U_NAME INNER JOIN YEO_TBL_PET P ON Y.PET_NAME = P.PET_NAME WHERE U_ID = '"+uId+"'";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
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
					int cnt = rs.getInt("CNT"); 
					String memo
						= rs.getString("MEMO") != null ? rs.getString("MEMO") : "공백";
					String sales
						= rs.getString("SALES") != "0" ? rs.getString("SALES") : "0";
					String ment
						= rs.getString("MENT") != null ? rs.getString("MENT") : "없음";
					String allment
					= rs.getString("ALLMENT") != null ? rs.getString("ALLMENT") : "";
		%>
			<tr>
				
				<input type="radio" name="user" value="<%=uId%>" hidden>
				<input type="radio" name="userName" value="<%=uName%>" hidden>
				<td><%=pName%></td>
				<td><%=pType%></td>
				<td><%=pKind%></td>
				<td><%=pGender%></td>
				<td><%=pNeu%></td>
				<td><%=age%>살</td>
				<td><%=pNo%></td>
				<td><%=pHeight%>kg</td>
				<td><%=memo%></td>
			</tr>
			
		<div>
		<%-- <%=(new java.util.Date()).toLocaleString()%> --%>
		</div>
		
		<%String date = new java.util.Date().toLocaleString();
		out.println(date);
				}
				
			}catch (SQLException ex) {
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} 
		%>
	
	</table>
	
	</div>
	
</form>
</div>
 <footer><jsp:include page="footer2.jsp"/></footer> 
</body>
</html>
<script>
	function coco(uName){ // 기록일지 업데이트
		var uName = document.list.userName.value;
		window.open("guardian_update.jsp?uName="+uName,"방문일지기록"
				,"width=500, height=500");
	}
	function ynChange(kind, uName){
		if(kind == "N"){
			kind = "Y";
		}else{kind="N"}
		window.open("guardian_ban.jsp?uName="+uName+"&kind="+kind,"popup"
				,"width=300, height=150");
	}
	
	function getReturn(){
		location.reload();
	}
</script>
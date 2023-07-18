<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
         
        #Lbody{
        	box-sizing: border-box; 
            font-family: "Montserrat", sans-serif;
            margin: 0;
             padding: 0;
             margin-top: 100px;
        }
        #Lcontainer{
        	
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
        #Limg{
            margin: 5px auto;
            display: flex;
        }
        form input {
            background: #eee;
            padding: 16px;
            margin: 8px 0;
            width: 85%;
            border: 0;
            outline: none;
            border-radius: 20px;
            box-shadow: inset 7px 2px 10px #babebc, inset -5px -5px 12px #fff;
        }
      
        [type="radio"] {
        vertical-align: middle;
        appearance: none;
        background-color: white;
        box-shadow: none;
        padding: 2px;
        width: 2px;
        
        }
        [type="submit"]{
            width: 50%;
            padding: 10px;
            
        }
        label:hover{
            border-bottom: 3px solid black;
            cursor: pointer;
        }
        input:checked + label {
            border-bottom: 3px solid black;
            font-weight: bold;
        }
        .submit:hover{
            cursor: pointer;
            color: blue;
            font-weight: bold;
        }

    </style>
</head>

<body id="Lbody">
	<%
		/* session.removeAttribute("userId");
		session.removeAttribute("userName"); */
		/* session.invalidate(); */
		if(request.isRequestedSessionIdValid()){
			out.println("청소중");
			session.invalidate();
		}
		
		/* String uId = (String) session.getAttribute("userId");
		out.println(uId); */
		
		
	%>
	<img id="Limg" src="로그인사진.png" alt="">
	<div id="Lcontainer">
	<form action="check.jsp">
		 <h1>Sign In</h1>
        <div>
			<input id="u" type="radio" name="status" value="U" checked>
            <label for="u">일반회원</label>
			<input id="a" type="radio" name="status" value="A">
            <label for="a">관리자</label>
		</div>
		<div>
            <input placeholder="ID" name="uId">
        </div>
		<div>
            <input placeholder="Password" type="password" name="pwd">
        </div>
		
		<div><input class="submit" type="submit" value="Login"></div>

	</form>
	</div>
	<%-- <%@ include file="footer.jsp" %> --%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

		#main{
			margin-bottom : 100px;
		}

        #Hbody{
            margin-top: 0;
            padding-top: 0;
        }
        #Hcontainer{
            width: 1000px;
            margin: 0 auto;
        }
        .Himg{
            clear: both;
            display: block;
            float: left;
        }
        .tag a{
            text-decoration: none;
            font-size: 25px;
            font-weight: bold;
            margin: 20px;
            color: #ff4b2b;
            display: block;
            float: left;
            margin-top: 45px;
            margin-left: 60px;
            
        }
        .tag a:hover{
            border-bottom: 3px solid #ff4b2b;
            transition: all 0.2s linear;
            transform: scale(1.2);
        }
          #Lbody{
        	box-sizing: border-box; 
            font-family: "Montserrat", sans-serif;
            margin: 0;
            padding: 0;
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
         #Fcontainer{
            width: 1000px;
            margin: 0 auto;
        }
        #Fbody{
            margin: 15px;
            color: grey;
        }
        #Fa{
            color: grey;
            font-weight:lighter;
        }
        #footer1{
            float: left;
            margin-right: 30px;
            
        }
        #footer-content{
            float: left;
            font-size: 13px;
            margin-right: 30px;
        }
        #content-info{
            float:left;
            margin-right: 30px;
        }
        .go a{
            color: #555;
            font-weight: bold;
        }
        #Fbody div{
            font-size: 13px;
        }
        .safe{
            font-size: 12px;
        }
        .Fimg{
            clear: both;
        }
    
        
    </style>
</head>
<body>
	<div>
		<div id="Hbody">
 			<div id="Hcontainer">
        <p class="Himg">
            <a href="#"><img src="logo1.jpg" alt="lunadog__official"></a>
              
        <div class="tag">
            <a href="#" style="color: darkorange;">스타일</a>
            <a href="#" >인스타그램</a>
            <a href="#" style="color: black;" >로그인</a>
            <a href="#" style="color: black;">회원가입</a>
            </div>
        </div>
        </div>
</div>



<div id="main">
	<div id="Lbody">
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
</div>
</div>



<div>
	<div id="Fbody">

    <div id="Fcontainer">
        <p class="Fimg">
            <a id="Fa" href="#"><img src="배너.jpg" alt=""></a>
        </p>
    <div id="footer1">
        <h1><a href="https://www.instagram.com/lunadog__official/" style="text-decoration: none;">LunaDog</a></h1>
    </div>
    <div id="footer-content">
        <div>상호명 및 호스팅 서비스 제공 : 여대현(주)
            <br>
            대표자 : 여대현
            <br>
            인천광역시 미추홀구 용정공원로 33 (SK SKY VIEW) 근린생활시설C 106호
            <br>
            사업자 등록번호 : 120-88-01234
            <br>
            통신판매업신고 : 2017-인천미추홀-0680
            <br>
            <a href="#" style="color:#555">사업자정보 확인 ></a>
        </div>
    </div>
    <div id="content-info">
        <div class="go">
        <a id="Fa" href="#" style="text-decoration: none;">365 고객센터|전자금융거래분쟁처리담당
        <div><h1>1577-1234 (유료)</h1></div>
        </div>
        <div>제주 제주시 애월읍 애월해안로 906 1층</div>
        <div>email : Jeju@coupang.com</div></a>
    </div>
    <p class="safe">
        <strong>신한은행 채무지급보증 안내</strong>
        <br>
        <span>
            당사는 고객님이 현금 결제한 금액에 대해
            <br>
            우리은행과 채무지급보증 계약을 체결하여
            <br>
            안전거래를 보장하고 있습니다.
            <br>
        </span>
        <a id="Fa" href="#" class="safelast">서비스 가입사실 확인 > </a>
    </p>
   
</div>
</div>

</div>

</body>
</html>
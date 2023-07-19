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
		#Jbody{
        	box-sizing: border-box; 
            margin: 0;
             padding: 0;
             margin-top: 130px;
             font-size: 15px;
        }
        #Jcontainer{
        	text-align: center;
            width: 500px;
            border: 1px solid white;
            margin: 0 auto; 
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            box-shadow: -5px -5px 10px #fff, 5px 5px 30px #babebc;
           /*  min-height: 480px; */
            overflow: hidden;
	        height: auto;
		    min-height: 100%;
		
			}
			footer{
				display: flex;
				width: 1000px;
			   margin: 0 auto;
			 margin-top: 100px;
			}
        #Limg{
            margin: 5px auto;
            display: flex;
        }
        form input {
            background: #eee;
            padding: 10px;
            margin: 8px 0;
            width: 50%;
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
            width: 20%;
            padding: 10px;
        }
        #idch{
            margin: 10px;
            width: 15%;
            padding: 5px;
        }
        #jo{
            width: 20%;
            
        }
        #wc{
            margin: 30px;
            width: 450px;
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
	
</style>
</head>
<body id="Jbody">
<%@ include file="header2.jsp" %>
<div id="Jcontainer">
        <div id="wc">
        <h2>회원가입</h2>
    	<form action="join_insert.jsp" name = "userForm" method="post">
		<div> <input type="text" name="uId" placeholder="아이디" style="width: 30%;"><input id="idch" type="button" onclick="idCheck();" value="중복여부" ></div>
		<div> <input type="password" name="pwd1" placeholder="비밀번호"></div>
		<div> <input type="password" name="pwd2" placeholder="확인 비밀번호"></div>
		<div> <input type="text" name="uName" placeholder="보호자 이름"></div>
		<div> <input type="text" name="phone" placeholder="휴대전화번호"></div>
		<div><input type="radio" id="petType" name="pType" value="M" class="pType" checked>
            <label for="petType">강아지</label>
            <input type="radio" id="petType2" name="pType" value="W" class="pType">
            <label for="petType2">고양이</label>
 		</div>
		<div> <input type="text" name="pName" placeholder="반려동물 이름"></div>
		<div><input type="text" name="memo" placeholder="특이사항(심장병/입질/슬개골수술)"></div>
		<div><input type="radio" id="alam1" name="evt" value="Y" class="evt" checked>
            <label for="alam1">알림톡 허용</label>
            <input type="radio" id="alam2" name="evt" value="N" class="evt">
            <label for="alam2">알림톡 거부</label>
 		</div>
		<div><input type="text" name="pwhint" placeholder="PW 분실 시 확인용 단어"></div>
		<div><input type="button" onclick="userJoin()" value="회원가입" id="jo"></div>
	    </form>
        </div>
    </div>
    <footer><%@ include file="footer2.jsp" %></footer>
</body>
</html>
<script>
	var check1 = false; // 아이디 중복체크 확인 여부
	var check2 = false; // 중복 여부
	function userJoin(){
		var form = document.userForm;
		if(!check1){
			alert("아이디 중복체크를 해주세요.");
			return;
		}
		if(!check2){
			alert("중북된 아이디가 있습니다.");
			return;
		}
		var regType1 = /^[A-Za-z0-9]+$/;
		if(!regType1.test(form.uId.value) ){
			alert("아이디는 영문, 숫자의 조합으로 가능합니다.");
			form.uId.select();
			return;
		}
		if(form.pwd1.value.length <= 4){
			alert("비밀번호는 4자리 이상 입력해주세요.");
			form.pwd1.select();
			return;
		}
		if(form.pwd1.value != form.pwd2.value){
			alert("패스워드가 다릅니다.");
			return;
		}
		if(form.uId.value == "" || form.uId.value == undefined){
			alert("아이디는 필수 값 입니다.");
			form.uId.focus();
			return;
		}
		if(form.pwd1.value == "" || form.pwd1.value == undefined){
			alert("패스워드는 필수 값 입니다.");
			form.pwd1.focus();
			return;
		}
		if(form.uName.value == "" || form.uName.value == undefined){
			alert("보호자명은 필수 값 입니다.");
			form.uName.focus();
			return;
		}
		if(form.phone.value == "" || form.phone.value == undefined){
			alert("연락처는 필수 값 입니다.");
			form.phone.focus();
			return;
		}
		if(form.pName.value == "" || form.pName.value == undefined){
			alert("강아지명은 필수 값 입니다.");
			form.pName.focus();
			return;
		}
		form.submit();
	}
	function idCheck(){
		check1 = true;
		var form = document.userForm;
		if(form.uId.value =="" || form.uId.value.length < 0){
			alert("아이디를 먼저 입력해주세요")
			form.uId.focus();
		}else{
			window.open("idCheck.jsp?uId="+form.uId.value, "check","width=500, height=300");
		}
	}
	function getReturn(val){
		if(val == "Y"){
			check2 = true;
		} else {
			check2 = false;
		}
	}
	
</script>
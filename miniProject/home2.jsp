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
         
        #Lbody{
        	box-sizing: border-box; 
            margin: 0;
             padding: 0;
             margin-top: 170px;
        }
        #Lcontainer{
        	width: 1920px;
            border: 1px solid white;
            text-align: center;
            margin: 0 auto; 
           
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            box-shadow: -5px -5px 10px #fff, 5px 5px 30px

            #babebc;
            overflow: hidden;
            font-size:15px;
           
        }
        #Limg{
            margin: 5px auto;
            display: flex;
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
       label:hover{
            border-bottom: 3px solid orange;
            cursor: pointer;
        }
        input:checked + label {
            color:rgb(233, 151, 0);
            border-bottom: 3px solid orange;
            font-weight: bold;
        }
        .submit:hover{
            cursor: pointer;
            color: rgb(233, 151, 0);
            font-weight: bold;
        }
         #logoBox{
            margin: 0 auto;
            padding: 0;
            width: 300px;   
        }
        #idbox{
            float: left;
        }
        #pwbox{
            float: right;
        }
        .find{
            margin: 20px;
            font-size: 13px;
        }
        .find:hover{
            font-weight: bold;
        }
        .find a{
            text-decoration: none;
            color: #bbb;
        }
        footer{
			display: flex;
			width: 1000px;
			margin: 0 auto;
			margin-top: 100px;
			}
		.box1{
			margin : 0 auto;
			display:block;
			background-color: rgba(228,227,227,1);
			background-repeat:no-repeat;
			background-position:center center
			background-size:cover;
			padding-bottom: 50px;
		}
		.box2{
			margin : 0 auto;
			display:grid;
			background-color: rgba(228,227,227,1);
			background-repeat:no-repeat;
			background-position:center center
			background-size:cover;
			grid-template-columns: repeat(6, 1fr);
			grid-column: 0px;
			grid-gap: 0 30px;
			margin-left: 100px;
           margin-right: 100px;
		}
		.box3{
			float:left;
			margin : 0 auto;
			display:block;
		}
		.img img{
			width : 150px;
			height : 150px;		
		}
        .box1 hr{
        	width:50px;
        }
        .box1 h2{
        	padding-top: 50px;
        	padding-bottom: 50px;
        }
        
    </style>
</head>

<body id="Lbody">
	<jsp:include page="header2.jsp"/>
	<%-- <%@ include file="header2.jsp" %> --%>
	<div id="Lcontainer">
			<div class="box1">
				<div>
					<h2>
					<span style="font-size:32px">
					<strong>전국 1,500개 가맹점이 루나를 사용하고 있습니다</strong>
					</span>
					</h2>
					<br>
				</div>
			
			<div class="box2">
				<div class="img">
					<div>
						<p><a href="https://map.naver.com/v5/entry/place/1285966801?placePath=%2Fhome" target="_blank"><img src="다올.jpg"><hr><span>청담 다올</span></a></p>
					</div>
				</div>
				<div class="img">
					<div>
						<p><a href="https://map.naver.com/v5/entry/place/276365898?placePath=%2Fhome" target="_blank"><img src="슈앤트리.png"><hr><span>슈앤트리</span></a></p>
					</div>
				</div>
				<div class="img">
					<div>
						<p><a href="https://map.naver.com/v5/search/%EB%A3%A8%EB%82%98%EB%8F%85/place/1630591342?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target="_blank"><img src="로고만.jpg"><hr><span>루나독</span></a></p>
					</div>
				</div>
				<div class="img">
					<div>
						<p><a href="https://map.naver.com/v5/search/%EC%81%98%EB%9D%A0%EC%88%91/place/1798459700?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target="_blank"><img src="쁘띠숑.png"><hr><span>쁘띠숑</span></a></p>
					</div>
				</div>
				<div class="img">
					<div>			
						<p><a href="https://map.naver.com/v5/search/%ED%94%84%EB%9E%91%EC%86%8C%EC%99%80%ED%8E%AB?c=15,0,0,0,dh" target="_blank"><img src="프랑소와펫.jpg"><hr><span>프랑소와펫</span></a></p>
					</div>
				</div>
				<div class="img">				
					<div>						
						<p><a href="https://map.naver.com/v5/search/%EA%B7%B8%EB%A3%A8%EB%A8%B8%EC%95%84%EB%A9%94%EB%A6%AC/place/1991682040?c=15,0,0,0,dh&isCorrectAnswer=true" target="_blank"><img src="그루머아메리.png"><hr><span>그루머아메리</span></a></p>
					</div>
				</div>
				<div class="img">			
					<div>						
						<p><a href="https://map.naver.com/v5/search/%EC%95%88%EC%95%84%EC%A4%84%EA%B0%9C/place/37792188?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target="_blank"><img src="안아줄개.png"><hr><span>안아줄개</span></a></p>
					</div>
				</div>
				<div class="img">					
					<div>						
						<p><a href="https://map.naver.com/v5/search/%EC%BB%B4%ED%8F%AC%ED%84%B0%EB%B8%94/place/1025577996?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target="_blank"><img src="컴포터블.png"><hr><span>컴포터블</span></a></p>
					</div>
				</div>
				<div class="img">
					<div>					
						<p><a href="https://map.naver.com/v5/search/%EB%A9%94%EC%9D%B4%EC%A0%80%EB%8F%85/place/1041726640?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target="_blank"><img src="메이저독.jpg"><hr><span>메이저독</span></a></p>
					</div>
				</div>
				<div class="img">					
					<div>						
						<p><a href="https://map.naver.com/v5/search/%ED%94%8C%EB%9F%AC%ED%94%BC/place/1214304370?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target="_blank"><img src="플러피.jpg"><hr><span>플러피</span></a></p>
					</div>
				</div>
				<div class="img">				
					<div>						
						<p><a href="https://map.naver.com/v5/search/%EB%AD%89%EA%B0%9C%EB%AD%89%EA%B0%9C/place/37700962?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target="_blank"><img src="뭉개뭉개.png"><hr><span>뭉개뭉개</span></a></p>
					</div>
				</div>
				<div class="img">					
					<div>						
						<p><a href="https://map.naver.com/v5/search/%EC%86%8C%EC%9B%94%EC%A7%91/place/1657824797?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target="_blank"><img src="소월집.jpg"><hr><span>소월집</span></a></p>
					</div>
				</div>
				<div class="img">					
					<div>						
						<p><a href="https://map.naver.com/v5/search/%EB%8B%B4%EB%8B%B4%EA%B7%B8%EB%A3%A8%EB%B0%8D%EC%83%B5/place/1048608585?c=15,0,0,0,dh&isCorrectAnswer=true" target="_blank"><img src="담담그루밍샵.jpg"><hr><span>담담그루밍샵</span></a></p>
					</div>
				</div>
				<div class="img">			
					<div>						
						<p><a href="https://map.naver.com/v5/entry/place/1417726550?lng=126.9181621&lat=37.4827658&placePath=%2Fhome%3Fentry=plt&c=15,0,0,0,dh" target="_blank"><img src="연희동미미네.png"><hr><span>연희동 미미네</span></a></p>
					</div>
				</div>
				<div class="img">					
					<div>						
						<p><a href="https://map.naver.com/v5/search/%EB%94%94%EC%98%A4%EC%95%A4%EB%B9%88?c=15,0,0,0,dh" target="_blank"><img src="디오앤빈.png"><hr><span>디오앤빈</span></a></p>
					</div>
				</div>
				<div class="img">					
					<div>						
						<p><a href="https://map.naver.com/v5/search/%EB%84%88%EC%99%80%EB%82%98%20%EB%AC%98%EC%97%B0/place/1531414444?c=15,0,0,0,dh&isCorrectAnswer=true" target="_blank"><img src="너와나묘연.png"><hr><span>너와나 묘연</span></a></p>
					</div>
				</div>
				<div class="img">					
					<div>						
						<p><a href="https://map.naver.com/v5/search/artemis%20kiss/place/825979545?c=15,0,0,0,dh&isCorrectAnswer=true" target="_blank"><img src="아르떼미스.jpg"><hr><span>아르떼미스</span></a></p>
					</div>
				</div>
				<div class="img">					
					<div>						
						<p><a href="https://map.naver.com/v5/search/%EB%8B%A4%EC%A6%90%EB%A7%81/place/1273025099?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target="_blank"><img src="다즐링.jpg"><hr><span>다즐링</span></a></p>
					</div>
				</div>
				<div class="img">					
					<div>						
						<p><a href="https://map.naver.com/v5/search/%EB%A9%8D%EB%A9%8D%ED%94%8C%EB%9D%BC%EC%9B%8C/place/1729418652?c=15,0,0,0,dh&isCorrectAnswer=true" target="_blank"><img src="멍멍플라워.png"><hr><span>멍멍플라워</span></a></p>
					</div>
				</div>
				<div class="img">
					<div>				
						<p><a href="https://map.naver.com/v5/search/%EB%A7%88%EC%9D%B4%ED%8B%B0%EA%B7%B8%EB%A3%A8%EB%B0%8D?c=15,0,0,0,dh&isCorrectAnswer=true" target="_blank"><img src="마이티그루밍.png"><hr><span>마이티그루밍</span></a></p>
					</div>
				</div>
				<div class="img">					
					<div>						
						<p><a href="https://map.naver.com/v5/search/%EC%95%BC%EC%98%B9%EC%95%84%EB%A9%8D%EB%A9%8D%ED%95%B4%EB%B4%90?c=15,0,0,0,dh&isCorrectAnswer=true" target="_blank"><img src="야옹아멍멍해봐.png"><hr><span>야옹아멍멍해봐</span></a></p>
					</div>
				</div>
				<div class="img">					
					<div>						
						<p><a href="https://map.naver.com/v5/search/%EB%AF%B8%EB%AF%B8%EA%B7%B8%EB%A3%A8%EB%B0%8D?c=15,0,0,0,dh&isCorrectAnswer=true" target="_blank"><img src="미미그루밍.png"><hr><span>미미그루밍</span></a></p>
					</div>
				</div>
				<div class="img">					
					<div>						
						<p><a href="https://map.naver.com/v5/search/%EB%8B%AC%EB%A3%A8%EB%94%94%EC%9B%80/place/1245981672?c=15,0,0,0,dh&isCorrectAnswer=true" target="_blank"><img src="달루디움.png"><hr><span>달루디움</span></a></p>
					</div>
				</div>
				<div class="img">					
					<div>					
						<p><a href="https://map.naver.com/v5/search/%EC%98%AC%EB%9D%BC%EB%8F%85/place/1684317237?c=15,0,0,0,dh&isCorrectAnswer=true" target="_blank"><img src="올라독.jpg"><hr><span>울라독</span></a></p>
					</div>
				</div>
			</div>
			<div class="box3">
				<img src="홈22.PNG">
			</div>
		</div>
	</div>
	<%-- <%@ include file="footer.jsp" %> --%>
	<footer><%@ include file="footer2.jsp" %></footer>
</body>
</html>
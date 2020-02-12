<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- css 설정
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
  -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.css" >
<meta charset="UTF-8">
<title>header</title>
</head>
<body>

<!--검색 유효성검사 -->
<script language=javascript>
	function send(theform) {
		if(theform.search.value=="") {
			alert("검색어를 입력하세요");
			theform.search.focus();
			return false;
		}
		theform.submit();
	}
</script>

<div id="logo">
	<h1><a href="#" class="icon icon-group"><span>Swarming</span></a></h1>
	
	<div id="search">
	 <ul class="member">
			 <li><a href="#" class="icon icon-login"><span>로그인</span></a></li>
			 <li><a href="#" class="icon icon-join"><span>회원가입</span></a></li>
	 </ul>
	 <ul class="contact">
			 <li><form action="" method=post name="sform">
		 	   <input type=text name=search size=25>
			   <input type=button value="검 색" class="bnt_search" onclick="send(this.form);">
			 </form></li>
			 <li><a href="#" class="icon icon-facebook"><span>Facebook</span></a></li>
			 <li><a href="#" class="icon icon-Instagram"><span>Instagram</span></a></li>
			 <li><a href="#" class="icon icon-twitter"><span>Twitter</span></a></li>
	 </ul>
	</div>
</div>

<!------------------------------ 메뉴바 --------------------------->
<div id="header">
	<div id="menu" class="container">
		<ul>
			<li><a href="#" accesskey="1" title="">공지사항</a>
			  <div class="sub_menu"> 
			    <ul>
	              <li><a href="#">사이트소개</a></li>
	              <li><a href="#">새 소식</a></li>
	            </ul>
	          </div> 
	        </li>
			<li><a href="#" accesskey="2" title="">상품소개</a>
			  <div class="sub_menu"> 
			    <ul>
	              <li><a href="#">예금</a></li>
	              <li><a href="#">적금</a></li>
	            </ul>
	          </div>
	        </li>
			<li><a href="#" accesskey="3" title="">커뮤니티</a>
			  <div class="sub_menu"> 
			    <ul>
	              <li><a href="#">리뷰</a></li>
	              <li><a href="#">자유게시판</a></li>
	              <li><a href="#">모임방</a></li>
	              <li><a href="#">토론방</a></li>
	              <li><a href="#">제태크노하우</a></li>
	              <li><a href="#">BEST게시판</a></li>
	            </ul>
	          </div>
	        </li>
			<li><a href="#" accesskey="4" title="">고객센터</a>
			  <div class="sub_menu"> 
			    <ul>
	              <li><a href="#">자주하는 질문</a></li>
	              <li><a href="#">QnA</a></li>
	              <li><a href="#">Contact-email</a></li>
	            </ul>
	          </div>
	        </li>
			<li><a href="#" accesskey="5" title="">관련사이트</a>
			  <div class="sub_menu"> 
			    <ul>
	              <li><a href="#">국내관련사이트</a></li>
	              <li><a href="#">해외관련사이트</a></li>
	            </ul>
	          </div>
			</li>
			<li><a href="#" accesskey="5" title="">MyPage</a>
		  	  <div class="sub_menu"> 
			    <ul>
	              <li><a href="#">개인정보관리</a></li>
	              <li><a href="#">내가 작성한 글</a></li>
	              <li><a href="#">가입상품</a></li>
	              <li><a href="#">관심상품</a></li>
	            </ul>
	          </div>
			</li>
			<li><a href="#" accesskey="5" title="">뉴스와정보</a>
			  <div class="sub_menu"> 
			    <ul>
	              <li><a href="#">금융회사정보</a></li>
	              <li><a href="#">관련뉴스</a></li>
	            </ul>
	          </div>
			</li>
		</ul>
	</div>
</div>
</body>
</html>

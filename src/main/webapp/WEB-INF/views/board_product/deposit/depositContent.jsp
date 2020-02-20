<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fonts.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/body.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/product.css">
<meta charset="EUC-KR">
<title>예금 상품 상세</title>
<script>

function show_area1(){
	document.getElementById("a1").style.display="block";
	document.getElementById("a2").style.display="none";
}

function show_area2(){
	document.getElementById("a1").style.display="none";
	document.getElementById("a2").style.display="block";
}
</script>
</head>
<body>

	<!-- *********************** 게시판 글쓰기 폼 ****************************  -->
	<jsp:include page="../../header.jsp"></jsp:include>

	<!-- *********************** 사이드 메뉴 ****************************  -->

	<div id="body_div">
		<div id="side_menu">
			<h4>
				<a href="#">상품소개</a>
			</h4>
			<div id="side_div">
				<ul id="side_submenu">
					<li>- <a href="depositList.do?current_page=1">예 금</a></li>
					<li>- <a href="savingList.do?current_page=1"> 적 금</a></li>
				</ul>
			</div>
		</div>
		<!-- *********************** 내용 ****************************  -->

		<div id="list_div">
			<div id="productContent">
				<sapn>금융회사 최종제출일:${submitDay}</span> <b><h2>${depositBean.getFin_prdt_nm()}</h2></b>
				<dl class="product-info1">
					<dd>${joinWay}</dd>
				</dl>
				<hr>
				<div class="product-info2">
					<dl class="img1">
						<img
							src="${pageContext.request.contextPath}/resources/images/calender.png" />
						<dt>기간</dt>
						<dd>${depositBean.getSave_trm()}개월</dd>
					</dl>
					<dl class="img2">
						<img
							src="${pageContext.request.contextPath}/resources/images/coin.png" />
						<dt>금융회사</dt>
						<dd>${depositBean.getKor_co_nm()}</dd>
					</dl>
					<dl class="img3">
						<img
							src="${pageContext.request.contextPath}/resources/images/graph.png" />
						<dt>최고</dt>
						<dd>
							연&nbsp;<span>${depositBean.getIntr_rate2()}%</span>
						</dd>
					</dl>
				</div>
				<div class="product-info3">
					<input type="button" value="장바구니"> <input type="button"
						value="가입하기">
				</div>
			</div>
			<!-- 상세설명/예금계산기 선택 -->
			
			<div id="productContet3">
					<div id="a1" class="product_button" >
						<input type="button" value="상세설명" onclick="show_area1()" /> 
						<input id="clicked" type="button" value="예금계산기" onclick="show_area2();"/>
					</div>
					<div id="a2" class="product_button" style="display:none;">
						<input id="clicked" type="button" value="상세설명" onclick="show_area1();">
						<input  type="button" value="예금계산기" onclick="show_area2();">
					</div>

			</div>

			<div id="a1">
			<div id="productContent2">
				<div class="product-info-group">
					<div class="product-info4">
						<dl>
							<dt>가입제한</dt>
							<dd>${join_deny}</dd>
						</dl>
						<dl>
							<dt>가입대상</dt>
							<dd>${depositBean.getJoin_member()}</dd>
						</dl>
						<dl>
							<dt>금리 유형</dt>
							<dd>${depositBean.getIntr_rate_type_nm()}</dd>
						</dl>
						<dl>
							<dt>만기 후 이자율</dt>
							<dd>${depositBean.getMtrt_int()}</dd>
						</dl>

					</div>
					<div class="product-info5">
						<dl>
							<dt>우대조건</dt>
							<dd>${depositBean.getSpcl_cnd()}</dd>
						</dl>

						<dl>
							<dt>기타사항</dt>
							<dd>${depositBean.getEtc_note()}</dd>
						</dl>
					</div>
				</div>
			</div>
			</div>
			<div id="a2" style="display:none;">
				<a>안녕하세요</a>
			</div>
		</div>
	</div>
	<!-- *********************** 게시판 글쓰기 폼 ****************************  -->

	<jsp:include page="../../footer.jsp"></jsp:include>

</body>
</html>
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
<title>���� ��ǰ ��</title>
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

	<!-- *********************** �Խ��� �۾��� �� ****************************  -->
	<jsp:include page="../../header.jsp"></jsp:include>

	<!-- *********************** ���̵� �޴� ****************************  -->

	<div id="body_div">
		<div id="side_menu">
			<h4>
				<a href="#">��ǰ�Ұ�</a>
			</h4>
			<div id="side_div">
				<ul id="side_submenu">
					<li>- <a href="depositList.do?current_page=1">�� ��</a></li>
					<li>- <a href="savingList.do?current_page=1"> �� ��</a></li>
				</ul>
			</div>
		</div>
		<!-- *********************** ���� ****************************  -->

		<div id="list_div">
			<div id="productContent">
				<sapn>����ȸ�� ����������:${submitDay}</span> <b><h2>${depositBean.getFin_prdt_nm()}</h2></b>
				<dl class="product-info1">
					<dd>${joinWay}</dd>
				</dl>
				<hr>
				<div class="product-info2">
					<dl class="img1">
						<img
							src="${pageContext.request.contextPath}/resources/images/calender.png" />
						<dt>�Ⱓ</dt>
						<dd>${depositBean.getSave_trm()}����</dd>
					</dl>
					<dl class="img2">
						<img
							src="${pageContext.request.contextPath}/resources/images/coin.png" />
						<dt>����ȸ��</dt>
						<dd>${depositBean.getKor_co_nm()}</dd>
					</dl>
					<dl class="img3">
						<img
							src="${pageContext.request.contextPath}/resources/images/graph.png" />
						<dt>�ְ�</dt>
						<dd>
							��&nbsp;<span>${depositBean.getIntr_rate2()}%</span>
						</dd>
					</dl>
				</div>
				<div class="product-info3">
					<input type="button" value="��ٱ���"> <input type="button"
						value="�����ϱ�">
				</div>
			</div>
			<!-- �󼼼���/���ݰ��� ���� -->
			
			<div id="productContet3">
					<div id="a1" class="product_button" >
						<input type="button" value="�󼼼���" onclick="show_area1()" /> 
						<input id="clicked" type="button" value="���ݰ���" onclick="show_area2();"/>
					</div>
					<div id="a2" class="product_button" style="display:none;">
						<input id="clicked" type="button" value="�󼼼���" onclick="show_area1();">
						<input  type="button" value="���ݰ���" onclick="show_area2();">
					</div>

			</div>

			<div id="a1">
			<div id="productContent2">
				<div class="product-info-group">
					<div class="product-info4">
						<dl>
							<dt>��������</dt>
							<dd>${join_deny}</dd>
						</dl>
						<dl>
							<dt>���Դ��</dt>
							<dd>${depositBean.getJoin_member()}</dd>
						</dl>
						<dl>
							<dt>�ݸ� ����</dt>
							<dd>${depositBean.getIntr_rate_type_nm()}</dd>
						</dl>
						<dl>
							<dt>���� �� ������</dt>
							<dd>${depositBean.getMtrt_int()}</dd>
						</dl>

					</div>
					<div class="product-info5">
						<dl>
							<dt>�������</dt>
							<dd>${depositBean.getSpcl_cnd()}</dd>
						</dl>

						<dl>
							<dt>��Ÿ����</dt>
							<dd>${depositBean.getEtc_note()}</dd>
						</dl>
					</div>
				</div>
			</div>
			</div>
			<div id="a2" style="display:none;">
				<a>�ȳ��ϼ���</a>
			</div>
		</div>
	</div>
	<!-- *********************** �Խ��� �۾��� �� ****************************  -->

	<jsp:include page="../../footer.jsp"></jsp:include>

</body>
</html>
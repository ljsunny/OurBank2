<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.css" >
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://kit.fontawesome.com/9bbe6ae1b4.js" crossorigin="anonymous"></script>
<meta charset="EUC-KR">
<title>���ݻ�ǰ ����Ʈ</title>
<script type="text/javascript">
function go_to_site(){
	alert(site);
	location.href=site;
}
function paging(page){
	location.href="savingList.do?current_page="+page;
}
function pre_paging(page){
	var pre_page=page-1;
	location.href="savingList.do?current_page="+pre_page;
}
function after_paging(page){
	var after_page=page+1;
	location.href="savingList.do?current_page="+after_page;
}


</script>
</head>
<body>

<!-- *********************** �Խ��� �۾��� �� ****************************  -->	
	<jsp:include page="../../header.jsp"></jsp:include>
	
<!-- *********************** ���̵� �޴� ****************************  -->	
	
	<div id="side_menu">
		<h4><a href="#">��ǰ�Ұ�</a></h4>
		<div id="side_div">
			<ul id="side_submenu">
				<li>- <a href="depositList.do?current_page=1">�� ��</a></li>
				<li>- <a href="savingList.do?current_page=1"> �� ��</a></li>
			</ul>
		</div>
	</div>
	
<!-- *********************** ���� ****************************  -->
<!-- �˻� -->
<table id="product_search" >
	<tr>
	<td align="right">
	<select name="bank">
	<c:forEach var="all_bank" items="${all_bank}">
		<option label="${all_bank.getKor_co_nm()}" value="${all_bank.getKor_co_nm()}"></option>
	</c:forEach>
	</select>
	<input type="text" >
	<input type="button" value="ã��" width="100px"></td>
	</tr>
</table>
<hr width="65%">
	<table align="center" id="product_table" width="60%" >
		<c:forEach var="boardList" items="${boardList}">
		
			<tr >
				<td><a id="product_name" 
				href="savingContent.do?current_page=${current_page}&fin_prdt_cd=${boardList.getFin_prdt_cd()}">${boardList.getFin_prdt_nm()}</a></td>
				<td>${boardList.getKor_co_nm()}</td>
				<td>�ְ� �� ${boardList.getIntr_rate()}%</td>
				<td>���ݸ� ${boardList.getIntr_rate2()}%</td>
				<td>${boardList.getIntr_rate_type_nm()}</td>
				<td>( ${boardList.getSave_trm()} ����)</td>
				
				<td><a href="#"><img src="${pageContext.request.contextPath}/resources/images/cart.png" 
				width="30" height="30" ></a>&nbsp;&nbsp;&nbsp;</td>
				<td><button><a href="${boardList.getHomp_url()}" target="blank">�����ϱ�</a></button>
				</td>
			</tr>
		</c:forEach>
	</table>
	<hr width="65%">
	<table align="center">
		<tr>
		<td>
			<input type="button" value="<<" onclick="paging(1)"/>
		</td>
		<td>
			<c:if test="${current_page>1}">
			<input type="button" value="<" onclick="pre_paging(${current_page})"/>
			</c:if>
		</td>
		<td>
		<c:forEach var="i" begin="${current_page}" end="${last_page}">
			<c:if test="${i<total_page}">
				<input type="button" value="${i}" onclick="paging(${i})"/>
			</c:if>
		</c:forEach>
		</td>
		<td>
			<c:if test="${current_page<total_page-1}">
			<input type="button" value=">" onclick="after_paging(${current_page})"/>
		
			</c:if>
		</td>
		<td>
			<input type="button" value=">>" onclick="paging(${total_page-1})"/>
		</td>
		</tr>
	</table>
	<hr width="65%">
	<!-- *********************** �Խ��� �۾��� �� ****************************  -->	

	<jsp:include page="../../footer.jsp"></jsp:include>
	
</body>
</html>
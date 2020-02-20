<%@ page language="java"
	import="java.util.*,java.sql.*,javax.servlet.http.*"
	contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.text.*"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- model�� ������ �а� �ҷ��� -->

<c:set var="str_aid" value="${idx}" />
<c:set var="str_c_page" value="${current_page}" />
<c:set var="searchString" value="${searchStr}" />
<c:set var="filename" value="${filename}"/>
<html>
<head>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.css" >
<title>QnA</title>
<%
	String searchString=(String) (pageContext.getAttribute("searchString"));
	String filename=(String) (pageContext.getAttribute("filename"));
	String uid=(String)session.getAttribute("uid");
%>
<script  language="javascript">
function boardlist(){
	var s="<%=searchString%>";
	if(s=="None")
		location.href='qnaList.do?current_page=${current_page}';
	else
		location.href='listSearchedSpecificPageWork.do?pageForView=${current_page}&searchStr=${searchStr}';	
}

function boardmodify(){
	location.href='qna_show_update_form.do?idx=${idx}&current_page=${current_page}';
}

function boarddelete(){
	location.href='qnaDeleteSpecificRow.do?idx=${idx}&current_page=${current_page}';	
}

function download(){
	var param="<%=filename%>";
	en_filename=encodeURI(param);
	location.href='qna_download.do?filename='+en_filename;
}
function boardreply(){
	location.href='reply_from.do?idx=${idx}&category=${category}';
}

</script>
</head>
<body>
<!-- *********************** �Խ��� �۾��� �� ****************************  -->	
	<jsp:include page="../../header.jsp"></jsp:include>
	
<!-- *********************** ���̵� �޴� ****************************  -->	
	
	<div id="side_menu">
		<h4><a href="#">������</a></h4>
		<div id="side_div">
			<ul id="side_submenu">
				<li>- <a href="faqList.do?current_page=1"> �����ϴ� ���� </a></li>
				<li>- <a href="qnaList.do?current_page=1"> QnA </a></li>
				<li>- <a href="#"> Contact </a></li>
			</ul>
		</div>
	</div>
	
<!-- *********************** ���� ****************************  -->	

<table cellspacing="0" cellpadding="5" border="1" width="600"  >
		<tr>
			<td><b>����</b></td>
			<td><c:out value="${boardData.getSubject()}" /></td>
			<td><b>��ȸ��</b></td>
			<td><c:out value="${boardData.getHits()}" /></td>
		</tr>
		<tr>
			<td><b>�̸�</b></td>
			<td><c:out value="${boardData.getId()}" /></td>
			<td><b>�ۼ���</b></td>
			<td><c:out value="${boardData.getCreated_date()}"></c:out></td>
		</tr>
		<tr>
			<td><b>����</b></td>
			<td  colspan="3" height="400" ><c:out value="${boardData.getContent()}" /></td>
		</tr>
		<tr>
			<td><b>����÷��</b></td>
			<td colspan="3">
			<input type="button" onclick="download()"
			value="${boardData.getFilename()}">
			</td>
		</tr>
	</table>

<table cellspacing="0" cellpadding="0" border="0" width="500">
	<tr>
	<td>
	<c:if test="${boardData.getId()==uid}">
		<!-- �ۼ��ڸ� ����, ���� �� ������ -->
		<input type="button" value="����" onclick="javascript:boardmodify()">
		<input type="button" value="����" onclick="javascript:boarddelete()">
	</c:if>
	<c:if test="${uid=='admin'}">
		<!-- �����ڸ� �ۼ��� �� ���� -->
		<input type="button" value="���" onclick="javascript:boardreply()">
	</c:if>
		<input type="button" value="���" onclick="javascript:boardlist()">
	</td>
	</tr>

</table>
</html>
	

<!-- *********************** �Խ��� �۾��� �� ****************************  -->	

	<jsp:include page="../../footer.jsp"></jsp:include>
	
</body>
</html>
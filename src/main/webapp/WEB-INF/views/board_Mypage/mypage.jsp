<%@ page language="java" import="java.util.*,java.sql.*,javax.servlet.http.*" 
contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd"> 
<%@ page import="java.io.*,java.text.*"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.css" >
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>My Page</title>
<script type="text/javascript">
function goToMyInfo(){
	location.href='myInfo.do';
}
</script>
</head>
<body>
<!-- *********************** �Խ��� �۾��� �� ****************************  -->	
	<jsp:include page="../header.jsp"></jsp:include>
	
<!-- *********************** ���̵� �޴� ****************************  -->	
	
	<div id="side_menu">
		<h4><a href="#">My Page</a></h4>
		<div id="side_div">
			<ul id="side_submenu">
				<li>- <a href="#"> ������������ </a></li>
				<li>- <a href="#"> ���� �ۼ��� �� </a></li>
				<li>- <a href="#"> ������ ��ǰ ��ȸ </a></li>
				<li>- <a href="#"> ���ɻ�ǰ </a></li>
			</ul>
		</div>
	</div>
	
<!-- *********************** ���� ****************************  -->
	
	<table align="center" style="padding: 30px;">
		<tr>
			<td><input type="button" value="������������"
				 style="width:200px;height:160px;"
				 onclick="goToMyInfo()"></td>
				 <!-- Ŀ�´�Ƽ �Խ����� ��� �ϼ��Ǹ� ����� -->
			<td><input type="button" value="���� �ۼ��� ��"
				 style="width:200px;height:160px;"></td>
		</tr>
		<tr>
			<!-- ��ǰ �Խ����� �ϼ��Ǹ� ����� -->
			<td><input type="button" value="������ ��ǰ ��ȸ"
				 style="width:200px;height:160px;"></td>
			<td><input type="button" value="���ɻ�ǰ"
				 style="width:200px;height:160px;"></td>
		</tr>
	</table>
	<!-- *********************** �Խ��� �۾��� �� ****************************  -->	

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
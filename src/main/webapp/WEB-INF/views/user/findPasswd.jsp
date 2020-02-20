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
<title>��й�ȣ ����</title>
<script language="javaScript" src="resources/js/script.js" charset="ECU-KR"></script>
</head>
<body>
<!-- *********************** �Խ��� �۾��� �� ****************************  -->	
	<jsp:include page="../header.jsp"></jsp:include>
	
<!-- *********************** ���̵� �޴� ****************************  -->	
	
	<div id="side_menu">
		<h4><a href="#">��й�ȣ ã��</a></h4>
	</div>
	
<!-- *********************** ���� ****************************  -->

<c:set var="ck" value="${ck}"></c:set>

<c:if test="${ck==1||ck==0}">
<div align="center">
		<table width="35%">
		<tr>
		<td>
			<div style="float: left;">
				<h1>��й�ȣ ã��</h1>
			</div>
			<div style="float: right; margin-top:25px">
				<a href="findId.do">���̵� ã��  </a>| <a href="signUp.do">ȸ������</a>
			</div>
			</td>
			</tr>
		</table>
		<hr width="500px"/>
	<form style="width: 30%;" method="post" action="findPasswdCheck.do">
			<table >
				<tr>
					<td>���̵�</td>
					<td><input type="text"  size="17" name="id"
						placeholder="���̵�" /></td>
					<td rowspan="4">
					<input type="submit" value="��й�ȣ ã��" style="width:100px; height:90px;" >
					</td>	
				</tr>
				<tr>
					<td>�̸�</td>
					<td><input type="text"  size="17" name="user_name"
						placeholder="�̸�" /></td>	
				</tr>
				<tr>
					<td>�������</td>
					<td><input type="date"   name="user_birth"/></td>
				</tr>
				<tr>
					<td>��ȭ��ȣ</td>
					<td><input type="text"  size="17"  name="user_phone" 
					placeholder="��ȭ��ȣ" /></td>
				</tr>
			</table>
		</form>
</div>

<hr width="500px"/>
<c:if test="${ck==1}">
<div align="center">
	��ġ�ϴ� ������ �����ϴ�.
</div>
<hr width="500px"/>
</c:if>
</c:if>
<c:if test="${ck==2}">
<div align="center">
		<table width="35%">
		<tr>
		<td>
			<div style="float: left;">
				<h1>��й�ȣ �缳��</h1>
			</div>
			<div style="float: right; margin-top:25px">
				<a href="findId.do">���̵� ã��  </a>| <a href="signUp.do">ȸ������</a>
			</div>
			</td>
			</tr>
		</table>
		<hr width="700px"/>
	<form name="regForm" style="width: 30%;" method="post" 
	action="changePasswdCheck.do" onsubmit="return equalPasswd();">
	<c:set var="id" value="${id}"></c:set>
			<table >
				<tr>
					<td>���ο� ��й�ȣ</td>
					<td><input type="password"  size="17" name="passwd"
						placeholder="���ο� ��й�ȣ Ȯ��" /></td>
					<td rowspan="4">
					<input type="submit" value="��й�ȣ ����" style="width:100px; height:60px;" >
					</td>	
				</tr>
				<tr>
					<td>���ο� ��й�ȣ Ȯ��</td>
					<td><input type="password"  size="17" name="ck_passwd"
						placeholder="���ο� ��й�ȣ Ȯ��" /></td>	
				</tr>
			</table>
		</form>
</div>
</c:if>

<!-- *********************** �Խ��� �۾��� �� ****************************  -->	

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" import="java.util.*,java.sql.*,javax.servlet.http.*" 
contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd"> 
<%@ page import="java.io.*,java.text.*"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
<script language="javaScript" src="resources/js/script.js" charset="EUC-KR"></script>
</head>
<body>
<!-- *********************** �Խ��� �۾��� �� ****************************  -->	
	<jsp:include page="../header.jsp"></jsp:include>
	
<!-- *********************** ���̵� �޴� ****************************  -->	
	
	<div id="side_menu">
		<h4><a href="#">�α���</a></h4>
	</div>
	
<!-- *********************** ���� ****************************  -->


<div align="center" style="padding: 50px;">
<h1 style="padding: 10px;">�α���</h1>
<form name="form" method="post" onSubmit="return blankCheck();" action="loginPro.do">
<table border="1" cellpadding="10" width="30%">
	<tr>
	<td><input name="id" size="40" maxlength="50" placeholder="���̵� �Է����ּ���" ></input></td>
	<td colspan="2" align="center" rowspan="2">
	<input type="submit" value="�α���"  width="30px"/></td>
	</tr>
	<tr>
	<td><input type="password" name="passwd" size="40" maxlength="50" placeholder="��й�ȣ�� �Է����ּ���"></input></td>
	</tr>
</table>
</form>
<c:if test="${noinfo==true}">
	<p > ���̵�/��й�ȣ�� Ȯ���� �ּ��� </p>
</c:if>
<a href="findId.do">���̵�</a> / <a href="findPasswd.do" style="padding-right: 10px"> ��й�ȣ ã��</a>| 
<a  href="signUp.do" style="padding-left: 10px">ȸ������</a>
</div>
<!-- *********************** �Խ��� �۾��� �� ****************************  -->	

	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*,java.text.*"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ID �ߺ�üũ</title>
<script type="text/javascript">
function reject(){
	window.opener.returnID();
	document.getElementById("id").value="";
}
</script>
</head>
<body>
<c:set var="check" value="${check}" />
<c:set var="id" value="${id}"/>

	<div align="center" >
	<b>${id}</b>
	<c:choose>
		<c:when test="${check}">
		�� ��� ���� �մϴ�.
		</c:when>
		<c:otherwise >
		
		�� �̹� �����ϴ� ID �Դϴ�.
		
		</c:otherwise>
	</c:choose>
	<p>
	<a href="#" onclick="self.close();">�ݱ�</a>
</div>
</body>
</html>
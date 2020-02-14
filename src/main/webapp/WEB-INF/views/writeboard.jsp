<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.css" >
<meta charset="EUC-KR">
<title>�� �ۼ��ϱ�</title>
</head>
<body>

<!-- *********************** �Խ��� �۾��� �� ****************************  -->	
	<jsp:include page="header.jsp"></jsp:include>
	
<!-- *********************** ���̵� �޴� ****************************  -->	
	
	<div id="side_menu">
		<h4><a href="#">Ŀ�´�Ƽ</a></h4>
		<div id="side_div">
			<ul id="side_submenu">
				<li>- <a href="#"> �� ��</a></li>
				<li>- <a href="#"> �����Խ���</a></li>
				<li>- <a href="#"> ���ӹ�</a></li>
				<li>- <a href="#"> ��й�</a></li>
				<li>- <a href="#"> ����ũ���Ͽ�</a></li>
				<li>- <a href="#"> BEST�Խù�</a></li>
			</ul>
		</div>
	</div>
	
<!-- *********************** ���� ****************************  -->	
	
	<div id="board">
		����
	</div>
	
	
<!-- *********************** �Խ��� �۾��� �� ****************************  -->	

	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
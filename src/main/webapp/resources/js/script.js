

function idCheck(id){
	if(id==""){
		alert("���̵� �Է��� �ּ���");
	}else{
		url="idCheck.do?id="+id;
		window.open(url,"get","width=300,height=150");
	}
}
function returnID(){
		document.regForm.id.value=null;
		
		document.regForm.id.focus();
}

function findAdress(){
	var pop = 
		window.open("zipCode.do","pop",
				"width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr){
	// �˾����������� �ּ��Է��� ������ �޾Ƽ�, �� �������� ������ ����մϴ�.	
	document.regForm.user_address.value = roadFullAddr;		
}

function inputCheck() {
	if(document.regForm.id.value==""){
		alert("���̵� �Է��� �ּ���");
		regForm.id.focus();
		
		return false;
	}
	if(document.regForm.passwd.value==""){
		alert("��й�ȣ�� �Է��� �ּ���");
		document.regForm.passwd.focus();
		return false;
	}
	if(document.regForm.ck_passwd.value==""){
		alert("��й�ȣ Ȯ���� �Է��� �ּ���");
		document.regForm.ck_passwd.focus();
		return false;
	}
	if(document.regForm.passwd.value!=document.regForm.ck_passwd.value){
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		document.regForm.ck_passwd.focus();
		return false;
	}
	if(document.regForm.user_name.value==""){
		alert("�̸��� �Է����ּ���");
		document.regForm.user_name.focus();
		return false;
	}
	if(document.regForm.user_birth.value==""){
		alert("������ �Է����ּ���");
		document.regForm.user_birth.focus();
		return false;
	}
	if(document.regForm.user_phone.value==""){
		alert("�޴��� ��ȣ�� �Է����ּ���");
		document.regForm.user_phone.focus();
		return false;
	}
	if(document.regForm.user_email.value==""){
		alert("�̸����� �Է����ּ���");
		document.regForm.user_email.focus();
		return false;
	}
	var str=document.regForm.user_email.value;
	var atPos=str.indexOf('@');
	var atLastPos=str.lastIndexOf('@');
	var dotPos=str.indexOf('.');
	var spacePos=str.indexOf(' ');
	var commaPos=str.indexOf(',');
	var eMailSize=str.length;
	
	if(atPos > 1 && atPos == atLastPos && dotPos > 3 && spacePos==-1 && 
		commaPos==-1 && atPos+1 < dotPos && dotPos+1 < eMailSize){
		
	}else{
		alert('E-mail �ּ� ������ �߸��Ǿ����ϴ�.\r\n�ٽ� �Է����ּ���!');
		document.regForm.user_email.focus();
		return false;
	}
	
	return true;
}
function blankCheck(){
	if(document.form.id.value==""){
		alert("���̵� �Է����ּ���");
		return false;
	}
	
	if(document.form.passwd.value==""){
		alert("��й�ȣ�� �Է����ּ���");
		return false;
	}
	return true;
}
function equalPasswd(){
	if(document.regForm.passwd.value==""){
		alert("��й�ȣ�� �Է��� �ּ���");
		document.regForm.passwd.focus();
		return false;
	}
	if(document.regForm.ck_passwd.value==""){
		alert("��й�ȣ Ȯ���� �Է��� �ּ���");
		document.regForm.ck_passwd.focus();
		return false;
	}
	if(document.regForm.passwd.value!=document.regForm.ck_passwd.value){
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		document.regForm.ck_passwd.focus();
		return false;
	}
	return true;
}
function goLoginForm(){
	location.href='loginForm.do';
}
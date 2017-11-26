<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메일 보내기</title>
<script>

	function numcheck(){
		
		var ran = mf2.ran.value;
		var email = document.getElementById("email").value;
		
		if(ran == ''){
			alert("인증번호를 발급받으세요");
			return false;
		}
		
		if(!mf2.num.value){
			alert("인증번호를 입력하세요");
			return false;
		}
		
		if(mf2.num.value != ran){
			alert("틀린 인증번호입니다. 인증번호를 다시 입력해주세요");
			mf2.num.value="";
			return false;
		}
		
		if(mf2.num.value == ran){
			alert("인증완료");
			opener.setEmail(email);
			
			window.close();
			
		}
	}
</script>
</head>
<body>
	<h4>메일 보내기</h4>
	<form:form method="post" commandName="mf1" action="mailSend">
	     이메일 입력 : <input type="text" id="email" name="email" size="50" value="${email }">
	     <form:errors path="email"/>
	    <p>
		<input type="submit" value="인증번호 발송">
	</form:form>

	<form:form method="post" commandName="mf2" action="regForm" onsubmit="return numcheck();">
		<input type="text" name="num" size="30" placeholder="인증번호입력"/>
		<input type="hidden" name="email"/>
		<input type="hidden" name="ran" value="${ran }">
		<input type="submit" value="인증번호 확인">
	</form:form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!--주소 : http://localhost:8080/email/register/regForm -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="member.register"/></title>
<script>
	function setEmail(email){
		document.getElementById("email").value = email;
	}
</script>
</head>
<body>
			
	<h2><spring:message code="member.info"/></h2>
	   <!-- spring:message code: 룩업할 메세지의 키를 지정해줌. 지정하지 않으면 text에 입력한 값출력 -->
	
	
<!-- 	<button onclick="location.href='mailForm'">이메일 인증</button> -->
	
	<button onclick="window.open('mailForm','인증','width=800, height=300, left=100, top=50')">이메일 인증</button>
	

	<form:form action="regSuccess" commandName="formData">
		<p>
			<label>
				<spring:message code="email"/> :
				<input type="text" id="email" name="email" value="${email }" readonly="readonly"/>
				<form:errors path="email" />
			</label>
		</p><p>
			<label>
				<spring:message code="name"/> :
				<form:input path="name"/> 
				<form:errors path="name" />
			</label>
		</p><p>
			<label>
				<spring:message code="password"/> :
				<form:input path="password"/> 
				<form:errors path="password" />
			</label>
		</p><p>
			<label>
				<spring:message code="password.confirm"/> :
				<form:input path="confirmPassword"/>
				<form:errors path="confirmPassword" /> 
			</label>
		</p><p>		
		
		<input type="submit" value="회원 가입"/>
		<input type="reset" value="다시 작성"/>
	</form:form>
</body>
</html>
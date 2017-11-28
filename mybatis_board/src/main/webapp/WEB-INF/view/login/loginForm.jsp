<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

  <!-- taglib: form, spring 사용 -->
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">





<title><spring:message code="login"/></title>

<link href="http://bootstrapk.com/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="http://bootstrapk.com/examples/starter-template/starter-template.css"
	rel="stylesheet">
<script
	src="http://bootstrapk.com/assets/js/ie-emulation-modes-warning.js"></script>
</head>

<body>


	<h2 style="margin-left:35%; margin-top:10%"><spring:message code="login"/>&nbsp;<small>Log In</small></h2>

<!-- 데이터 바인딩을 위해 :form commandName 사용 태그안에 path 값은 bean 객체 의미	 -->
	<form:form commandName="loginCommand">
		<table class="table" style="display: table; margin-left: auto; margin-right: auto;width:30%;margin-top:30px">
			<tr>
				<th style="font-size:20px"><spring:message code="email"/></th>
				<td> <form:input path="email" class="form-control"/></td>
				<td> <form:errors path="email"/></td>
			</tr>
			<tr>
				<th style="font-size:20px;"><spring:message code="password"/></th>
				<td> <form:password path="password" class="form-control"/></td>
				<td> <form:errors path="password"/></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" class="btn btn-primary" value="<spring:message code="login"/> ">
				</th>
			</tr>
		</table>
		<p style="margin-left:37%">
		<spring:message code="rememberEmail"/>
		<form:checkbox path="rememberEmail"/>
		/ <a href="">비밀번호 찾기</a>
	</form:form>
</body>
</html>
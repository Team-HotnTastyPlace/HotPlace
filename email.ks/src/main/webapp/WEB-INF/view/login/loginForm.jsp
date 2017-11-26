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
</head>

<body>


	<h2><spring:message code="login"/></h2>

<!-- 데이터 바인딩을 위해 :form commandName 사용 태그안에 path 값은 bean 객체 의미	 -->
	<form:form commandName="loginCommand">
		<table>
			<tr>
				<th><spring:message code="email"/></th>
				<td>: <form:input path="email"/></td>
				<td> <form:errors path="email"/></td>
			</tr>
			<tr>
				<th><spring:message code="password"/></th>
				<td>: <form:password path="password"/></td>
				<td> <form:errors path="password"/></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="<spring:message code="login"/>">
				</th>
			</tr>
		</table>
		<p>
		<spring:message code="rememberEmail"/>
		<form:checkbox path="rememberEmail"/>
		/ <a href="">비밀번호 찾기</a>
	</form:form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<c:if test="${empty authInfo }">
		<p>환영합니다.</p>
		<p>
			<a href="<c:url value='/register/regForm'/>">[회원 가입]</a>
			<a href="<c:url value='/login/loginForm'/>">[로그인]</a>
		</p>
	</c:if>
	
	<c:if test="${!empty authInfo }">
		<p>${authInfo.name }님 환영합니다.</p>
		<p>
			<a href="<c:url value='/edit/changePassword'/>">[비밀번호 변경]</a>
			<a href="<c:url value='/logout'/>">[로그아웃]</a>
		</p>
	</c:if>
</body>
</html>
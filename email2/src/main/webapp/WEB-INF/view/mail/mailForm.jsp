<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메일 보내기</title>
</head>
<body>
	<div class="container">
  <h4>메일 보내기</h4>
  <form action="${pageContext.request.contextPath}/mail/mailSending" method="post">
    <div align="center"><!-- 받는 사람 이메일 -->
     이메일 입력 : <input type="text" name="tomail" size="120" class="form-control" value="${tomail }">
    </div>     
    <p>
    <div align="center">
      <input type="submit" value="인증번호 발송" class="btn btn-warning">
    </div>
  </form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${boardVO.title } &nbsp 내용</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>제목</th>
			<td>${boardVO.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${boardVO.content }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${boardVO.writer }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${boardVO.regDate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${boardVO.cnt }</td>
		</tr>
	</table>
	<div>
		<a href="<c:url value="/board2/edit/${boardVO.seq }"/>">수정</a>
		<a href="<c:url value="/board2/delete/${boardVO.seq }"/>">삭제</a>
		<a href="<c:url value="/board2/list"/>">목록</a>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>목록</title>
</head>
<body>
	<h2>Board2</h2>
	<table border="1">
		<tr>
			<th>NO</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="board" items="${boardList }" varStatus="loop">
			<tr>
				<td>${board.seq }</td>
				<td><a href="<c:url value="/board2/read/${board.seq }"/>">
					${board.title }</a></td>
				<td>${board.writer }</td>
				<td>${board.regDate }</td>
				<td>${board.cnt }</td>					
			</tr>
		</c:forEach>
	</table>
	<p>
	<input type="text" name="search"/>
	<input type="button" value="검색"/>
	<a href="<c:url value="/board2/write"/>">글쓰기</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
<script src="/daumeditor/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>목록</title>
</head>
<body>

<h2 align="center">검색/등록</h2>

<hr color="red">

<table>
<tr>
<td><a href="<c:url value="/board/write"/>"><h3>등록</h3></a><td>
</tr>
</table>


	<table align="center" border="0">
	
		
	<tr>
	<%-- td> <c:url value="/images/tomcat.gif"/> </td> --%>
	<!-- </tr>
		<tr>
			<th>NO</th>
			<th>--</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr> -->
		
<c:forEach var="board" items="${boardList }" varStatus="loop">
<c:if test="${loop.index%6==0}">
		</tr><tr>
</c:if>
	
	<td><a href="<c:url value="/board/read/${board.seq }"/>"><img  width="200" height="250" src="<c:url value="/resources/images/${board.filename}"/>"><br><center>${board.title }</center>
	</a></td>

		
		<%-- 	<tr>
			
				<td>${board.seq }</td>
			
				<td><img  width="50" height="50" src="<c:url value="/resources/images/pooh.gif"/>">55</td>
			<!-- 	C:\Users\DK\Desktop\JAVA\jsp\workspace1\mybatis_board\src\main\webapp\resources\images -->
				<td><a href="<c:url value="/board/read/${board.seq }"/>"><img  width="50" height="70" src="<c:url value="C:/Users/DK/Desktop/JAVA/jsp/workspace1/mybatis_board/src/main/webapp/resources/images/${board.filename}"/>">55</a></td>
				
				<td><a href="<c:url value="/board/read/${board.seq }"/>"><img  width="50" height="70" src="<c:url value="/resources/images/${board.filename}"/>">55</a></td>
				<td><a href="<c:url value="/board/read/${board.seq }"/>">
					${board.title }</a></td>
				<td>${board.writer }</td>
				<td>${board.regDate }</td>
				<td>${board.cnt }</td>					
			</tr> --%>
		</c:forEach>
		
		 </tr>
	
	</table>
	
</body>
</html>
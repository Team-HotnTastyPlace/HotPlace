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
<h2 align="center">내용</h2>

<hr color="red">
	<table align="center" border="1">
	
		<tr>
		<th rowspan="4"><img  width="200" height="250" src="<c:url value="/resources/images/${boardVO.filename}"/>"> </th>
			<th>제목</th>
			<td>${boardVO.title }</td>
	<td rowspan="5"><div align="center"  class="w3-content" style="max-width:200 ;max-height:150">
  <img class="mySlides" src="<c:url value="/resources/images/아이린.jpg"/>"style="width:500px;height:300px">
  <img class="mySlides" src="<c:url value="/resources/images/조이.jpg"/>" style="width:500px;height:300px">
  <img class="mySlides" src="<c:url value="/resources/images/런던.jpg"/>" style="width:500px;height:300px">
  <img class="mySlides" src="<c:url value="/resources/images/바다.jpg"/>" style="width:500px;height:300px">
  <img class="mySlides" src="<c:url value="/resources/images/집.jpg"/>" style="width:500px;height:300px">
  <div class="w3-row-padding w3-section">
    <div class="w3-col s4">
      <img class="demo w3-border w3-hover-shadow" 
      src="<c:url value="/resources/images/아이린.jpg"/>" style="width:50px;height:50px" onclick="currentDiv(1)">
          <img class="demo w3-border w3-hover-shadow"
     src="<c:url value="/resources/images/조이.jpg"/>" style="width:50px;height:50px" onclick="currentDiv(2)">
         <img class="demo w3-border w3-hover-shadow" 
      src="<c:url value="/resources/images/런던.jpg"/>" style="width:50px;height:50px" onclick="currentDiv(3)">
           <img class="demo w3-border w3-hover-shadow" 
      src="<c:url value="/resources/images/바다.jpg"/>" style="width:50px;height:50px" onclick="currentDiv(4)">      
           <img class="demo w3-border w3-hover-shadow" 
      src="<c:url value="/resources/images/집.jpg"/>" style="width:50px;height:50px" onclick="currentDiv(5)">
      

  </div>
</div></td>
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
		<tr>
		
			
			<td height="200" colspan="3">${boardVO.content }</td>
		</tr>
	</table>
	<div align="center">
		<a href="<c:url value="/board/edit/${boardVO.seq }"/>">수정</a>
		<a href="<c:url value="/board/delete/${boardVO.seq }"/>">삭제</a>
		<a href="<c:url value="/board/list"/>">목록</a>
	</div>
	
<%-- 	<div align="center"  class="w3-content" style="max-width:200 ;max-height:150">
  <img class="mySlides" src="<c:url value="/resources/images/아이린.jpg"/>"style="width:500px;height:300px">
  <img class="mySlides" src="<c:url value="/resources/images/조이.jpg"/>" style="width:500px;height:300px">
  <img class="mySlides" src="<c:url value="/resources/images/런던.jpg"/>" style="width:500px;height:300px">

  <div class="w3-row-padding w3-section">
    <div class="w3-col s4">
      <img class="demo w3-border w3-hover-shadow" 
      src="<c:url value="/resources/images/아이린.jpg"/>" style="width:50px;height:50px" onclick="currentDiv(1)">
          <img class="demo w3-border w3-hover-shadow"
     src="<c:url value="/resources/images/조이.jpg"/>" style="width:50px;height:50px" onclick="currentDiv(2)">
         <img class="demo w3-border w3-hover-shadow" 
      src="<c:url value="/resources/images/런던.jpg"/>" style="width:50px;height:50px" onclick="currentDiv(3)">
    </div>

  </div>
</div> --%>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-border-red", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-border-red";
}
</script>

</body>
</html> 
</body>
</html>
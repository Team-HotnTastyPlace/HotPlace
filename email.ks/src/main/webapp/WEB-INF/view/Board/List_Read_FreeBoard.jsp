<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="http://bootstrapk.com/favicon.ico">

<title>Starter Template for Bootstrap</title>

<!-- ============================================================스크립트 선언============================================================ -->
<!-- Bootstrap core CSS -->
<link href="http://bootstrapk.com/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="http://bootstrapk.com/examples/starter-template/starter-template.css"
	rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="http://bootstrapk.com/assets/js/ie-emulation-modes-warning.js"></script>



<!-- ============================================================스타일 선언============================================================ -->

<!-- ============================================================제이쿼리============================================================ -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
td {
	height: 50px;
	font-size: 18px;
	/*  text-align:center; */
	/*  vertical-align:50%; */
	font-weight: bold;
}
</style>


</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="./index.jsp">Logo</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="./index.jsp">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<br>
	<br>
	<br>
	<br>
	<br>

	<table
		style="width: 57%; display: table; margin-left: auto; margin-right: auto;">

		<tr>
			<th>
				<button type="button" class="btn btn-lg btn-primary"
					style="margin-left: 5px; height: 45px">게시판</button>
				<button type="button" class="btn btn-lg btn-primary"
					style="height: 45px">자유게시판2</button> <a id="kakao-login-btn"
				href="http://developers.kakao.com/logout" style="float: right"></a>

				<!-- 		<button type="button" class="btn btn-lg btn-success"
						style="margin-left: 400px; height: 45px; float: right">Log
						In</button> -->
			</th>
		</tr>
	</table>

	<table class="table table-striped"
		style="width: 57%; display: table; margin-left: auto; margin-right: auto;; margin-top: 50px">

		<tr>

			<td style="width: 10%">No.</td>
			<td style="width: 20%">.</td>
			<td style="width: 10%">조회수</td>
			<td style="width: 20%">.</td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td>.</td>
			<td>작성일</td>
			<td>.</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">.</td>

		</tr>

		<tr style="width: 57%; height: 300px">
			<td>내용</td>
			<td colspan="3">.</td>

		</tr>


		<tr>
			<td colspan="5">
				<!-- Split button -->
				<div class="btn-group">
					<button type="button" class="btn btn-warning"
						style="height: 43px; margin-left: -10px">★★★</button>
					<button type="button" class="btn btn-warning dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false" style="height: 43px">
						<span class="caret"></span> <span class="sr-only">Toggle
							Dropdown</span>
					</button>

					<ul class="dropdown-menu" role="menu">
						<li><a href="#">★</a></li>
						<li><a href="#">★★</a></li>
						<li><a href="#">★★★</a></li>
						<li><a href="#">★★★★</a></li>
						<li><a href="#">★★★★★</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul>

				</div> <input type="text"
				style="width: 83%; height: 43px; margin-top: 8px">
				<button class="btn btn-lg btn-default" type="button"
					style="height: 45px; margin-top: -5px">댓글달기</button>
			</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>작성일</td>
			<td>댓글내용</td>
		</tr>

		<tr>
			<td colspan="4">
			
			<div style="display: table; margin-left: auto; margin-right: auto;"><button type="button"
					class="btn btn-lg btn-info"
					style="margin-right: 100px; height: 45px">수 정</button>
				<button type="button" class="btn btn-lg btn-info"
					style="margin-left:0px; height: 45px">삭 제</button>
				<button type="button" class="btn btn-lg btn-info"
					style="margin-left: 100px; height: 45px">목 록</button></div></td>

		</tr>
	</table>




	<script src="http://bootstrapk.com/dist/js/bootstrap.min.js"></script>
	<!--   <script src="http://bootstrapk.com/assets/js/docs.min.js"></script> -->

</body>

</html>

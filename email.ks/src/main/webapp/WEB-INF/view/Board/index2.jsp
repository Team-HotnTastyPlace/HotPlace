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
<style type="text/css">
.btn-default {
	width: 200px;
	height: 50px;
	font-size: 15px;
}
</style>
<!-- ============================================================제이쿼리============================================================ -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>




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
					style="height: 45px">자유게시판</button> <a id="kakao-login-btn"
				href="http://developers.kakao.com/logout" style="float: right"></a>

				<!-- 		<button type="button" class="btn btn-lg btn-success"
						style="margin-left: 400px; height: 45px; float: right">Log
						In</button> -->
			</th>
		</tr>
			<tr>
				<th>
					<div class="btn-group" role="group" aria-label="..."
						style="display: table; margin-left: auto; margin-right: auto;margin-top:30px;width:100%">
						<button type="button" class="btn btn-default" onclick = "location.href = 'index2'" style="width: 16.7%">Seoul</button>
						<button type="button" class="btn btn-default" onclick = "location.href = 'index2' " style="width:16.7%">DaeJeon</button>
						<button type="button" class="btn btn-default" onclick = "location.href = 'index2' " style="width:16.7%">DaeGu</button>
						<button type="button" class="btn btn-default" onclick = "location.href = 'index2' " style="width:16.7%">BuSan</button>
						<button type="button" class="btn btn-default" onclick = "location.href = 'index2' " style="width:16.7%">UlSan</button>
						<button type="button" class="btn btn-default" onclick = "location.href = 'index2' " style="width:16.7%">JeJu</button>
					</div>
				</th>
			</tr>
			
			<tr>
			 
				<th>
					<div class="btn-group" role="group" aria-label="..."
						style="display: table; margin-left: auto; margin-right: auto; width:100%">
						<button type="button" class="btn btn-default" onclick = "location.href = 'index2' " style="width:16.7%">SeJong</button>
						<button type="button" class="btn btn-default" onclick = "location.href = 'index2' " style="width:16.7%">InCheon</button>
						<button type="button" class="btn btn-default" onclick = "location.href = 'index2' " style="width:16.7%">GwangJu</button>
						<button type="button" class="btn btn-default" onclick = "location.href = 'index2' " style="width:16.7%">Jinju</button>
						<button type="button" class="btn btn-default" onclick = "location.href = 'index2' " style="width:16.7%">GwaCheon</button>
						<button type="button" class="btn btn-default" onclick = "location.href = 'index2' " style="width:16.7%">IlSan</button>
					</div>
				</th>
			</tr>
		<tr>
			<th >

				<div id="tabs" style="width: 100%; margin-top:50px ">
					<ul>
						<li><a href="#tabs-1">핫 플</a></li>
						<li><a href="#tabs-2">맛 플</a></li>

					</ul>
					<div id="tabs-1">

						<table class="table table-striped">
							<tr>
								<td style="width:52%" ><a href="List_Read">1. 한 식 당</a></td>
								<td >6</td>
							</tr>
							<tr>
								<td>2</td>
								<td>7</td>
							</tr>
							<tr>
							<td>3</td>
							<td>8</td>
							</tr>
							<tr>
								<td>4</td>
								<td>9</td>
							</tr>
							<tr>
							<td>5</td>
							<td>10</td>
							</tr>

						</table>
					</div>
					<div id="tabs-2">
					
											<table class="table table-striped">
							<tr>
								<td style="width:52%">1</td>
								<td>6</td>
							</tr>
							<tr>
								<td>2</td>
								<td>7</td>
							</tr>
							<tr>
							<td>3</td>
							<td>8</td>
							</tr>
							<tr>
								<td>4</td>
								<td>9</td>
							</tr>
							<tr>
							<td>5</td>
							<td>10</td>
							</tr>

						</table>
					
					
					</div>

				</div>
			</th>
		</tr>
	</table>





</body>

</html>

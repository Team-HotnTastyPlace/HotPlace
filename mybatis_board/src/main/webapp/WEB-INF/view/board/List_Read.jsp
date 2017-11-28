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

<!-- map -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=505c5TjHqkaoOGTmIpet"></script>
<script language="JavaScript" type="text/javascript"
	src="https://navermaps.github.io/maps.js/docs/js/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="https://navermaps.github.io/maps.js/docs/js/base.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=MK_1sBFRuO6XEvDi29iW&submodules=panorama,geocoder,drawing,visualization"></script>



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
			<th rowspan="9" style="width: 50%"><img src="https://www.localnaeil.com/FileData/Article/201705/205cea3c-efb2-4e34-94c9-90e5d3f05dd3_p.JPG" style="width:100%"></th>
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
		<tr>
			<td>주소</td>
			<td colspan="3">.</td>

		</tr>
		<tr>
			<td>연락처</td>
			<td colspan="3">.</td>
		</tr>
		<tr>
			<td>홈페이지</td>
			<td colspan="3">.</td>
		</tr>
		<tr>
			<td>영업시간</td>
			<td colspan="3">.</td>
		</tr>
		<tr>
			<td>평점</td>
			<td>.</td>
			<td>맛</td>
			<td>.</td>

		</tr>
		<tr>
			<td>총점</td>
			<td colspan="3">.</td>

		</tr>
		<tr></tr>
		<tr style="width: 57%; height: 500px">
			<td>내용</td>
			<td colspan="4">.</td>

		</tr>
		<tr>
			<td colspan="5">
				<div
					style="width: 101%; height: 101%; margin-top: -45px; margin-left: -8px">
					<div id="map" style="width: 100%; height: 500px; margin-top: 40px"></div>
				</div>
			</td>

		</tr>
		
		<tr>
		<td colspan="5"><!-- Split button -->
<div class="btn-group">
  <button type="button" class="btn btn-warning" style="height:43px;margin-left:-10px">★★★</button>
  <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="height:43px">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
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
	
</div>
<input type="text" style="width:75%;height:43px;margin-top:8px" >
<button class="btn btn-lg btn-default" type="button" style="height:45px;margin-top:-5px;width:13%">댓글달기</button>
</td>
		
		
		</tr>

	</table>



	<!-- ===================맵 스크립트=================== -->

	<script>
		var mapOptions = {
			center : new naver.maps.LatLng(37.3595704, 127.105399),
			zoom : 10,
			mapTypeId : naver.maps.MapTypeId.NORMAL,
			zoomControl : true,
			zoomControlOptions : { //줌 컨트롤의 옵션
				position : naver.maps.Position.TOP_RIGHT
			},
			mapTypeControl : true
		};
		var map = new naver.maps.Map('map', mapOptions);

		var infoWindow = new naver.maps.InfoWindow({
			anchorSkew : true
		});

		map.setCursor('pointer');

		//마커
		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(37.3595704, 127.105399),
			map : map
		});

		function onSuccessGeolocation(position) {
			var location = new naver.maps.LatLng(position.coords.latitude,
					position.coords.longitude);

			map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
			map.setZoom(10); // 지도의 줌 레벨을 변경합니다.

			infowindow.setContent('<div style="padding:20px;">' + 'latitude: '
					+ location.lat() + '<br />' + 'longitude: '
					+ location.lng() + '</div>');

			infowindow.open(map, location);
		}

		function onErrorGeolocation() {
			var center = map.getCenter();

			infowindow
					.setContent('<div style="padding:20px;">'
							+ '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'
							+ "latitude: " + center.lat() + "<br />longitude: "
							+ center.lng() + '</div>');

			infowindow.open(map, center);
		}

		window.onload = function() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(onSuccessGeolocation,
						onErrorGeolocation);
			} else {
				var center = map.getCenter();

				infowindow
						.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5>'
								+ "latitude: "
								+ center.lat()
								+ "<br />longitude: " + center.lng() + '</div>');
				infowindow.open(map, center);
			}
		}

		//맵 검색

		function searchCoordinateToAddress(latlng) {
			var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);

			infoWindow.close();

			naver.maps.Service
					.reverseGeocode(
							{
								location : tm128,
								coordType : naver.maps.Service.CoordType.TM128
							},
							function(status, response) {
								if (status === naver.maps.Service.Status.ERROR) {
									return alert('Something Wrong!');
								}

								var items = response.result.items, htmlAddresses = [];

								for (var i = 0, ii = items.length, item, addrType; i < ii; i++) {
									item = items[i];
									addrType = item.isRoadAddress ? '[도로명 주소]'
											: '[지번 주소]';

									htmlAddresses.push((i + 1) + '. '
											+ addrType + ' ' + item.address);
									htmlAddresses
											.push('&nbsp&nbsp&nbsp -> '
													+ item.point.x + ','
													+ item.point.y);
								}

								infoWindow
										.setContent([
												'<div style="padding:10px;min-width:200px;line-height:150%;">',
												'<h4 style="margin-top:5px;">검색 좌표 : '
														+ response.result.userquery
														+ '</h4><br />',
												htmlAddresses.join('<br />'),
												'</div>' ].join('\n'));

								infoWindow.open(map, latlng);
							});
		}

		//주소찾기 클릭후 
		function searchAddressToCoordinate(address) {
			naver.maps.Service
					.geocode(
							{
								address : address
							},
							function(status, response) {
								if (status === naver.maps.Service.Status.ERROR) {
									return alert('Something Wrong!');
								}

								var item = response.result.items[0], addrType = item.isRoadAddress ? '[도로명 주소]'
										: '[지번 주소]', point = new naver.maps.Point(
										item.point.x, item.point.y);

								infoWindow
										.setContent([
												'<div style="padding:10px;min-width:200px;line-height:150%;">',
												'<h4 style="margin-top:5px;">검색 주소 : '
														+ response.result.userquery
														+ '</h4><br />',
												addrType + ' ' + item.address
														+ '<br />',
												'&nbsp&nbsp&nbsp -> ' + point.x
														+ ',' + point.y,
												'</div>' ].join('\n'));

								map.setCenter(point);
								infoWindow.open(map, point);
							});
		}

		function initGeocoder() {
			map.addListener('click', function(e) {

				searchCoordinateToAddress(e.coord);
			});

			$('#address').on('keydown', function(e) {
				var keyCode = e.which;

				if (keyCode === 13) { // Enter Key
					searchAddressToCoordinate($('#address').val());
				}
			});
			//클릭(주소검색) 리스너 
			$('#submit').on('click', function(e) {
				e.preventDefault();
				//serchAddressToCoordinate.실행
				searchAddressToCoordinate($('#address').val());
			});

			searchAddressToCoordinate('정자동 178-1');
		}

		naver.maps.onJSContentLoaded = initGeocoder;
	</script>

	<!-- ===================맵 스크립트 끝=================== -->

  <script src="http://bootstrapk.com/dist/js/bootstrap.min.js"></script>
<!--   <script src="http://bootstrapk.com/assets/js/docs.min.js"></script> -->

</body>

</html>

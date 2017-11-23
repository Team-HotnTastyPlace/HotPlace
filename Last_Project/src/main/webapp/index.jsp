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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=505c5TjHqkaoOGTmIpet"></script>
<script language="JavaScript" type="text/javascript"
	src="https://navermaps.github.io/maps.js/docs/js/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="https://navermaps.github.io/maps.js/docs/js/base.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=MK_1sBFRuO6XEvDi29iW&submodules=panorama,geocoder,drawing,visualization"></script>
<!-- 카카오 스크립트 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<!-- ============================================================스타일 선언============================================================ -->
<style type="text/css">
.btn-default {
	width: 200px;
	height: 50px;
	font-size: 15px;
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
				<a class="navbar-brand" href="#">Logo</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
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
			style="width: 80% display: table; margin-left: auto; margin-right: auto;">

			<tr>
				<th>
					<button type="button" class="btn btn-lg btn-primary"
						style="margin-left: 5px; height: 45px">자유게시판1</button>
					<button type="button" class="btn btn-lg btn-primary"
						style="height: 45px">자유게시판2</button>
					
					<a id="kakao-login-btn" href="http://developers.kakao.com/logout" style="float:right"></a>
 
			<!-- 		<button type="button" class="btn btn-lg btn-success"
						style="margin-left: 400px; height: 45px; float: right">Log
						In</button> -->
				</th>
			</tr>
			<tr>
				<th>
					<div class="btn-group" role="group" aria-label="..."
						style="display: table; margin-left: auto; margin-right: auto;margin-top:30px">
						<button type="button" class="btn btn-default" onclick = "location.href = './index2.jsp' ">Seoul</button>
						<button type="button" class="btn btn-default" onclick = "location.href = './index2.jsp' ">DaeJeon</button>
						<button type="button" class="btn btn-default" onclick = "location.href = './index2.jsp' ">DaeGu</button>
						<button type="button" class="btn btn-default" onclick = "location.href = './index2.jsp' ">BuSan</button>
						<button type="button" class="btn btn-default" onclick = "location.href = './index2.jsp' ">UlSan</button>
						<button type="button" class="btn btn-default">JeJu</button>
					</div>
				</th>
			</tr>
			
			<tr>
				<th>
					<div class="btn-group" role="group" aria-label="..."
						style="display: table; margin-left: auto; margin-right: auto;">
						<button type="button" class="btn btn-default" onclick = "location.href = './index2.jsp' ">SeJong</button>
						<button type="button" class="btn btn-default" onclick = "location.href = './index2.jsp' ">InCheon</button>
						<button type="button" class="btn btn-default" onclick = "location.href = './index2.jsp' ">GwangJu</button>
						<button type="button" class="btn btn-default" onclick = "location.href = './index2.jsp' ">Jinju</button>
						<button type="button" class="btn btn-default" onclick = "location.href = './index2.jsp' ">GwaCheon</button>
						<button type="button" class="btn btn-default" onclick = "location.href = './index2.jsp' ">IlSan</button>
					</div>
				</th>
			</tr>

	<tr>
	<th>
		<form class="navbar-form navbar-left" role="search"
		style="margin-left:-15px;margin-top:100px">
		<div class="form-group">
			<input type="text" class="form-control" placeholder="Search"
				id="address" value="울산" style="height: 40px">
		</div>
		<button type="submit" class="btn btn-lg btn-primary" id=submit>검
			색</button>
	</form>
	</th>
	</tr>

<tr>
<th>
<div style="width:100%;height:100%">
	<div id="map"
		style="width:100%;height:500px;margin-top:40px"></div>
	

</div>
</th>
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
<!-- ===================카카오 로그인 스크립트=================== -->

<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('0f2cb0fd8f1951449fa2c9a56129c2c2');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
    <!-- ===================카카오 로그인 스크립트=================== -->
  //]]>
</script>



	<!-- 

	<!-- Bootstrap core JavaScript
    ==================================================
	Placed at the end of the document so the pages load faster
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	IE10 viewport hack for Surface/desktop Windows 8 bug
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script> -->
</body>
</html>

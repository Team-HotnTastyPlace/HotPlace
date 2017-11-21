<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=505c5TjHqkaoOGTmIpet"></script>
<script language="JavaScript" type="text/javascript"
	src="https://navermaps.github.io/maps.js/docs/js/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="https://navermaps.github.io/maps.js/docs/js/base.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=MK_1sBFRuO6XEvDi29iW&submodules=panorama,geocoder,drawing,visualization"></script>

<!--======부트 스트랩 ======-->

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>
<br><br><br><br><br><br><br><br><br><br><br><br>
<button type="button" class="btn btn-lg btn-primary">부트스트랩</button>
	<div class="search">
		<input id="address" type="text" placeholder="검색할 주소" value="불정로 6"
			class="address" /> <input id="submit" type="button" value="주소 검색" />
	</div>

	<div id="map" style="width: 100%; height: 400px;"></div>

<br><br><br><br><br><br><br><br><br><br><br><br>


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

	<!-- ===================맵 스크립트=================== -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan 상세</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<style type="text/css">
header {
	margin-bottom: 5vh;
}

footer {
	margin-top: 5vh;
}

main {
	background-color: white;
}

.info-title {
    display: block;
    background: #5779F4;
    color: #fff;
    text-align: center;
    height: 24px;
    line-height:22px;
    border-radius:4px;
    padding:0px 10px;
}

.map_wrapper {
	padding-top: 5vh;
	background-color: white;
	width: 100%;
	display: flex;
	justify-content: center;	
}

.main_wrapper {
	margin: 5vh 17.5vw;
	width: 65vw;
	background-color: white;
	border: 2px solid #5779F4;
}

.body_header h4 {
	text-align: left;
	padding: 10px;
	border-bottom: 2px solid #5779F4;
}

.body_table_wrapper {
	padding: 20px;
}

.table {	
	padding: 10px;
	border: 2px solid #5779F4;
}

.table th {	
	border-bottom: 2px solid #5779F4
}

.table td {	
	border-bottom: 2px solid #5779F4
}

</style>

</head>
<body>
	
	<header>
		<jsp:include page="../include/header.jsp" />
	</header>
<main>
	<!--카카오 지도-->
	<div class="map_wrapper">
		<div align="center" id="map" style="width:800px;height:500px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a3436731ffb3d80999f96a351ece49b1&libraries=services,clusterer,drawing"></script>
		<script>
			let container = document.getElementById('map');
			let options = {
					center: new kakao.maps.LatLng(33.362596126296225, 126.52854588407249), //지도의 중심 좌표.		
					level: 10	//지도의 확대 축소 정도
			};
			
			let map = new kakao.maps.Map(container, options);
			
			//마커를 표시하기
			let positions = [ {
				title : '<span class="info-title">한라산</span>',
				latlng : new kakao.maps.LatLng(33.362596126296225, 126.52854588407249)
			}, {
				title : '<span class="info-title">우진해장국</span>',
				latlng : new kakao.maps.LatLng(33.5116816892772, 126.5200543555591)
			}, {
				title : '<span class="info-title">코델리아 S 호텔</span>',
				latlng : new kakao.maps.LatLng(33.4551747598665, 126.91038404021734)
			}, {
				title : '<span class="info-title">나무 리스 acti</span>',
				latlng : new kakao.maps.LatLng(33.27347020190726, 126.65639521383837)
			}
				
			];			
			
			//마커 생성
			for (let i = 0; i < positions.length; i++) {
				let marker = new kakao.maps.Marker({
					map : map,
					position : positions[i].latlng,										
				});
				
				let infowindow = new kakao.maps.InfoWindow({
					map: map,
					position : positions[i].latlng,
					content : positions[i].title,					
				});
			}
			
			let infoTitle = document.querySelectorAll('.info-title');
			infoTitle.forEach(function(e) {
			    let w = e.offsetWidth + 10;
			    let ml = w/2;
			    e.parentElement.style.top = "-35px";
			    e.parentElement.style.left = "50%";
			    e.parentElement.style.marginLeft = -ml+"px";
			    e.parentElement.style.width = w+"px";
			    e.parentElement.previousSibling.style.display = "none";
			    e.parentElement.parentElement.style.border = "0px";
			    e.parentElement.parentElement.style.background = "unset";
			});
			
		</script>
	</div>
	
	<div class="main_wrapper">
		<div class="body_header">
			<h4>#태그로 #내용 #요약</h4>
			<h4>22.01.11 ~ 22.01.12</h4>			
		</div>
		<div class="body_table_wrapper">
			<table class="table">
				<tr>
					<th style="width: 70%;">DAY 1</th> <td style="width: 30%;"> </td>					
				</tr>
				<tr>
					<td>1. 걸어서 설경 속으로, 한라푸르나 하이킹 크루</td>	<td> <button>담기</button> </td>
				</tr>
				<tr>
					<td>2. 우진해장국</td>	<td> <button>담기</button> </td>
				</tr>
				<tr>
					<td>3. 코델리아S 호텔</td>	<td> <button>담기</button> </td>
				</tr>				
			</table>
			<table class="table">
				<tr>
					<th style="width: 70%;">DAY 2</th> <td style="width: 30%;"> </td>					
				</tr>
				<tr>
					<td>1. 마이 빈티지 홀리데이, 제주 나무 리스 클래스</td>	<td> <button>담기</button> </td>
				</tr>
				<tr>
					<td>2. 우진해장국</td>	<td> <button>담기</button> </td>
				</tr>								
			</table>
		</div>
	</div>
</main>	
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>
					
</body>
</html>
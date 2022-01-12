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
		<script type="text/javaScript">
			let container = document.getElementById('map');
			let options = {
					center: new kakao.maps.LatLng(33.362596126296225, 126.52854588407249), //지도의 중심 좌표.		
					level: 10	//지도의 확대 축소 정도
			};			
			
			let map = new kakao.maps.Map(container, options);			
			
			//gps 좌표로 반복문으로 마커 생성
			let positions = new Array();
			
			<c:forEach items="${EPdto}" var="list" varStatus="i">
				positions.push(	 
						{
							title : '<span class="info-title">${list.name}</span>',
							latlng : new kakao.maps.LatLng(${list.x}, ${list.y})
						}
				);
			</c:forEach>
			
			//마커 생성
			for (let i=0; i<${size}; i++) {
				let marker = new kakao.maps.Marker({
					map : map,
					position : positions[i].latlng
				});
				
				let infowindow = new kakao.maps.InfoWindow({
					map: map,
					position : positions[i].latlng,
					content : positions[i].title					
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
			<h4>${WPdto.description }</h4>
			<h4>${WPdto.start_date } ~ ${WPdto.last_date }</h4>			
		</div>
		<div class="body_table_wrapper">
			<c:forEach items="${EPdto}" var="list" varStatus="i">				
					<table class="table">
						<tr>
							<th style="width: 70%;">${list.day }</th> <td style="width: 30%;"> </td>					
						</tr>
						<tr>
							<td>${i.index + 1 }. ${list.name }</td>	<td> <button>담기</button> </td>
						</tr>									
					</table>		
			</c:forEach>
		</div>
	</div>
</main>	
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>
					
</body>
</html>
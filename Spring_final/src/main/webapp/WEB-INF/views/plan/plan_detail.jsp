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

.map_wrapper {	
	display: flex;
	justify-content: center;	
}

</style>

</head>
<body>
	
	<header>
		<jsp:include page="../include/header.jsp" />
	</header>

	<!--카카오 지도-->
	<div class="map_wrapper">
		<div align="center" id="map" style="width:500px;height:300px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a3436731ffb3d80999f96a351ece49b1&libraries=services,clusterer,drawing"></script>
		<script>
			let container = document.getElementById('map');
			let options = {
					center: new kakao.maps.LatLng(33.362596126296225, 126.52854588407249), //지도의 중심 좌표.		
					level: 10	//지도의 확대 축소 정도
			};
			
			let map = new kakao.maps.Map(container, options);
		</script>
	</div>
	
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>
					
</body>
</html>
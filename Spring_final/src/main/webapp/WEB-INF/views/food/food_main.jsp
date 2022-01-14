<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>

body {
	text-align: center;
	font-family:'Noto Sans KR';
}

#food_title {
	text-align: left;
	margin-top: 50px;
	margin-left: 300px;
}

#food_body {
	display: flex;
	background-color: #fff;
}

#maps {
	flex: 1;
}

#map_all, #map_grade, #map_jeju, #map_seogwipo {
	margin-left: 280px;
	position: absolute;
}

#food_bar {
	flex: 1;	
	display: flex;
    flex-direction: column;
	width: 100px;
	height: 130px;
	padding-top: 30px;
}

.allBtn, .gradeBtn, .jejuBtn, .seogwipoBtn {
	width: 150px;
	margin-left: 400px;
	margin-bottom: 50px;
	border-radius: 10px;
	border: solid 1px lightgrey;
}

.hoverBtn {
	cursor: pointer;
	/* background-color: #dbdbdb; */
	border: solid 1px black;
}

.allBtn:hover, .gradeBtn:hover, .jejuBtn:hover, .seogwipoBtn:hover {
	cursor: pointer;
	/* background-color: #dbdbdb; */
	border: solid 1px black;
}

#recomm {
	margin-top: 400px;
	background-color: #fff;
}
</style>
</head>
<body>

	<header>
		<jsp:include page="../include/header.jsp" />
	</header>
	
	<h2 id="food_title">제주 맛집 지도</h2>
	
	<div id="food_body">
		
		<div id="maps">
			<div id="map_grade">
				<%@ include file="/WEB-INF/views/food/maps/map_grade.html" %>
			</div> 	
			
			<div id="map_jeju">
				<%@ include file="/WEB-INF/views/food/maps/map_jeju_si.html" %>
			</div>	
			
			<div id="map_seogwipo">
				<%@ include file="/WEB-INF/views/food/maps/map_seogwipo_si.html" %>
			</div>	
			
			<div id="map_all">
				<%@ include file="/WEB-INF/views/food/maps/map_all.html" %>
			</div> 

		</div>	
		
		<div id="food_bar">
			<div class="allBtn hoverBtn"><h4>맛집 전체</h4></div>
			<div class="gradeBtn"><h4>평점 4.5점 이상</h4></div>
			<div class="jejuBtn"><h4>제주시</h4></div>
			<div class="seogwipoBtn"><h4>서귀포시</h4></div>
		</div>
	
	</div>
	
	<div id="recomm">	
			<h3></h3>
	
		
		
		
		<%--재연 --%>
		
		<div class="food_content">
			<div class="food_row">
				<div class="food_common">
					<div class="food_bsSzp">
						<div class="food_swiper">
							<div class="food_wrapper">
								<a class="food-cont-a" href="https://www.myrealtrip.com/offers/112179">
									<div>
									</div>
								</a>
							</div>
						</div>
					</div>
				
				</div>
			
			</div>
		
		</div>

	</div>
	
	<footer>
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	</footer>

<script>
	const all = document.getElementById("map_all");	
	const grade = document.getElementById("map_grade");
	const jeju = document.getElementById("map_jeju");
	const seogwipo = document.getElementById("map_seogwipo");
	
	const allBtn = document.querySelector(".allBtn");
	const gradeBtn = document.querySelector(".gradeBtn");
	const jejuBtn = document.querySelector(".jejuBtn");
	const seogwipoBtn = document.querySelector(".seogwipoBtn");
	
	function all_map() {
		all.style.display = "block";
		grade.style.display = "none";
		jeju.style.display = "none";
		seogwipo.style.display = "none";
		
		allBtn.classList.add("hoverBtn");
		gradeBtn.classList.remove("hoverBtn");
		jejuBtn.classList.remove("hoverBtn");
		seogwipoBtn.classList.remove("hoverBtn");
	}
	
	function grade_map() {
		grade.style.display = "block";
		all.style.display = "none";
		jeju.style.display = "none";
		seogwipo.style.display = "none";	
		
		gradeBtn.classList.add("hoverBtn");
		allBtn.classList.remove("hoverBtn");
		jejuBtn.classList.remove("hoverBtn");
		seogwipoBtn.classList.remove("hoverBtn");
	}
	
	function jeju_map() {
		jeju.style.display = "block";
		all.style.display = "none";
		grade.style.display = "none";
		seogwipo.style.display = "none";	
		
		jejuBtn.classList.add("hoverBtn");
		allBtn.classList.remove("hoverBtn");
		gradeBtn.classList.remove("hoverBtn");
		seogwipoBtn.classList.remove("hoverBtn");
	}
	
	function seo_map() {
		seogwipo.style.display = "block";
		all.style.display = "none";
		grade.style.display = "none";
		jeju.style.display = "none";	
		
		seogwipoBtn.classList.add("hoverBtn");
		allBtn.classList.remove("hoverBtn");
		gradeBtn.classList.remove("hoverBtn");
		jejuBtn.classList.remove("hoverBtn");
	}
	
	allBtn.addEventListener('click', all_map);
	gradeBtn.addEventListener('click', grade_map);
	jejuBtn.addEventListener('click', jeju_map);
	seogwipoBtn.addEventListener('click', seo_map);
</script>
</body>
</html>
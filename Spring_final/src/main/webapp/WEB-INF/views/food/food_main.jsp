<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- import food.css --%>
<link href="${path}/resources/css/food.css" rel="stylesheet"/> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="./resources/css/main.css?after" type="text/css" />
<style type="text/css">


#food_body {
		margin-top: 100px;
		padding: 50px 0px;
		background-color: #fff;
	}
	
.display_none {
		display: none;
	}
	
.map_all {
		margin-left: 450px;
		width: 200px;
	}
	
.map_grade {
		margin-left: 450px;
		width: 200px;
	}


</style>
</head>
<body>

	<header>
		<jsp:include page="../include/header.jsp" />
	</header>
	
	<div id="food_body">
		
		<div class="map_all">
			<%@ include file="/WEB-INF/views/food/map_all.html" %>
		</div>
		
 		<div class="map_grade display_none">
			<%@ include file="/WEB-INF/views/food/map_grade4.5.html" %>
		</div>
		
		<br>
		<input type="button" value="평점 4.5 이상" class="gradeBtn">
		
		
		
		
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
	const map_all = document.querySelector(".map_all");	
	const map_grade = document.querySelector(".map_grade");
	const gradeBtn = document.querySelector(".gradeBtn");
	
	function switch_map() {
		$('#map2').load(location.href + '#map2');
		
		map_all.classList.toggle('display_none');
		map_grade.classList.toggle('display_none');
		
		if (gradeBtn.value == '전체') {
			gradeBtn.value = '평점 4.5점 이상'
		} else {
			gradeBtn.value = '전체';
		}
		
		console.log('switched!')
	}
	
	gradeBtn.addEventListener('click', switch_map);
</script>
</body>
</html>
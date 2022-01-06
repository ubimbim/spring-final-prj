<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Myplan</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/main.css?after" type="text/css" />
<style>
#myplan {
	margin-top: 100px;
	padding: 20px 50px 100px 50px;
	background-color: #fff;
}

#myplan h2{
	text-align: left;
	margin-left: 315px;
}

#grid {
	display: grid;
	grid-template-columns: 542px 800px;
}

#bar {
	display: flex;
    flex-direction: column;
	width: 200px;
	height: 134px;
	margin-left: 250px;
	border: solid 1px gray;
	border-radius: 5px;
}

#ongoing:hover, #finish:hover, #cancel:hover {
	cursor: pointer;
	background-color: #dbdbdb;
}

#ongoing_plans {
	width: 1000px;
	height: 600px;
	border: solid 1px gray;
	border-radius: 10px;
}

#finish_plans {
	width: 1000px;
	height: 600px;
	border: solid 1px gray;
	border-radius: 5px;
}

#cancel_plans {
	width: 1000px;
	height: 600px;
	border: solid 1px gray;
	border-radius: 5px;
}

.selectedBar h4 {
	text-decoration: underline;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="../include/header.jsp" />
	</header>

	<div id="myplan">
		<h2>내 플랜</h2>
		<div id="grid">
			<div id="bar">
				<div id="ongoing" class="selectedBar"><h4>예정된 플랜</h4></div>
				<div id="finish"><h4>지난 플랜</h4></div>
			</div>
			
			<div id="ongoing_plans">
				<h3>예정된 여행이 없습니다.</h3>
			</div>
			
			<div id="finish_plans" class="none">
				<h3>지난 여행이 없습니다.</h3>
			</div>
			
			<div id="cancel_plans" class="none">
				<h3>취소된 여행이 없습니다.</h3>
			</div>
		</div>
	</div>
	
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>
	<script>
		const ongoing = document.querySelector("#ongoing");
		const finish = document.querySelector("#finish");
		const ongo_plan = document.querySelector("#ongoing_plans");
		const fini_plan = document.querySelector("#finish_plans");
		
		function ongo() {
			finish.classList.remove('selectedBar'); fini_plan.classList.add('none');	
			ongoing.classList.add('selectedBar'); ongo_plan.classList.remove('none');
		}
		
		function fini() {
			ongoing.classList.remove('selectedBar'); ongo_plan.classList.add('none');
			finish.classList.add('selectedBar'); fini_plan.classList.remove('none');
		}
		
		ongoing.addEventListener('click', ongo);
		finish.addEventListener('click', fini);
	</script>
</body>
</html>
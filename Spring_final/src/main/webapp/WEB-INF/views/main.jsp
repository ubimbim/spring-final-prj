<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/main.css?after" type="text/css" />
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	
	<div id="back_color">
		<div id="recomm_acc">
			<h2>추천 숙소</h2>
				<div id="itemSlide">
					<div id="acc_firstItem" class="item">
						<a href=""><img src="resources/images/example.jpg"><span>모다 스테이<br><br>100,000원<small>/1인</small></span></a>									
					</div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">2<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">3<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">4<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">5<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">6<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">7<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">8<br></a></div>
				</div>
			<input type="button" value="〉" id="acc_nextBtn">
		</div>
		
		<hr width="70%" style="margin-top:70px;">
		
		<div id="recomm_act">	
			<h2>추천 액티비티</h2>
				<div id="itemSlide">
					<div id="act_firstItem" class="item"><a href=""><img src="resources/images/example.jpg">1<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">2<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">3<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">4<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">5<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">6<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">7<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">8<br></a></div>
				</div>
			<input type="button" value="〉" id="act_nextBtn">
		</div>
		
		<hr width="70%" style="margin-top:70px;">
		
		<div id="recomm_resto">	
			<h2>추천 맛집</h2>
				<div id="itemSlide">
					<div id="res_firstItem" class="item"><a href=""><img src="resources/images/example.jpg">1<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">2<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">3<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">4<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">5<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">6<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">7<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">8<br></a></div>
				</div>
			<input type="button" value="〉" id="res_nextBtn">
		</div>
		
		<hr width="70%" style="margin-top:70px;">
		
		<div id="recomm_plan">		
			<h2>추천 플랜</h2>
				<div id="itemSlide">
					<div id="plan_firstItem" class="item"><a href=""><img src="resources/images/example.jpg">1<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">2<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">3<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">4<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">5<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">6<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">7<br></a></div>
					<div class="item"><a href=""><img src="resources/images/example.jpg">8<br></a></div>
				</div>
			<input type="button" value="〉" id="plan_nextBtn">
		</div>
	</div>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
<script>
const acc_nextBtn = document.querySelector("#acc_nextBtn");
const act_nextBtn = document.querySelector("#act_nextBtn");
const res_nextBtn = document.querySelector("#res_nextBtn");
const plan_nextBtn = document.querySelector("#plan_nextBtn");
const acc_first_item = document.querySelector("#acc_firstItem");
const act_first_item = document.querySelector("#act_firstItem");
const res_first_item = document.querySelector("#res_firstItem");
const plan_first_item = document.querySelector("#plan_firstItem");
 
  function acc_prev() {
	  acc_first_item.classList.toggle('slide');
	  acc_first_item.style.transition = '1s ease-in-out';
	  
	  setTimeout(function() {
		  if(acc_nextBtn.value == "〉") {
			  acc_nextBtn.value = "〈";
		  } else if(acc_nextBtn.value == "〈"){
			  acc_nextBtn.value = "〉";
		  }
	  }, '1000')
  }
  
  function act_prev() {
	  act_first_item.classList.toggle('slide');
	  act_first_item.style.transition = '1s ease-in-out';
	  
	  setTimeout(function() {
		  if(act_nextBtn.value == "〉") {
			  act_nextBtn.value = "〈";
		  } else if(act_nextBtn.value == "〈"){
			  act_nextBtn.value = "〉";
		  }
	  }, '1000')
  }
  
  function res_prev() {
	  res_first_item.classList.toggle('slide');
	  res_first_item.style.transition = '1s ease-in-out';
	  
	  setTimeout(function() {
		  if(res_nextBtn.value == "〉") {
			  res_nextBtn.value = "〈";
		  } else if(res_nextBtn.value == "〈"){
			  res_nextBtn.value = "〉";
		  }
	  }, '1000')
  }
  
  function plan_prev() {
	  plan_first_item.classList.toggle('slide');
	  plan_first_item.style.transition = '1s ease-in-out';
	  
	  setTimeout(function() {
		  if(plan_nextBtn.value == "〉") {
			  plan_nextBtn.value = "〈";
		  } else if(plan_nextBtn.value == "〈"){
			  plan_nextBtn.value = "〉";
		  }
	  }, '1000')
  }

  acc_nextBtn.addEventListener('click', acc_prev);
  act_nextBtn.addEventListener('click', act_prev);
  res_nextBtn.addEventListener('click', res_prev);
  plan_nextBtn.addEventListener('click', plan_prev);

  
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/header.css?after" type="text/css" />
</head>
<body>
	
  <img src = "./resources/images/main_1.png" id="mainImage">	
	
  <div id="header">
	<a href="<%=request.getContextPath()%>/main.do"><img src="./resources/images/logo.svg" width="200px" id="logo"/></a>
	
	<input type="text" placeholder="검색어를 입력하세요." id="searchInput"> 

	<c:if test="${!empty kdto || !empty edto }">
		<div id="mem">
			<ul>
				<li><a href="">위시리스트</a>&nbsp;|&nbsp;<a
					href="<%=request.getContextPath()%>/myplan.do">내 플랜</a></li>
				<c:if test="${!empty kdto }">
				<li><a href="mypage.do?id=${kdto.u_email}"><img
						src="${kdto.u_img }"
						width="80px" style="border-radius: 40px"/></a>
				</c:if>
				<c:if test="${!empty edto }">				
				<li><a href="mypage.do?id=${edto.u_email}"><img
						src="./resources/images/horse.svg"
						width="80px" /></a>
				</c:if>
					<ul>
						<c:if test="${!empty edto }">
						<li><h4>${edto.u_name} 님</h4></li>
						<li><a href="mypage.do?id=${edto.u_email}"
							style="color: #5779F4">마이페이지</a><br>
						<hr></li>
						<c:if test="${!empty edto }">
							<li><a href="email_logout.do">로그아웃</a></li>
						</c:if>
						</c:if>
						<c:if test="${!empty kdto }">
						<li><h4>${kdto.u_name} 님</h4></li>						
						<li><a href="mypage.do?id=${kdto.u_email}"
							style="color: #5779F4">마이페이지</a><br>
						<hr>
						</li>
						<li><a href="https://kauth.kakao.com/oauth/logout?client_id=${api_key }&logout_redirect_uri=http://localhost:8080/project/logout.do">로그아웃</a></li>
						</c:if>
					</ul>
				</li>
			</ul>
		</div>
	</c:if>
	<c:if test="${empty kdto && empty edto }">
		<div id="noMem">
			<a href="kakao_login.do">로그인</a> <a href="kakao_signUp.do"><img src="<%=request.getContextPath() %>/resources/images/join.svg" width="100px"/></a>
		</div>
	</c:if>
  </div>	
	
	<div id="navi">
		<ul>
			<li><a href="place_list.do"><img src="<%=request.getContextPath() %>/resources/images/acc.svg"/>&nbsp;숙소</a></li>
			<li><a href="activity_main.do"><img src="<%=request.getContextPath() %>/resources/images/act.png"/>&nbsp;액티비티</a></li>
			<li><a href="food_main.do"><img src="<%=request.getContextPath() %>/resources/images/resto.png"/>&nbsp;맛집</a></li>
			<li><a href="plan_detail.do?Planner_no=1"><img src="<%=request.getContextPath() %>/resources/images/plan.png"/>&nbsp;플랜</a></li>
				<ul>
					<li><a href="plan_make.do">플랜 짜기</a></li>
					<li><a href="">추천 플랜</a></li>
				</ul>
			</li>
		</ul>
	</div>

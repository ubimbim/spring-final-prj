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
	
  <img src="./resources/images/main.png" id="mainImage">	
	
  <div id="header">
	<a href="<%=request.getContextPath()%>/main.do"><img src="./resources/images/logo.svg" width="200px" id="logo"/></a>
	
	<input type="text" placeholder="검색어를 입력하세요." id="searchInput"> 

	<c:if test="${!empty kakao_id || !empty email_id }">
		<div id="mem">
			<ul>
				<li><a href="">위시리스트</a>&nbsp;|&nbsp;<a
					href="<%=request.getContextPath()%>/myplan.do">내 플랜</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage.do"><img
						src="<%=request.getContextPath()%>/resources/images/horse.svg"
						width="80px" /></a>
					<ul>
						<li><h4>${kakao_id}</h4></li>
						<li><a href="<%=request.getContextPath()%>/mypage.do"
							style="color: #5779F4">마이페이지</a><br>
						<hr></li>
						<c:if test="${!empty email_id }">
							<li><a href="email_logout.do">로그아웃</a></li>
						</c:if>
						<c:if test="${!empty kakao_id }">
							<li><a href="https://kauth.kakao.com/oauth/logout?client_id=${api_key }&logout_redirect_uri=http://localhost:8080/project/logout.do">로그아웃</a></li>
						</c:if>
					</ul>
				</li>
			</ul>
		</div>
	</c:if>
	<c:if test="${empty kakao_id && empty email_id }">
		<div id="noMem">
			<a href="kakao_login.do">로그인</a> <a href="kakao_signUp.do"><img src="<%=request.getContextPath() %>/resources/images/join.svg" width="100px"/></a>
		</div>
	</c:if>
  </div>	
	
	<div id="navi">
		<ul>
			<li><a href="place_list.do"><img src="<%=request.getContextPath() %>/resources/images/acc.svg"/>&nbsp;숙소</a></li>
			<li><a href="activity_main.do"><img src="<%=request.getContextPath() %>/resources/images/act.png"/>&nbsp;액티비티</a></li>
			<li><a href=""><img src="<%=request.getContextPath() %>/resources/images/resto.png"/>&nbsp;맛집</a></li>
			<li><a href=""><img src="<%=request.getContextPath() %>/resources/images/plan.png"/>&nbsp;플랜</a>
				<ul>
					<li><a href="">플랜 짜기</a></li>
					<li><a href="">추천 플랜</a></li>
				</ul>
			</li>
		</ul>
	</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/place.css?after" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class = "header">
    <div class = "headerBackground">     
    
    <div class = "hc">
	  
	  <a href="<%=request.getContextPath()%>/main.do"><img src="./resources/image/travelanner.png" width="200px" id="logo"/></a>
	  <input type = "text" placeholder="검색어를 입력하세요." id = "searchInput"> 

	<c:if test="${!empty kdto || !empty edto }">
		
		<div id="mem" align = "right">
			<ul>
				<li><a href="">위시리스트</a>&nbsp;|&nbsp;<a
					href="<%=request.getContextPath()%>/myplan.do">내 플랜</a></li>
				
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
			<a href="kakao_login.do"> 로그인 </a> <a href="kakao_signUp.do"><button type = "button" class = "btn btn-outline-light"> 회원가입 </button></a>
		</div>
	</c:if>
    
    </div>
    
    </div>
  </div>
  
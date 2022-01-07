<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>

</head>
<body>
	<c:set var="dto" value="${kdto }" />
	<h1>kakao 정보 가져오기 성공:  ${dto.u_email }</h1>
	<h1>kakao_id로 세션 생성 성공 : ${kakao_id} </h1>
	${email_id }
	<a href="https://kauth.kakao.com/oauth/logout?client_id=${api_key }&logout_redirect_uri=http://localhost:8080/project/logout.do">로그아웃</a>
</body>
</html>

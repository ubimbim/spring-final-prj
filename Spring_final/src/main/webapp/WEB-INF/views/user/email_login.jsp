<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travelanner - email login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
* {
	box-sizing: border-box;
	outline: none;
}

main {
	width: 100%;	
	font-family: "맑은 고딕";
	line-height: 1.5;
	overflow-anchor: none;
	margin: 0;
	padding: 0;
	background: #fff;
	color: #373a3c;
	display: block;
}

hr, p {
	margin: 0;
}

.SignIn_container {
    border: 1px solid #dee2e6;
    border-radius: 2px;
    margin: 64px auto;
    padding: 48px;
    width: 430px;	
}

.SiginInForm_container {
	margin-bottom: 8px;
}

.SignInForm_row {
	margin-bottom: 16px;
}

.TextField_label {
	width: 100%;
}

.TextField {
    font-size: 14px;
    height: 40px; 	
}

.TextField input {     
    font-size: 14px;
    height: 40px;
    padding-left: 12px;
    padding-right: 12px;
    width: 100%;
    border: 0;
    box-shadow: inset 0 0 0 1px #ced4da;
}

.TextField input:hover {
	background-color: #fff;
    border: 0;    
    box-shadow: inset 0 0 0 1px black;
    color: #343a40;
    font-weight: 500;
    transition: box-shadow .2s ease;
    width: 100%;
}

.TextField_description {
    color: #848c94;
    font-size: 12px;
    font-weight: 500;
    margin-bottom: 0;
    margin-top: 8px;
    width: 100%;	
}

.UserKeepSession_container {
    align-items: center;
    display: flex;
    justify-content: space-between;
}

.Checkbox_label {
	color: #343a40;
    font-weight: 400;
}

label {
	margin: 0;
	display: inline-block;
}

.Checkbox_input {
	background-color: #fff;
	height: 20px;
    width: 20px;
    border: 1px solid #ced4da;
    border-radius: 2px;    
    outline: none;
    position: relative;    
    vertical-align: middle;
}

.UserKeepSession_link {
    color: #666d75;
    font-size: 13px;
}

.Button_primary {
    background-color: #90a8ff;
    border: 1px solid #90a8ff;
}

.Button_block {
	padding-left: 0!important;
    padding-right: 0!important;
    text-align: center;
    width: 100%;	
}

.Button_large {
    font-size: 16px;
    height: 48px;
    padding-left: 32px;
    padding-right: 32px;
}

.Button_button {    
    border: 0;
    border-radius: 4px;
    cursor: pointer;
    font-weight: 700;
    padding: 0;
    position: relative;
    text-align: center;
    transition: box-shadow .1s ease-out,background-color .1s ease-out,color .1s ease-out,border-bottom .1s ease-out;
}

.Button_primary:hover {
	background-color: #004ec0;
	color: white;
}

input, button, select, textarea {
    margin: 0;
    line-height: inherit;
    border-radius: 0;
}

.SignInJoinLink_container {
	text-align: center;
    width: 100%;
}

.SignInJoinLink_description {
    color: #666d75;
    font-size: 12px;	
}

.SignInJoinLink_link {
    color: #666d75;
    font-size: 12px;
    margin-left: 4px;
    text-decoration: underline;
}

.SignInJoinLink_link:hover {
	color: black;
}

.UserKeepSession_link:hover {
	color: black;
}

</style>
</head>
<body>
	
	<!-- 헤더 영역 -->
	<header>
		<jsp:include page="../include/header.jsp" />
	</header>

	<!-- 메인 영역 -->
	<form action="email_login_ok.do" method="post">
	<main>
		<div class="SignIn_container">
			<div class="SiginInForm_container">
				<div class="SignInForm_row">					
					<label class="TextField_label" for="U_email">
					<p>이메일  *</p>
						<div class="TextField">
							<input type="email" class="TextField_input" id="U_email" name="U_email" placeholder="ID@example.com">
							<p class="TextField_description"></p>							
						</div>
					</label>
				</div>
				<div class="SignInForm_row">
					<label class="TextField_label" for="U_pwdCurrent">
						<p>비밀번호  *</p>
						<div class="TextField">
							<input type="password" class="TextField_input" id="U_pwdCurrent" name="U_pwd" placeholder="비밀번호를 입력해주세요.">	
						</div>
					</label>
				</div>
				<div class="SignInForm_row">
					<div class="UserKeepSession_container">
						<label class="Checkbox_label" for="keep_session">
							<input type="checkbox" id="keep_session" class="Checkbox_input" name="remember_me">
							로그인 상태 유지							
						</label>
						<a href="find_password.do" class="UserKeepSession_link">비밀번호 찾기</a>
					</div>
				</div>
				<div class="SignInForm_row">
					<button type="submit" class="Button_primary Button_block Button_large Button_button">이메일로 로그인</button>
				</div>
				<div class="SignInJoinLink_container">
					<span class="SignInJoinLink_description">아직 회원이 아니신가요?</span>
					<a href="sign_up.do" class="SignInJoinLink_link">회원가입</a>
				</div>
			</div>
		</div>
	</main>
	</form>

	<!-- footer 영역 -->
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>
</body>
</html>
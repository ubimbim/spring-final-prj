<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	box-sizing: border-box;
	outline: none;
}

main {
	width: 80vw;
	margin: 0 10vw;	
	font-family: "맑은 고딕";
	line-height: 1.5;
	overflow-anchor: none;
	margin: 0;
	padding: 0;
	background: #fff;
	color: #373a3c;
	display: block;
}

.welcome_hand {
    height: 56px;
    margin-top: 48px;
    -o-object-fit: contain;
    object-fit: contain;
    width: 56px;
	border: 0;
    border-width: 0;
    vertical-align: middle;
}

.SignIn_container {
	display: flex;
	align-items: center;
	flex-direction: column;
	margin: 64px auto 240px;
}

.Grid_container {
	position: relative;
	width: 100%;
}

.Grid_row {
	margin: 0 auto;
	position: relative;
	width: 1060px;
}

.index_container {
	border: 1px solid #e9ecef;
	border-radius: 2px;
	margin: 0 auto;
	padding: 0 48px;
	text-align: center;
	width: 430px;
}

.index_title {
	color: #343a40;
    font-size: 28px;
    font-weight: 700;
    letter-spacing: -.47px;
    line-height: 1.29;
    margin-top: 26px;
}

.index_subtitle {
    color: #666d75;
    font-size: 16px;
    font-weight: 700;
    letter-spacing: -.27px;
    line-height: normal;
    margin-top: 8px;
}

.index_kakaoOauthButtonWrapper {
    margin-bottom: 32px;
    margin-top: 24px;
}

.button {
    background-color: #f7e317;
    border: 1px solid #f7e317;
    color: #381e1f;
    font-size: 16px;
    font-weight: 600;
    letter-spacing: -.2px;
    width: 100%;
    cursor: pointer;    
}

.button_large {
    font-size: 16px;
    height: 48px;
    padding-left: 32px;
    padding-right: 32px;
}

.button_fx:hover {
	background-color: #ffff5d;
    border: 0;
    border-radius: 4px;
    cursor: pointer;
    font-weight: 700;
    padding: 0;
    position: relative;
    text-align: center;
    transition: box-shadow .1s ease-out,background-color .1s ease-out,color .1s ease-out,border-bottom .1s ease-out;
}

.index_buttonContentContainer {
	align-items: center;
    display: flex;
    flex-direction: row;
    justify-content: center;
}

.index_kakaoLogo {
    height: 18px;
    margin-right: 8px;    
    object-fit: contain;
    width: 18px;
    border: 0;
    border-width: 0;
    vertical-align:middle;
}

.index_oauthListContainer {
	margin-bottom: 40px;
}

.index_container_oauth {
    align-items: center;
    display: flex;
    flex-direction: row;
    justify-content: center;
}

.index_iconLabelWrapper {
    align-items: center;
    color: #666d75;
    display: flex;
    flex-direction: row;
    font-size: 15px;
    font-weight: 600;
    justify-content: space-between;
    cursor: pointer;
}

.index_iconLabelWrapper:hover img:first-of-type {
	display:none;
}

.index_iconLabelWrapper img:last-of-type {
	display:none;
}

.index_iconLabelWrapper:hover img:last-of-type {
	display:inline;
}

.index_iconImg {	
	padding-top: 3px;
    height: 18px;
    width: 18px;        
}

.index_footerContainer {
	align-items: center;
    color: #848c94;
    display: flex;
    flex-direction: row;
    font-size: 14px;
    font-weight: 600;
    justify-content: center;
    letter-spacing: -.23px;
    margin-bottom: 48px;
}

.index_footerContainer a {
	color: #666d75;
    margin-left: 6px;
    text-decoration: underline!important;
    cursor: pointer;    
}

a:hover {
	color: black;
}

a, a:active, a:hover, a:link, a:visited {
    text-decoration: none;
    cursor: pointer;
}

.emailLogin_link {
	color: #666d75;
    font-size: 14px;
    margin: 0;
    padding: 0;
    vertical-align: middle;    
    
}

.emailLogin_link span {
	display: inline;
	margin: 0;
	padding: 0;
		
}
</style>
</head>
<body>
	
	<!-- 헤더 영역 -->
	<header>
		<jsp:include page="../include/header.jsp" />
	</header>
	<!-- 메인 영역 -->
	<main class="SignIn_container">
		<div class="Grid_container">
			<div class="Grid_row">
				<div class="index_container">
					<img class="welcome_hand" alt="welcome"
						src="https://dffoxz5he03rp.cloudfront.net/build/production/c4f8f3342dc554238a353305e4e60450cb18f9ca/d30ded87686212ecc697.png">
					<p class="index_title">Welcome!</p>
					<p class="index_subtitle">제주 여행 플래너, Travelanner</p>
					<div class="index_kakaoOauthButtonWrapper">
						<button type="button" class="button button_large button_fx" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=b11fa6774e0285e50b5a9dfa4047b19f&redirect_uri=http://localhost:8080/project/kakao_login_ok.do&response_type=code'">
							<div class="index_buttonContentContainer"> 							
								<img class="index_kakaoLogo"
									src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICAgIDxwYXRoIGZpbGw9IiMzODFFMUYiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTkgNEM1LjY4NiA0IDMgNi4xMjQgMyA4Ljc0M2MwIDEuNzA1IDEuMTM4IDMuMiAyLjg0NiA0LjAzNi0uMTI1LjQ2OC0uNDU0IDEuNjk3LS41MiAxLjk2LS4wODEuMzI2LjEyLjMyMi4yNTEuMjM0LjEwNC0uMDY4IDEuNjQ0LTEuMTE2IDIuMzEtMS41NjguMzYuMDUzLjczMi4wODIgMS4xMTMuMDgyIDMuMzE0IDAgNi0yLjEyNCA2LTQuNzQ0QzE1IDYuMTIzIDEyLjMxNCA0IDkgNCIvPgo8L3N2Zz4KCg=="
									alt="kakao"> 
								<span>카카오로 시작하기</span>
							</div>
						</button>
					</div>
					<div class="index_oauthListContainer">
						<div class="index_container_oauth">
							<div class="index_iconLabelWrapper">								
								<a href="sign_up.do" class="emailLogin_link">	
								<img class="index_iconImg"
										src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iMTZweCIgaGVpZ2h0PSIxNnB4IiB2aWV3Qm94PSIwIDAgMTYgMTYiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8IS0tIEdlbmVyYXRvcjogc2tldGNodG9vbCA2My4xICgxMDEwMTApIC0gaHR0cHM6Ly9za2V0Y2guY29tIC0tPgogICAgPHRpdGxlPjExMjRGQkEzLUNFOTctNEU3Mi05MzA4LUIwQUVDNTQxMkZGNjwvdGl0bGU+CiAgICA8ZGVzYz5DcmVhdGVkIHdpdGggc2tldGNodG9vbC48L2Rlc2M+CiAgICA8ZyBpZD0i66Gc6re47J24JmFtcDvtmozsm5DqsIDsnoUiIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxnIGlkPSIzNzVf66Gc6re47J24JmFtcDvtmozsm5DqsIDsnoUiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0yNjIuMDAwMDAwLCAtNDAzLjAwMDAwMCkiPgogICAgICAgICAgICA8ZyBpZD0iR3JvdXAtNCIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMjYyLjAwMDAwMCwgNDAzLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgPGcgaWQ9IlNOUy9lbWFpbC9GaWxsZWQvWFMvZ3JheS01MDAiPgogICAgICAgICAgICAgICAgICAgIDxjaXJjbGUgaWQ9Ik92YWwiIGZpbGw9IiNBREI1QkQiIGN4PSI4IiBjeT0iOCIgcj0iOCI+PC9jaXJjbGU+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTgsOSBMNCw1LjQ0OTE2Mzk2IEM0LjA2ODEzNjg0LDUuMTgyMzQ1ODUgNC4yNzQxNjMzNyw1LjAwMDA0NDA0IDQuNTA3NjE4MDcsNSBMMTEuNDkyMzk4LDUgQzExLjcyNTgzMSw1LjAwMDA0Njg3IDExLjkzMTg0Myw1LjE4MjMxNTE4IDEyLDUuNDQ5MDk4NzkgTDgsOSBaIE0xMiw3IEw4LjIxMjAyMjIyLDEwLjQ3NjY3MzggQzguMDg2MTQyMzQsMTAuNTkyMjEyOSA3LjkxMzg1NzY2LDEwLjU5MjIxMjkgNy43ODc5Nzc3OCwxMC40NzY2NzM4IEw0LDcgTDQsMTAuMzQ4MDkyNCBDNCwxMC43MDgxMzA4IDQuMjM2MjQxMDQsMTEgNC41Mjc2NTg2NywxMSBMMTEuNDcyMzQxMywxMSBDMTEuNjEyMjg1MywxMSAxMS43NDY0OTc1LDEwLjkzMTMxNjQgMTEuODQ1NDUyNywxMC44MDkwNTk2IEMxMS45NDQ0MDc5LDEwLjY4NjgwMjggMTIsMTAuNTIwOTg3MSAxMiwxMC4zNDgwOTAyIEwxMiw3IFoiIGlkPSJTaGFwZSIgZmlsbD0iI0ZGRkZGRiIgZmlsbC1ydWxlPSJub256ZXJvIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPg=="
										alt="email"> <img class="index_iconImg"
										src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iMTZweCIgaGVpZ2h0PSIxNnB4IiB2aWV3Qm94PSIwIDAgMTYgMTYiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8IS0tIEdlbmVyYXRvcjogc2tldGNodG9vbCA2My4xICgxMDEwMTApIC0gaHR0cHM6Ly9za2V0Y2guY29tIC0tPgogICAgPHRpdGxlPjgwNDJCNzMxLTYwQzQtNDFGMy1BMzU2LTc3OTFCOTc3MjQ1OTwvdGl0bGU+CiAgICA8ZGVzYz5DcmVhdGVkIHdpdGggc2tldGNodG9vbC48L2Rlc2M+CiAgICA8ZyBpZD0i66Gc6re47J24JmFtcDvtmozsm5DqsIDsnoUiIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxnIGlkPSIxNDQwLeuhnOq3uOyduCZhbXA77ZqM7JuQ6rCA7J6FLey8gOydtOyKpCIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTg4NC4wMDAwMDAsIC00MjQuMDAwMDAwKSI+CiAgICAgICAgICAgIDxyZWN0IGZpbGw9IiNGRkZGRkYiIHg9IjAiIHk9IjAiIHdpZHRoPSIxMjI0IiBoZWlnaHQ9IjY4MCI+PC9yZWN0PgogICAgICAgICAgICA8cGF0aCBkPSJNMTAyMywxMjkuNSBMNTk3LDEyOS41IEM1OTYuNTg1Nzg2LDEyOS41IDU5Ni4yMTA3ODYsMTI5LjY2Nzg5MyA1OTUuOTM5MzQsMTI5LjkzOTM0IEM1OTUuNjY3ODkzLDEzMC4yMTA3ODYgNTk1LjUsMTMwLjU4NTc4NiA1OTUuNSwxMzEgTDU5NS41LDU0MyBDNTk1LjUsNTQzLjQxNDIxNCA1OTUuNjY3ODkzLDU0My43ODkyMTQgNTk1LjkzOTM0LDU0NC4wNjA2NiBDNTk2LjIxMDc4Niw1NDQuMzMyMTA3IDU5Ni41ODU3ODYsNTQ0LjUgNTk3LDU0NC41IEwxMDIzLDU0NC41IEMxMDIzLjQxNDIxLDU0NC41IDEwMjMuNzg5MjEsNTQ0LjMzMjEwNyAxMDI0LjA2MDY2LDU0NC4wNjA2NiBDMTAyNC4zMzIxMSw1NDMuNzg5MjE0IDEwMjQuNSw1NDMuNDE0MjE0IDEwMjQuNSw1NDMgTDEwMjQuNSwxMzEgQzEwMjQuNSwxMzAuNTg1Nzg2IDEwMjQuMzMyMTEsMTMwLjIxMDc4NiAxMDI0LjA2MDY2LDEyOS45MzkzNCBDMTAyMy43ODkyMSwxMjkuNjY3ODkzIDEwMjMuNDE0MjEsMTI5LjUgMTAyMywxMjkuNSBaIiBpZD0iQm94IiBzdHJva2U9IiNFOUVDRUYiIGZpbGw9IiNGRkZGRkYiPjwvcGF0aD4KICAgICAgICAgICAgPGcgaWQ9Ikdyb3VwLTQiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDg4NC4wMDAwMDAsIDQyNC4wMDAwMDApIj4KICAgICAgICAgICAgICAgIDxnIGlkPSJTTlMvZW1haWwvRmlsbGVkL1hTL2dyYXktNTAwIj4KICAgICAgICAgICAgICAgICAgICA8ZyBpZD0iU05TL2VtYWlsL0ZpbGxlZC9YUy9CbGFjayI+CiAgICAgICAgICAgICAgICAgICAgICAgIDxjaXJjbGUgaWQ9Ik92YWwiIGZpbGw9IiMzNDNBNDAiIGN4PSI4IiBjeT0iOCIgcj0iOCI+PC9jaXJjbGU+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik04LDkgTDQsNS40NDkxNjM5NiBDNC4wNjgxMzY4NCw1LjE4MjM0NTg1IDQuMjc0MTYzMzcsNS4wMDAwNDQwNCA0LjUwNzYxODA3LDUgTDExLjQ5MjM5OCw1IEMxMS43MjU4MzEsNS4wMDAwNDY4NyAxMS45MzE4NDMsNS4xODIzMTUxOCAxMiw1LjQ0OTA5ODc5IEw4LDkgWiBNMTIsNyBMOC4yMTIwMjIyMiwxMC40NzY2NzM4IEM4LjA4NjE0MjM0LDEwLjU5MjIxMjkgNy45MTM4NTc2NiwxMC41OTIyMTI5IDcuNzg3OTc3NzgsMTAuNDc2NjczOCBMNCw3IEw0LDEwLjM0ODA5MjQgQzQsMTAuNzA4MTMwOCA0LjIzNjI0MTA0LDExIDQuNTI3NjU4NjcsMTEgTDExLjQ3MjM0MTMsMTEgQzExLjYxMjI4NTMsMTEgMTEuNzQ2NDk3NSwxMC45MzEzMTY0IDExLjg0NTQ1MjcsMTAuODA5MDU5NiBDMTEuOTQ0NDA3OSwxMC42ODY4MDI4IDEyLDEwLjUyMDk4NzEgMTIsMTAuMzQ4MDkwMiBMMTIsNyBaIiBpZD0iU2hhcGUiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0ibm9uemVybyI+PC9wYXRoPgogICAgICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgICAgICAgICA8cGF0aCBkPSJNOCw5IEw0LDUuNDQ5MTYzOTYgQzQuMDY4MTM2ODQsNS4xODIzNDU4NSA0LjI3NDE2MzM3LDUuMDAwMDQ0MDQgNC41MDc2MTgwNyw1IEwxMS40OTIzOTgsNSBDMTEuNzI1ODMxLDUuMDAwMDQ2ODcgMTEuOTMxODQzLDUuMTgyMzE1MTggMTIsNS40NDkwOTg3OSBMOCw5IFogTTEyLDcgTDguMjEyMDIyMjIsMTAuNDc2NjczOCBDOC4wODYxNDIzNCwxMC41OTIyMTI5IDcuOTEzODU3NjYsMTAuNTkyMjEyOSA3Ljc4Nzk3Nzc4LDEwLjQ3NjY3MzggTDQsNyBMNCwxMC4zNDgwOTI0IEM0LDEwLjcwODEzMDggNC4yMzYyNDEwNCwxMSA0LjUyNzY1ODY3LDExIEwxMS40NzIzNDEzLDExIEMxMS42MTIyODUzLDExIDExLjc0NjQ5NzUsMTAuOTMxMzE2NCAxMS44NDU0NTI3LDEwLjgwOTA1OTYgQzExLjk0NDQwNzksMTAuNjg2ODAyOCAxMiwxMC41MjA5ODcxIDEyLDEwLjM0ODA5MDIgTDEyLDcgWiIgaWQ9IlNoYXBlIiBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9Im5vbnplcm8iPjwvcGF0aD4KICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+">								
									<span>이메일로 시작</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- footer 영역 -->
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>

</body>
</html>
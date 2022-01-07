<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travelanner - email join</title>
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

hr, p, label {
	margin: 0;
}

label {
	font-weight: 300;
	display: inline-block;
	cursor: default;
	margin: 0;
}

ul, li {
	margin: 0;
    padding: 0;
    list-style: none;
    font-size: 0;
}

.EmailSignUp_container {
	border: 1px solid #dee2e6;
    border-radius: 2px;
    margin: 64px auto;
    padding: 48px;
    width: 430px;	
}

.SignUpInfo_row {
	margin-bottom: 16px;
}

.SignUpInfo_container {
	margin-bottom: 24px;
}	

.TextField_label {
	width: 100%;
}

.TextField_label > p {
    color: #495056;
    font-size: 14px;
    font-weight: 500;
    line-height: 16px;
    margin-bottom: 8px;	
}

.TextField_input {
	background-color: #fff;
    border: 0;
    border-radius: 2px;
    box-shadow: inset 0 0 0 1px #ced4da;
    color: #343a40;
    font-weight: 500;
    transition: box-shadow .2s ease;
    width: 100%;	
}

.TextField_medium {
	font-size: 14px;
    height: 40px;
    padding-left: 12px;
    padding-right: 12px;	
}

.SignUpAgree_container {
	margin-bottom: 16px;
}

.Checkbox_label {	
	vertical-align: bottom;
	color: #343a40;
    font-weight: 400;
}

.Checkbox_medium {
	font-size: 14px;
}

.SignUpAgree_agrees {
    border: 1px solid #dee2e6;
    border-radius: 4px;
    margin-bottom: 10px;
    margin-top: 16px;
    padding: 16px 8px 16px 16px;	
}

.SignUpAgree_row {
	margin-bottom: 24px;
    width: 100%;	
}

.SignUpAgree_item {
	align-items: center;
    display: flex;
    width: 100%;
}

.Checkbox_input {
	height: 20px;
    width: 20px;
    box-sizing: border-box;
    padding: 0;
    border: 1px solid #ced4da;
    border-radius: 2px;
    margin: 0 8px 0 0;
    outline: none;
    position: relative;
    transition: border .2s,background-color .2s;
    vertical-align: bottom;
    line-height: inherit;
    touch-action: manipulation;
    font: inherit;
    color: inherit;
}

.SignUpAgree_label {
	flex: 1;
}

.TermPopup_wrapper {
	display: inline-block;
    font-size: 14px;
    line-height: 16px;
    min-height: 16px;
    width: 100%;
    cursor: pointer;
}

.TermPopup_term-arrow {
	cursor: pointer;
    float: right;
    height: 16px;
    width: 16px;
}

img {
    border-width: 0;
    vertical-align: middle;
    border: 0;
}

.SignUpAgree_notices {
	width: 100%;
}

.SignUpAgree_notice {
	color: #848c94;
    font-size: 12px;
    line-height: 1.5;
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

.TextField_left {
	text-align: left;
}

.TextField_invalid_description {
	color: #ff8000;
	font-size: 12px;
    font-weight: 500;
    margin-bottom: 0;
    margin-top: 8px;
    width: 100%;
}

.valid {
	box-shadow: inset 0 0 0 2px #33b893;
}

.invalid {
	box-shadow: inset 0 0 0 2px #ff8000;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	
	//이메일 형식 검사
	function validateEmail(email) {
		let filter = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		
		return filter.test(email); //형식에 맞으면 true 리턴
	}
	
	//비밀번호 형식 검사
	function validatePwd(pwd) {

		let filter = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; //  8 ~ 10자 영문, 숫자 조합

		return filter.test(pwd); // 형식에 맞는 경우 true 리턴

	}

	
	$(document).ready(function() {
		
		//오류 메세지 가려놓기
		$('#name_check').hide();
		$('#email_check').hide();
		$('#email_used').hide();
		$('#pwd_check').hide();
		$('#pwdConfirm_check').hide();
		
		//이름이 공백이거나 2자 미만이면 빨간색 테두리와 경고 메세지
		$("#U_name").keyup(function() {
			
			let name = $('#U_name').val();
			
			if(name == null || name == undefined || name == "" || name.length < 2) {
				$('#U_name').addClass('invalid');
				$('#name_check').show();
				$('#U_name').focus();			
			}else {
				$('#U_name').removeClass('invalid');
				$('#U_name').addClass('valid');
				$('#name_check').hide();
			}
			
			
		});
		
		//실시간으로 DB의 등록된 이메일이 있는지 중복 검사
		function check() {
			let email = $('#U_email').val();
		
			$.ajax({
				type:"post",
				url:"id_valid_check.do",
				data: {email : email},
				success: function(count) {	//컨트롤러가 id_valid_check.do를 실행하고 넘어온 count 값을 변수로 받아줌.
					if(count != 1) {	//count가 1이 아니면 중복이 아님.						
						$('#email_used').hide();
					}else {
						$('#email_used').show();
						$('#U_email').removeClass('valid');
						$('#U_email').addClass('invalid');
					}
				},
				error: function() {
					alert("Ajax 통신 에러");
				}
			});
		}
		
		$('#U_email').keyup(function() {
			
			check();
			
			let email = $('#U_email').val();
			
			if(email == null || email == undefined || email == "" || validateEmail(email) == false) {
				$('#U_email').addClass('invalid');
				$('#email_check').show();
				$('#U_email').focus();			
			}else {
				$('#U_email').removeClass('invalid');
				$('#U_email').addClass('valid');
				$('#email_check').hide();
			}
		});
		
		$('#U_pwd').keyup(function() {
			
			let pwd = $('#U_pwd').val();
			
			if(pwd == null || pwd == undefined || pwd == "" || validatePwd(pwd) == false) {
				$('#U_pwd').addClass('invalid');
				$('#pwd_check').show();
				$('#U_pwd').focus();			
			}else {
				$('#U_pwd').removeClass('invalid');
				$('#U_pwd').addClass('valid');
				$('#pwd_check').hide();
			}
		});
		
		$('#U_pwdConfirm').keyup(function() {
			
			let pwd = $('#U_pwd').val();
			let pwdConfirm = $('#U_pwdConfirm').val();
			
			if(pwdConfirm == null || pwdConfirm == undefined || pwdConfirm == "" || pwd != pwdConfirm) {
				$('#U_pwdConfirm').addClass('invalid');
				$('#pwdConfirm_check').show()				
				$('#U_pwdConfirm').focus();
			}else {
				$('#U_pwdConfirm').removeClass('invalid');
				$('#U_pwdConfirm').addClass('valid');
				$('#pwdConfirm_check').hide()
			}
		});
		
		//약관 동의 전체 체크
		$('#agreeAll').click(function() {
			if($('#agreeAll').is(':checked')) {
				$('input[name=agree_agreement]').prop("checked", true);
			}else {
				$('input[name=agree_agreement]').prop("checked", false);
			}
		});
		
		$('input[name=agree_agreement]').click(function() {
			let total = $('input[name=agree_agreement]').length;
			let chkd = $('input[name=agree_agreement]:checked').length;
			if(total != chkd) {
				$('#agreeAll').prop("checked", false);
			}else {
				$('#agreeAll').prop("checked", true);
			}
		});		

	});
	
</script>
</head>

<body>
	<!-- header -->
	<header>
		<jsp:include page="../include/header.jsp" />
	</header>
	
	<main class="SignIn_container">
		<div class="EmailSignUp_container">
			<form action="sign_up_ok.do" method="post">
				<div class="SignUpInfo_container">
					<div class="SignUpInfo_row">
						<label class="TextField_label">
							<p>이름  *</p>
							<div>
								<input type="text" class="TextField_input TextField_medium" id="U_name" name="U_name" placeholder="이름을 입력해주세요." required />
								<p id="name_check" class="TextField_invalid_description TextField_left">이름은 두 글자 이상 입력해주세요.</p>								
							</div>
						</label>
					</div>
					<div class="SignUpInfo_row">
						<label class="TextField_label">
							<p>이메일  *</p>
							<div>
								<input type="text" class="TextField_input TextField_medium" id="U_email" name="U_email" placeholder="ID@example.com" required/>
								<p id="email_check" class="TextField_invalid_description TextField_left">이메일 주소가 맞나요?</p>
								<p id="email_used" class="TextField_invalid_description TextField_left">이미 가입된 이메일 입니다.</p>
							</div>
						</label>
					</div>
					<div class="SignUpInfo_row">
						<label class="TextField_label">
							<p>비밀번호  *</p>
							<div>
								<input type="password" class="TextField_input TextField_medium" id="U_pwd" name="U_pwd" placeholder="영문, 숫자, 조합  8~10자" required>
								<p id="pwd_check" class="TextField_invalid_description TextField_left">비밀번호는 8~10자리 영문, 숫자 조합으로 입력해주세요.</p>
							</div>
						</label>
					</div>
					<div class="SignUpInfo_row">
						<label class="TextField_label">
							<p>비밀번호 확인  *</p>
							<div>
								<input type="password" class="TextField_input TextField_medium" id="U_pwdConfirm" name="U_pwdConfirm" placeholder="비밀번호를 한번 더 입력해주세요." required>
								<p id="pwdConfirm_check" class="TextField_invalid_description TextField_left">비밀번호가 일치하지 않습니다.</p>
							</div>
						</label>
					</div>					
				</div>
				<div class="SignUpAgree_container">
					<label class="Checkbox_label Checkbox_medium">
						<input type="checkbox" id="agreeAll" class="Checkbox_input Checkbox_medium" name="agreeAll">
						<strong>전체 약관 동의</strong>
					</label>
					<ul class="SignUpAgree_agrees">
						<li class="SignUpAgree_row">
							<div class="SignUpAgree_item">
								<label class="Checkbox_label Checkbox_medium">
									<input type="checkbox" class="Checkbox_input Checkbox_medium" name="agree_agreement">
								</label>
								<div class="SignUpAgree_label">
									<div class="TermPopup_wrapper">
										<div>
											회원 가입 및 운영약관 동의 (필수)
											<img class="TermPopup_term-arrow" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjQ0VENERBIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTYgNGw0IDQuMDAyTDYuMDA1IDEyIi8+Cjwvc3ZnPgo=" alt="arrow">
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="SignUpAgree_row">
							<div class="SignUpAgree_item">
								<label class="Checkbox_label Checkbox_medium">
									<input type="checkbox" class="Checkbox_input Checkbox_medium" name="agree_agreement">
								</label>
								<div class="SignUpAgree_label">
									<div class="TermPopup_wrapper">
										<div>
											개인정보 수집 및 이용 (필수)
											<img class="TermPopup_term-arrow" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjQ0VENERBIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTYgNGw0IDQuMDAyTDYuMDA1IDEyIi8+Cjwvc3ZnPgo=" alt="arrow">
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="SignUpAgree_row">
							<div class="SignUpAgree_item">
								<label class="Checkbox_label Checkbox_medium">
									<input type="checkbox" class="Checkbox_input Checkbox_medium" name="agree_agreement">
								</label>
								<div class="SignUpAgree_label">
									<div class="TermPopup_wrapper">
										<div>
											위치정보 이용약관 (선택)
											<img class="TermPopup_term-arrow" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjQ0VENERBIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTYgNGw0IDQuMDAyTDYuMDA1IDEyIi8+Cjwvc3ZnPgo=" alt="arrow">
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="SignUpAgree_row">
							<div class="SignUpAgree_item">
								<label class="Checkbox_label Checkbox_medium">
									<input type="checkbox" class="Checkbox_input Checkbox_medium" name="agree_agreement">
								</label>
								<div class="SignUpAgree_label">
									<div class="TermPopup_wrapper">
										<div>
											특가 항공권 및 할인 혜택 안내 <br>동의 (선택)
											<img class="TermPopup_term-arrow" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjQ0VENERBIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTYgNGw0IDQuMDAyTDYuMDA1IDEyIi8+Cjwvc3ZnPgo=" alt="arrow">
										</div>
									</div>
								</div>
							</div>
						</li>						
					</ul>
					<ul class="SignUpAgree_notices">
						<li class="SignUpAgree_notice">*선택 항목을 동의하지 않아도 서비스를 이용하실 수 있습니다.</li>
						<li class="SignUpAgree_notice">*회원 가입 시 본인이 만 14세 이상임에 동의하게 됩니다.</li>
					</ul>
				</div>
				<button type="submit" class="Button_button Button_primary Button_large Button_block">회원가입</button>
			</form>
		</div>
	</main>
	
	<!-- footer -->
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>
</body>

</html>
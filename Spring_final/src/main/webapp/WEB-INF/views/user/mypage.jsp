<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/main.css?after" type="text/css" />
</head>
<body>
	<header>
		<jsp:include page="../include/header.jsp" />
	</header>
	
	<c:set var="c" value="${cont }" />
	
	<div id="mypage">
		<h2>마이페이지</h2>
		<div id="box">
			
		<c:if test="${empty kdto }">
			<img src="<%=request.getContextPath() %>/resources/images/horse.svg" width="80px"/>
		</c:if>
		
		<c:if test="${!empty kdto }">
			<img src="${kdto.u_img }" style="width: 80px; border-radius: 40px">
		</c:if>
			
			<h4>${c.getU_name()} 님 </h4>
			<button id="edit">편집</button>
		
			<table>
				<tr>
					<th>이름</th> <td>${c.getU_name()}</td>
				</tr>
				
				<tr>
					<th>아이디</th> <td>${c.getU_id()}</td>
				</tr>
				<input type="hidden" value="${c.getU_id()}" id="hiddenId">
				
				<tr>
					<th>비밀번호</th> 
					<td>
						<c:forEach begin="1" end="${c.getU_pwd().length() }">
						*
						</c:forEach>
					</td>
				</tr>
				<input type="hidden" value="${c.getU_pwd()}" id="hiddenPwd">
				
				<tr>
					<th>이메일</th> <td>${c.getU_email()}</td>
				</tr>
				
				<tr>
					<th>연락처</th> <td>${c.getU_phone()}</td>
				</tr>
			</table>
				
			<button id="quit">회원탈퇴</button>
		</div>
	</div>
	
	<div class="none" id="modal1">
		<h4>비밀번호를 입력해주세요.</h4>
		<input type="password" id="pwdInput">
		<input type="button" value="확인" id="pwdBtn" onclick=idEdit()>&nbsp;|&nbsp;<input type="button" value="취소" onclick=cancel()>
	</div>
	
	<div class="none" id="modal1_1">
		<h4>비밀번호를 입력해주세요.</h4>
		<input type="password" id="pwdInput2">
		<input type="button" value="확인" id="pwdBtn" onclick=idDelete()>&nbsp;|&nbsp;<input type="button" value="취소" onclick=cancel()>
	</div>
	
	<div class="none" id="modal2">
		<h4>프로필 수정</h4>
		<form method="post" action="<%=request.getContextPath() %>/user_edit.do?id=${c.getU_id()}" onsubmit="return confirm('정보를 수정하시겠습니까?')">
			<table>
				<tr>
					<th>이름</th> <td>${c.getU_name()}</td>
				</tr>
				
				<tr>
					<th>아이디</th> <td>${c.getU_id()}</td>
				</tr>
				
				<tr>
					<th>비밀번호</th> <td><input value="${c.getU_pwd()}" name="pwd"></td>
				</tr>
				
				<tr>
					<th>이메일</th> <td><input value="${c.getU_email()}" name="email"></td>
				</tr>
				
				<tr>
					<th>연락처</th> <td><input value="${c.getU_phone()}" name="phone"></td>
				</tr>
			</table>
				<input type="submit" value="수정">&nbsp;|&nbsp;<input type="button" value="취소" onclick=cancel()>
		</form>
	</div>

	
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>
<script>
	const editBtn = document.getElementById('edit');
	const quitBtn = document.getElementById('quit');
	const modal1 = document.querySelector('#modal1');
	const modal1_1 = document.querySelector('#modal1_1');
	const modal2 = document.querySelector('#modal2');
	const cancelBtn = document.querySelector('.cancel');
	
	const pwdInput = document.querySelector('#pwdInput');
	const pwdInput2 = document.querySelector('#pwdInput2');
	const userPwd = document.querySelector('#hiddenPwd');
	const userId = document.querySelector('#hiddenId');
	const pwdBtn = document.querySelector('#pwdBtn');
	
	function edit() {
		modal1.classList.remove("none");
	}
	
	function cancel() {
		modal1.classList.add("none");
		modal1_1.classList.add("none");
		modal2.classList.add("none");
		pwdInput.value = '';
		pwdInput2.value = '';
	}
	
	
	function idEdit() {
		if(pwdInput.value === userPwd.value) {
			modal1.classList.add('none');
			modal2.classList.remove('none');
			pwdInput.value = '';
		} else {
			alert('비밀번호를 다시 한번 확인해주세요.');
			pwdInput.value = '';
		}
	}
	
	function quit() {
		modal1_1.classList.remove("none");
	}
	
	function idDelete() {
		if(pwdInput2.value === userPwd.value) {
			if(confirm('정말 탈퇴하시겠습니까?') == true) {
				location.href='user_delete.do?id='+userId.value+'';
			} else {
				cancel()
				return;
			}
		} else {
			alert('비밀번호를 다시 한번 확인해주세요.');
			pwdInput2.value = '';
		}
	}

	editBtn.addEventListener('click', edit);
	quitBtn.addEventListener('click', quit);
	cancelBtn.addEventListener('click', cancel);

</script>
</body>
</html>
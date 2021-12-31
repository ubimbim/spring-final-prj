<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=b11fa6774e0285e50b5a9dfa4047b19f&redirect_uri=http://localhost:8080/project/main.do&response_type=code">
	<img src="resources/user/kakao_login_large_narrow.png"></a>
	<a href="javascript:kakaoLogout();">로그아웃</a>
<!-- 	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script>
	window.Kakao.init('a3436731ffb3d80999f96a351ece49b1'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
	    window.Kakao.Auth.login({	 
	    	
	    	Kakao.Auth.setAccessToken(ACCESS_TOKEN);
	    	
	      	success: function (response) {
	        	console.log(response)
	        	window.KaKao.API.request({
	        		
	        		url:'v2/user/me',
	        		
	        		success: function(res) {	        			
	        			console.log(res);
	        		},
	        		
	        		fail: function(error) {
	        			console.log(error);
	        		}
	        		
	        	});
	      	},
		    fail: function (error) {
		        console.log(error)
		    },
	    })
	  }
	//카카오 연결 끊기
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {	    	
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  
	</script> -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<style type="text/css">

   @font-face {
	
     font-family: 'Pretendard-Regular';
	 src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	 font-weight: 400;
	 font-style: normal;
	
	}
	
   #sidebar { 
   
     color: #353535;
     margin-left:30px;
     font-family: 'Pretendard-Regular'; 
     font-size: 18px; 
     width:80px;
   
   }

   h5 {
        
     font-size:17px;
  
   }

   .button {
	
  	  margin:4px;
	  border: 1px solid lightgray;
	  color:gray;
	  font-size:15px;
	  background-color:white;
      text-align: left;
  	  padding: 3px;
  	  border-radius: 2em;
  	  width: 240px;
  	  height:40px;
  	
   }
   
</style>
</head>
<body>


	<!-- 카테고리 -->	
	<aside id = "sidebar">								
		 			   						
	  <button type = "button" class="button" onclick="location.href='place_list.do'"> &nbsp;&nbsp;&nbsp; # 전체보기 </button>
								
	  <c:set var = "str" value = "호텔" />
	  <button type = "button" class="button" onclick="location.href='place_category.do?result=${str }'"> &nbsp;&nbsp;&nbsp; # 호텔</button>								
								
	  <c:set var = "str" value = "펜션" />
      <button type = "button" class="button" onclick="location.href='place_category.do?result=${str }'"> &nbsp;&nbsp;&nbsp; # 펜션 </button>
								    
      <c:set var = "str" value = "풀빌라" />
	  <button type = "button" class="button" onclick="location.href='place_category.do?result=${str }'"> &nbsp;&nbsp;&nbsp; # 풀빌라 </button>
								
	  <c:set var = "str" value = "캠핑" />
	  <button type = "button" class="button" onclick="location.href='place_category.do?result=${str }'"> &nbsp;&nbsp;&nbsp; # 캠핑 </button>
								    
	  <c:set var = "str" value = "게하" />
	  <button type = "button" class="button" onclick="location.href='place_category.do?result=${str }'"> &nbsp;&nbsp;&nbsp; # 게하 </button>
														
	</aside>

</body>
</html>
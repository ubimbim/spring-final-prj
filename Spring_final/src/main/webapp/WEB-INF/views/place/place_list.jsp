<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

  <title> 트래블래너 :: 나다운 진짜 여행  </title>
  
  <link rel="stylesheet" href="./resources/css/place.css?after" type="text/css" /> 
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  
<style type="text/css">
  

	
    
</style>
</head>
<body>
	
	<header>
		<jsp:include page="include/place_header.jsp" />
	</header>	

    
    <!-- 본문 시작 -->
   
    <section>
    
    <!-- 하얀 박스 -->
    <div class = "container2" > 
	  <div id = "navi">
	    <ul>            
          <li><a href="place_list.do"><img src="<%=request.getContextPath() %>/resources/image/acc.svg"/> 숙소</a></li> 
          <li><a href="activity_main.do"><img src="<%=request.getContextPath() %>/resources/image/act.png"/> 액티비티</a></li> 
          <li><a href=""><img src="<%=request.getContextPath() %>/resources/image/resto.png"/> 맛집 </a></li> 
          <li><a href=""><img src="<%=request.getContextPath() %>/resources/image/plan.png"/> 플랜  </a></li>                          
	      <c:set var = "str" value = "호텔" />
	      <li><a href="place_category.do?result=${str }"><img src="<%=request.getContextPath() %>/resources/image/hotel.svg"/> 호텔   · 리조트  &nbsp;&nbsp;&nbsp; </a></li> 	            	      	      
	      <c:set var = "str" value = "펜션" />
	      <li><a href="place_category.do?result=${str }"><img src="<%=request.getContextPath() %>/resources/image/pension.svg"/> 펜션  · 풀빌라  </a></li> 	    
        </ul>
      </div>		      
	</div>
	
	<h1 class = "headline"> &nbsp; 어떤 숙소 찾으세요? </h1>

    <!-- 카테고리바 -->
    <jsp:include page="include/place_category.jsp"/>	
	 
    <!-- 카드형 숙소 리스트 -->
    <div class = "container5" align = "center">
        <div class = "container6">           
          
	    <!-- 카드 이미지 -->
	    
	    <c:forEach var = "rows" items = "${List }">
	    <div class = "card mb-3" style = "max-width:740px; max-height:180px;">            
          <div class = "row g-1">	            
	        <div class = "col-md-3">             
              <img src = "<%=request.getContextPath() %>/resources/image/${rows.getP_img() }" width = "210" height = "180" class = "rounded float-start">    
	        </div>	        
	        
	        <!-- 카드 본문 -->
	        <div class="col-md-8">
	          <div class = "card-body">
	            <h2 class = "name" align = "left"> ${rows.getP_name() } </h2>
			    <p class = "grade" align = "left"> ${rows.getP_grade() }성급  | ${rows.getP_location() } </p>
			    <br>	    
		        <h1 class = "info" align = "left"><fmt:formatNumber value = "${rows.getP_price() }" pattern = "###,###,###원"/>
		          <button type = "button" class = "btn btn-light" data-toggle = "modal" data-target = "${rows.getP_no() }"> 상세 정보 </button>

		          <button type = "button" class = " btn btn-cart"> 담기 </button>		 
		       	


		          <button type="button" class = " btn btn-cart" onclick="location.href='place_review.do?p_no=${fn:split(rows.getP_no(), '#')[0] }'">리뷰</button>
				 

		        </h1>
	            
				  <!-- 모달 -->
				  <c:forEach var = "rows" items = "${List }">
				  <div class = "modal" id = "${fn:split(rows.getP_no(), '#')[0] }" role = "dialog" data-seq="${rows.getP_no() }">				  
				    <div class = "modal-dialog">				   
				    				      
				      <!-- 모달 내용-->
				      <div class = "modal-content">
				        
				        <div class = "modal-header">				      
	                      <h5 align = "left"> Information ${fn:split(rows.getP_no(), '#')[0] } </h5>			 
				        </div>
				        
				        <div class = "modal-body">
				          <img src = "<%=request.getContextPath() %>/resources/image/${rows.getP_img_cont() }">       				            
				        </div>
				        
				        <div class = "modal-footer">
				          <button type = "button" class = "btn btn-light" data-dismiss = "modal"> close </button>
				        </div>
				      
				      </div> 
				    </div>				  				
				  </div>
				  </c:forEach>		
                  <!-- 모달 끝 -->

              </div>
            </div>
	      
	      </div>
	    </div>	   
	  </c:forEach>  

      <br><br><br><br>
	  
	   <%-- 페이징  --%>
	   <div class = "btn-page" align = "center">
	   <c:set var = "dto" value = "${Paging }" />
	     <c:if test = "${dto.getPage() > dto.getBlock() }">
	       <a href = "place_list.do?page=${dto.getStartBlock() - 1 }"> 
	         <img src="<%=request.getContextPath() %>/resources/image/arrowleft_blue.svg"/>
	       </a>
	     </c:if>

	   
	     <c:forEach begin = "${dto.getStartBlock() }" end = "${dto.getEndBlock() }" var = "i">
	       <c:if test = "${i == dto.getPage() }">
	         <button type = "button" class = "page_button1" onclick="location.href='place_list.do?page=${i }'"> ${i } </button>
	       </c:if>
	      
	       <c:if test = "${i != dto.getPage() }">
	         <button type = "button" class = "page_button2" onclick="location.href='place_list.do?page=${i }'"> ${i } </button>
	       </c:if>
	     </c:forEach>
	   
	     <c:if test = "${dto.getEndBlock() < dto.getAllPage() }">
	       <a href = "place_list.do?page=${dto.getEndBlock() + 1}"> 
	         <img src="<%=request.getContextPath() %>/resources/image/arrowright_blue.svg"/>
	       </a>
	       
	     </c:if>
      
      </div>
      </div>
    </div>
	</section>

	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>	 
    
</body>
</html>
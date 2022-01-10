<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

<title> 트래블래너 :: 나다운 진짜 여행  </title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  
<style type="text/css">

  .header {
   
    box-sizing: content-box;
    position: relative;
    padding-top: 120px;
    height: 225px;
    background-image: url("https://dffoxz5he03rp.cloudfront.net/build/production/c4f8f3342dc554238a353305e4e60450cb18f9ca/9b37b84db8397d0faf6c.jpg");
    background-position: center center;
    background-size: cover;
    background-repeat: no-repeat;
    
  }
  
  .headerBackground {
   
    position: absolute; 
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.4);
    
  }
     
  .headline {

    font-family: 'Pretendard-Regular';
    position: relative;
    z-index: 2;
    font-size: 35px;
    letter-spacing: 10px;
    color: white;
    text-align:center;
    margin-top:80px;
    
  }  
 
	section {
	
	 width: 1060px;
	 margin: -186px auto 0px;
	 z-index: 4;

  } 
   
   .container2 {
   
    z-index: 3;
    width:1050px;
    position: relative;
    padding: 4px;
    margin-top:80px;
    margin-bottom: 30px;
    border-radius: 8px;
    box-shadow: rgb(33 37 41 / 10%) 0px 4px 8px 0px;
    background-color: var(--white);  
   
   } 
      
   .container3 {
   
    z-index: 4;
    position: relative;
    width:980px;
    border-bottom: 1px solid var(--gray-200);
  
   }
   
   .category1 {
   
    align-items: center;   
    padding: 16px 10px;
    cursor: pointer;
   
   }
     
   .category2 {  
      
    align-items: center;    
    padding: 16px 10px;
    cursor: pointer;
   
   }
  
   .name {
   
     margin-left:30px;
     font-family: 'Pretendard-Regular';
     font-size:20px;
     align:left;
   
   }
     
   .grade {
     
     margin-left:30px;
     font-family: 'Pretendard-Regular'; 
     font-size:15px;
     color:lightgray;
     align:left;
   
   }  
   
   .info {
   
     margin-left:30px;
     font-family: 'Pretendard-Regular'; 
     font-size:20px;
     align:left;
      
   }
   .container5 {
   
   margin-top:-280px;
   
   } 
   .container6 {
   
   margin-left:300px;
   width:740px;
   
   }

  .myModal {
  
    width: 80%;
    height: 80%;
 
  }
  
  h5 {
        
    font-size:18px;
  
  }

  .btn-outline-info {	
  	
	font-size:12px;
	background-color:white;
    text-align: center; 	  	
  	width: 75px;
  	height:30px;
  	
  }
  	
  	.btn {
  	
  	text-align:center;
  	font-size:12px;
  	width: 75px;
  	height:30px; 	
  	
  }
  
  
  
  .content1::-webkit-scrollbar{
       	display:none; 
       }
    .content::-webkit-scrollbar{
       	display:none; 
       }
	textarea:focus{
		outline:none;
	}
  .content1{
		margin-top:15px;
      	width:400px;
      	height:50px;
      	resize:none;
		border: 0.5px solid skyblue;
		background-color: aliceblue;
		border-radius: 7px;
		padding-left: 7px;
		padding-top: 3px;
		font-size: 13px;
	}
	
	.content{
    	margin-right: 20px;
    	margin-top:15px;
      	width:350px;
      	height:50px;
      	resize:none;
		border: 0.5px solid skyblue;
		background-color: aliceblue;
		border-radius: 7px;
		padding-left: 7px;
		padding-top: 3px;
		font-size: 13px;
		
	}
	
	.stars{
		color:gold;
		
	}
	#formFileSm{
  		width:300px;
  	}
    
</style>
</head>
<body>
	<header>
		<jsp:include page="../include/header.jsp" />
	</header>

    <!-- 상단 이미지 -->
    <div class="header">
	  <div class="headerBackground"></div>
	</div>
    
    <!-- 본문 시작 -->
    <section>
    <h1 class = "headline"> 어떤 숙소 찾으세요? </h1>
    
    <!-- 하얀 박스 -->
    <div class = "container2" align = "center"> 
    <div class = "container3" align = "center">   
	  <div class = "container4" align = "center">
	    <div class = "category1">  
	      <img class = "icon" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_accommodation_hotel_40_x_40_colored.svg" alt="icon">
	      <span class = "text"> 호텔   · 리조트 </span>	            
	      
	      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      
	      <img class = "icon" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_accommodation_pension_40_x_40_colored.svg" alt="icon">
	      <span class = "text"> 펜션  · 풀빌라 </span>
	    
	      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    
	      <img class="css-12kngdl--CategoriesTabItem-style--icon" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_accommodation_jeju_40_x_40_colored.svg" alt="icon">
	        <span class="css-1vzn59z--CategoriesTabItem-style--text"> 감성숙소 </span>
        
        </div>		      
	  </div>
	</div>
	</div>

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
		          <button type = "button" class = " btn btn-outline-info btn-sm"> 담기 </button>		 
		       	
		          <button type="button" data-toggle="modal" data-target="${rows.p_no }_rv">리뷰</button>
				 
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
	   <c:set var = "dto" value = "${Paging }" />
	     <c:if test = "${dto.getPage() > dto.getBlock() }">
	       <a href = "place_list.do?page=1"> ◀◀ </a>
	       <a href = "place_list.do?page=${dto.getStartBlock() - 1 }"> ◀ </a>
	     </c:if>
	   
	     <c:forEach begin = "${dto.getStartBlock() }" end = "${dto.getEndBlock() }" var = "i">
	       <c:if test = "${i == dto.getPage() }">
	         <b><a href = "place_list.do?page=${i }"> [${i }] </a></b>
	       </c:if>
	      
	       <c:if test = "${i != dto.getPage() }">
	         <a href = "place_list.do?page=${i }"> [${i }] </a>
	       </c:if>
	     </c:forEach>
	   
	     <c:if test = "${dto.getEndBlock() < dto.getAllPage() }">
	       <a href = "place_list.do?page=${dto.getEndBlock() + 1}"> ▶ </a>
	       <a href = "place_list.do?page=${dto.getAllPage() }"> ▶▶ </a>
	     </c:if>

	   
	     <br><br>

      
      </div>
    </div>
	</section>
	    	     	
	<br><br><br><br><br><br><br><br>
	
	               
<!-- Modal -->
<%-- <c:forEach var = "rows" items = "${List }">
<div class = "modal" id = "${fn:split(rows.getP_no(), '#')[0] }" role = "dialog" data-seq="${rows.getP_no() }">	 --%>
<c:forEach var = "i" items = "${pList }">
  <div class="modal fade" role="dialog" id ="${fn:split(i.p_no, '#')[0] }_rv" data-seq="${i.p_no }">

    <div class="modal-dialog">

    

      <!-- Modal content-->
      <div class="modal-content">

        <div class="modal-header">
		<div class="preview">
          <h3 style="color: skyblue" align="center">Travelanner</h3>
    	<br>
    	<form method="post" enctype="multipart/form-data"
    		action="<%=request.getContextPath() %>/prlist_write.do">
    		<table cellspacing="0" style="border-top: none";>

    		<tr align="left">
    			<td> 아이디&nbsp;&nbsp;&nbsp;&nbsp;| ${edto.u_id }</td>
    			<td colspan="2" align="center">
					<input type="submit" class="btn btn-outline-info btn-sm" value="등록">
				</td>
			
			<tr align="left">
			<td>평점
				<select name="pr_grade" class="stars">
					<option class="stars" value="5">★★★★★</option>
					<option class="stars" value="4">★★★★☆</option>
					<option class="stars" value="3">★★★☆☆</option>
					<option class="stars" value="2">★★☆☆☆</option>
					<option class="stars" value="1">★☆☆☆☆</option>
					
				</select>
			</td>
			</tr>
			
			<tr align="left">
					<td> <textarea name="pr_cont" class="content1" placeholder="리뷰를 남겨주세요!" ></textarea></td>
			</tr>
			
			<tr align="left">
	      <td> <input class="form-control form-control-sm" id="formFileSm" type="file" name="file1"> <br> </td>
			</tr>
			<tr>
				<td style="width:400px" colspan="4">
					<hr>
				</td>
			</tr>
			
			
			
    		</table>
    	</form>
		</div>
        </div>

        <div class="modal-body">
		<input type="hidden" name="pr_no" value="${i.getPr_no() }">
        	<table cellspacing="0" style="border-top: none;">
				<tr align="left">
					<td> ${i.getU_id()}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;${i.getPr_date().substring(0,10) }</td>
					
					<td colspan="2" align="right">
						<input type="button" class="btn btn-outline-danger btn-sm " value="삭제"
							onclick="if(confirm('삭제하시겠습니까?')) {
								location.href='prlist_delete.do?no=${i.getPr_no()}'
							}else { return; }">
					</td>
				</tr>
				<tr align="left">
					<c:if test="${ 5==i.getPr_grade() }">
							<td class="stars"> ★★★★★ </td>
						</c:if>
						
						<c:if test="${ 4==i.getPr_grade() }">
							<td class="stars"> ★★★★☆</td>
						</c:if>
						
						<c:if test="${ 3==i.getPr_grade() }">
							<td class="stars"> ★★★☆☆</td>
						</c:if>
						
						<c:if test="${ 2==i.getPr_grade() }">
							<td class="stars"> ★★☆☆☆</td>
						</c:if>
						
						<c:if test="${ 1==i.getPr_grade() }">
							<td class="stars"> ★☆☆☆☆</td>
						</c:if>
				</tr>
				
				<tr align="left">
					<td> <textarea readonly class="content" >${i.getPr_cont() }</textarea></td>
					
					<c:if test="${ !empty i.getPr_img() }">
							<td colspan="4" align="right"> <img width="110" height="90" src="<%=request.getContextPath()%>/resources/review/${i.getPr_upload()}"> </td>
					</c:if>
					<c:if test="${ empty i.getPr_img() }">
							<td> ${i.getPr_img() } </td>
					
					</c:if>
				</tr>
				
				<tr>
					<td style="width:400px" colspan="4">
						<hr>
					</td>
				</tr>	
	</table>


        </div>

        <div class="modal-footer">

          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

        </div>

      </div>

    </div>

  </div>
</c:forEach>
<!-- ddd --> 
	
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>	 
    
</body>
</html>
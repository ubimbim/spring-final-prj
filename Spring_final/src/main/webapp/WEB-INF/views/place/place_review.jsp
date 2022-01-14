<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트래블래너 :: 나다운 진짜 여행</title>
<link rel="stylesheet" href="./resources/css/place.css?after" type="text/css" /> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style type="text/css">
.big{		

			margin-left: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;

        }
.preview{
	width: 700px;
}

textarea:focus{
		outline:none;
	}

	.content1::-webkit-scrollbar{
       	display:none; 
       }
     .content::-webkit-scrollbar{
       	display:none; 
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
	
	.stars{
		color:gold;
		
	}
	
	#formFileSm{
  		width:300px;
  	}
  	.id{
  		border-style: solid;
  	}
  	
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
	
	<h1 class = "headline"> &nbsp; 후기를 확인하세요! </h1>

    <!-- 카테고리바 -->
    <jsp:include page="include/place_category.jsp"/>	
	 
    <!-- 카드형 숙소 리스트 -->
    <div class = "container5" align = "center">
        <div class = "container6">           
          
	    <!-- 카드 이미지 -->
	    
	    	<div class="big">
    
    
        <div class="preview" >
		
    	<h3 style="color: skyblue"></h3>
    	<br>
    	
    	<form method="post" enctype="multipart/form-data"
    		action="<%=request.getContextPath() %>/prlist_write.do">
    	
    	<input type="hidden" name="p_no" value="${p_no }">
    	<c:if test="${empty edto.u_id }">
    		<input type="hidden" name="u_id" value="${kdto.u_id }">
    	</c:if>
    	<c:if test="${empty kdto.u_id }">
    		<input type="hidden" name="u_id" value="${edto.u_id }">
    	</c:if>
    	

    		
    		<table  style="border-top: none" >
    		
    		<tr align="left">
    		<c:if test="${empty kdto.u_id }">
    			<td class="id"> 계정&nbsp;&nbsp;| &nbsp;&nbsp;${edto.u_id}</td>
    		</c:if>
    		<c:if test="${!empty kdto.u_id }">
    			<td class="id"> 계정&nbsp;&nbsp;| &nbsp;&nbsp;${kdto.u_id}</td>
    		</c:if>

    			<td colspan="3" align="center">

    			<button type="button" class = " btn btn-cart" onclick="location.href='place_list.do'"> 뒤로 </button>&nbsp;&nbsp;&nbsp;&nbsp;

            
				<c:if test="${!empty kdto.u_id }">
					<input type="submit" class="btn btn-cart" value="등록">
				</c:if>
				<c:if test="${!empty edto.u_id }">
					<input type="submit" class="btn btn-cart" value="등록">
				</c:if>
				</td>
			</tr>
			
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
				<td style="width:700px" colspan="4">
					<hr>
				</td>
			</tr>
			
			
			
    		</table>
    	</form>
    	
    	
    </div>
    
    <div class="list">
    <table  class="ll">

	<c:forEach items="${pList }" var="i">

	<tr align="left">
		<td> ${i.getU_id()}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;${i.getPr_date() }</td>
		
		<td colspan="2" align="right">
			<c:if test="${i.getU_id() == kdto.u_id }">
			<input type="button" class="btn btn-outline-danger btn-sm " value="삭제"
				onclick="if(confirm('삭제하시겠습니까?')) {
					location.href='prlist_delete.do?no=${i.getPr_no()}&p_no=${p_no }&u_id=${edto.u_id }'
				}else { return; }">
			</c:if>
			<c:if test="${i.getU_id() == edto.u_id }">
			<input type="button" class="btn btn-outline-danger btn-sm " value="삭제"
				onclick="if(confirm('삭제하시겠습니까?')) {
					location.href='prlist_delete.do?no=${i.getPr_no()}&p_no=${p_no }&u_id=${kdto.u_id }'
				}else { return; }">
			</c:if>
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
				<td colspan="4" align="right"> <img width="150" height="120" src="<%=request.getContextPath()%>/resources/review/${i.getPr_upload()}"> </td>
		</c:if>
		<c:if test="${ empty i.getPr_img() }">
				<td> ${i.getPr_img() } </td>
		
		</c:if>
	</tr>
	
	<tr>
		<td style="width:600px" colspan="4">
			<hr>
		</td>

	</tr>
	</c:forEach>
	</table>
    </div>
    

    
    </div>
	
                  <!-- 모달 끝 -->

              </div>
            </div>
	      
	</section>	
  
  	<footer>
			<jsp:include page="../include/footer.jsp" />
	</footer>
</body>
</html>
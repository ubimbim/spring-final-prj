<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri= "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- import activity_list.css --%>
<link href="${path}/resources/css/activity_list.css" rel="stylesheet"/>
<link href="${path}/resources/css/activity_review.css" rel="stylesheet"/> 
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/place.css?after" type="text/css" /> 


<script type="text/javascript">
    
  

  
$(function (){
	$("#btn-mapModal").click(function (){
  	$("#map-toggle").toggle();
  });
});

$(function (){
	$("#btn-mapModal").click(function (){
	$("map-toggle-wrap").toggle();
	});
});
 
  
  function sort(how) {
	  $('main-mainHeader form').attr('action','act_new.do?sort='+how);
	  $('.sort').submit();
  }
  
  
	
  
  
  
</script>


</head>
<body>
      <header>
		<jsp:include page="../include/header.jsp" />
	</header>

	<div id="Main" >	
		<div class="Mainmod">
			<div class="css-Mainmod">
				<div class="css-Mainmod-ExperienceList">
					<h1 class="Act-title">제주도의 액티비티</h1>
				</div>
				<div class="Act-contentsWrapper">
					<aside class="Act-filterBar">
						
							<%-- 지역으로 보기 버튼 --%>
							<button class="Act-map-contentWrapper" type="button" id="btn-mapModal" class="main-css-imgWrapper" data-toggle="modal"
								data-target="#Map" data-seq="${i.getA_no() }">
							<div class="Act-map-content">
								<span class="Act-map-notSelectedLabel"><img alt="map" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_area_12_x_12_filled_blue_400.svg"> 지역으로 보기</span>
								
							</div>

						</button>
						<div class="map-11o8">
							<div class="map-1pdb300">
								<div class="map-toggle-wrap">
									<div id="map-toggle" style="display:none">  <%-- 지역으로 지도 버튼 --%>
									    <img class="map-css-thumbnail" alt="loading" src="<%=request.getContextPath()%>/resources/img/map_cloudfront.png">
										
										<c:set var="str" value="성산/우도" />
										<button class="map-1" onclick="location.href='activity_category.do?result=${str }'">
											<img class=map-icon alt="" src="<%=request.getContextPath()%>/resources/img/sun.png">
											성산/우도		
										</button>
										<c:set var="str" value="제주시" />
										<button class="map-2" onclick="location.href='activity_category.do?result=${str }'">
											<img class=map-icon alt="" src="<%=request.getContextPath()%>/resources/img/map-2.png">
											제주시
										</button>
										<c:set var="str" value="표선" />
										<button class="map-3" onclick="location.href='activity_category.do?result=${str }'">
											<img class=map-icon alt="" src="<%=request.getContextPath()%>/resources/img/map-3.png">
											표선
										</button>
										<c:set var="str" value="중문" />
										<button class="map-4" onclick="location.href='activity_category.do?result=${str }'">
											<img class=map-icon alt="" src="<%=request.getContextPath()%>/resources/img/map-4.png">
											중문
										</button>
										<c:set var="str" value="함덕/구좌" />										
										<button class="map-5" onclick="location.href='activity_category.do?result=${str }'">
											<img class=map-icon alt="" src="<%=request.getContextPath()%>/resources/img/map-5.png">
											함덕/구좌
										</button>
										<c:set var="str" value="서귀포" />
										<button class="map-6" onclick="location.href='activity_category.do?result=${str }'">
											<img class=map-icon alt="" src="<%=request.getContextPath()%>/resources/img/map-6.png">
											서귀포
										</button>
										<c:set var="str" value="애월" />
										<button class="map-7" onclick="location.href='activity_category.do?result=${str }'">
											<img class=map-icon alt="" src="<%=request.getContextPath()%>/resources/img/map-7.png">
											애월
										</button>
										<c:set var="str" value="한립/협재" />									
										<button class="map-8" onclick="location.href='activity_category.do?result=${str }'">
											<img class=map-icon alt="" src="<%=request.getContextPath()%>/resources/img/map-8.png">
											한립/협재
										</button>
										
									</div> <%-- 지역으로 지도 버튼 end --%>
								</div>
						 	 </div>
							</div>
							<%--전체 카테고리st --%>
							<h3 class="cat-title">카테고리</h3>
							<ul class="cat-catwapper">
								<li>
									<button class="cat-all-common" onclick="location.href='activity_list.do'">
										<img class="cat-icon" alt="all icon"
											src="./resources/img/total.png">
										<div class="cat-label">전체보기</div>
									</button>
								</li>

								<li>
								    <c:set var="str" value="스노우클링/다이빙" />
									<button class="cat-all-common" onclick="location.href='activity_category.do?result=${str }'">
									
										<img class="cat-icon" alt="all icon"
											src="./resources/img/diving.png">
										<div class="cat-label">스노우클링/다이빙</div>
									</button>
								</li>

								<li>
								<c:set var="str" value="서핑" />
									<button class="cat-all-common" onclick="location.href='activity_category.do?result=${str }'">
										<img class="cat-icon" alt="all icon"
											src="./resources/img/surfing.png">
										<div class="cat-label">서핑</div>
									</button>
								</li>

								<li>
								<c:set var="str" value="수상액티비티" />
									<button class="cat-all-common" onclick="location.href='activity_category.do?result=${str }'">
										<img class="cat-icon" alt="all icon"
											src="./resources/img/sea_activity.png">
										<div class="cat-label">수상액티비티</div>
									</button>
								</li>

								<li>
								<c:set var="str" value="크루즈/요트" />
									<button class="cat-all-common" onclick="location.href='activity_category.do?result=${str }'">
										<img class="cat-icon" alt="all icon"
											src="./resources/img/ship.png">
										<div class="cat-label">크루즈/요트</div>
									</button>
								</li>

								<li>
								<c:set var="str" value="골프" />
									<button class="cat-all-common" onclick="location.href='activity_category.do?result=${str }'">
										<img class="cat-icon" alt="all icon"
											src="./resources/img/golf.png">
										<div class="cat-label">골프</div>
									</button>
								</li>

								<li>
								<c:set var="str" value="실내액티비티" />
									<button class="cat-all-common" onclick="location.href='activity_category.do?result=${str }'">
										<img class="cat-icon" alt="all icon"
											src="./resources/img/indoor.png">
										<div class="cat-label">실내액티비티</div>
									</button>
								</li>

								<li>
								<c:set var="str" value="익스트림액티비티" />
									<button class="cat-all-common" onclick="location.href='activity_category.do?result=${str }'">
										<img class="cat-icon" alt="all icon"
											src="./resources/img/sky.png">
										<div class="cat-label">익스트림액티비티</div>
									</button>
								</li>

								<li>
								<c:set var="str" value="아웃도어" />
									<button class="cat-all-common" onclick="location.href='activity_category.do?result=${str }'">
										<img class="cat-icon" alt="all icon"
											src="./resources/img/kart_racing.png">
										<div class="cat-label">아웃도어</div>
									</button>
								</li>

								<li>
								<c:set var="str" value="이색체험" />
									<button class="cat-all-common" onclick="location.href='activity_category.do?result=${str }'">
										<img class="cat-icon" alt="all icon"
											src="./resources/img/farm2.png">
										<div class="cat-label">이색체험</div>
									</button>
								</li>


							</ul>
							<%--전체 카테고리end --%>
						
					</aside>
					<%--왼쪽 카테고리end --%>
					<%--가운데 main st --%>
					<main>
					
					<div class="big">
<div class="preview" >
		
    	<h3 style="color: skyblue"></h3>
    	<br>
    	
    	<form method="post" enctype="multipart/form-data"
    		action="<%=request.getContextPath() %>/arlist_write.do">
    	
    	<input type="hidden" name="a_no" value="${a_no }">
    	<c:if test="${empty edto.u_id }">
    		<input type="hidden" name="u_id" value="${kdto.u_id }">
    	</c:if>
    	<c:if test="${empty kdto.u_id }">
    		<input type="hidden" name="u_id" value="${edto.u_id }">
    	</c:if>
    	

    		
    		<table cellspacing="0" style="border-top: none">
    		
    		<tr align="left">
    		<c:if test="${empty kdto.u_id }">
    			<td class="id"> 계정&nbsp;&nbsp;| &nbsp;&nbsp;${edto.u_id}</td>
    		</c:if>
    		<c:if test="${!empty kdto.u_id }">
    			<td class="id"> 계정&nbsp;&nbsp;| &nbsp;&nbsp;${kdto.u_id}</td>
    		</c:if>

    			<td colspan="3" align="center">
    				<button type="button" class = " btn btn-cart" 
    					onclick="location.href='activity_list.do'">뒤로</button>&nbsp;&nbsp;&nbsp;&nbsp;
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
				<select name="ar_grade" class="stars">
					<option class="stars" value="5">★★★★★</option>
					<option class="stars" value="4">★★★★☆</option>
					<option class="stars" value="3">★★★☆☆</option>
					<option class="stars" value="2">★★☆☆☆</option>
					<option class="stars" value="1">★☆☆☆☆</option>
					
				</select>
			</td>
			</tr>
			
			<tr align="left">
					<td> <textarea name="ar_cont" class="content1" placeholder="리뷰를 남겨주세요!" ></textarea></td>
			</tr>
			
			<tr align="left">
	      <td> <input class="form-control form-control-sm" id="formFileSm" type="file" name="file2"> <br> </td>
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
    <table cellspacing="0" style="border-top: none";>
	
	<c:forEach items="${aList }" var="i">

	<tr align="left">
		<td> ${i.getU_id()}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;${i.getAr_date() }</td>
		
		<td colspan="2" align="right">
			
			<c:if test="${i.getU_id() == kdto.u_id }">
					<input type="button" class="btn btn-outline-danger btn-sm " value="삭제"
				onclick="if(confirm('삭제하시겠습니까?')) {
					location.href='arlist_delete.do?no=${i.getAr_no()}&a_no=${a_no }&u_id=${edto.u_id }'
				}else { return; }">
			</c:if>
			<c:if test="${i.getU_id() == edto.u_id }">
					<input type="button" class="btn btn-outline-danger btn-sm " value="삭제"
				onclick="if(confirm('삭제하시겠습니까?')) {
					location.href='arlist_delete.do?no=${i.getAr_no()}&a_no=${a_no }&u_id=${edto.u_id }'
				}else { return; }">
			</c:if>
			
			
			
		</td>
	</tr>
	<tr align="left">
		<c:if test="${ 5==i.getAr_grade() }">
				<td class="stars"> ★★★★★ </td>
			</c:if>
			
			<c:if test="${ 4==i.getAr_grade() }">
				<td class="stars"> ★★★★☆</td>
			</c:if>
			
			<c:if test="${ 3==i.getAr_grade() }">
				<td class="stars"> ★★★☆☆</td>
			</c:if>
			
			<c:if test="${ 2==i.getAr_grade() }">
				<td class="stars"> ★★☆☆☆</td>
			</c:if>
			
			<c:if test="${ 1==i.getAr_grade() }">
				<td class="stars"> ★☆☆☆☆</td>
			</c:if>
	</tr>
	
	<tr align="left">
		<td> <textarea readonly class="content" >${i.getAr_cont() }</textarea></td>
		
		<c:if test="${ !empty i.getAr_img() }">
				<td colspan="4" align="right"> <img width="150" height="120" src="<%=request.getContextPath()%>/resources/review/${i.getAr_upload()}"> </td>
		</c:if>
		<c:if test="${ empty i.getAr_img() }">
				<td> ${i.getAr_img() } </td>
		
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
						
					</main>	
				</div>
					
			</div>	
			<%--가운데 main end --%>	
			
		</div>
	
	</div>
	<footer>
			<jsp:include page="../include/footer.jsp" />
	</footer>

</body>
</html>
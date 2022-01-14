<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/activity.css" type="text/css" />
  
<script type="text/javascript">

	function heart_click() {
		window.alert("회원가입 후 이용해주세요 !!");
	}

</script>

</head>
<body>
	
	<header>
		<jsp:include page="../include/header.jsp" />
	</header>

	<!-- 제주도 지도 -->
	<section class="css-5ygj7j--LocationMapWrapper-style--container">
		<div class="Grid-module__container--YH1rv">
			<div class="Grid-module__row--GTpEN">
				<header class="SectionHeader-module__container--bh_K2">
					<div>
						<h2 class="SectionHeader-module__title--GHbNr">제주도 지역별로 살펴보기</h2>
					</div>
				</header>
				
				<div class="css-17r0a0b--LocationMapWrapper-style--mapWrapper">
					<div class="css-h8itil--LocationMap-style--mapHolder">
						<img src="https://dffoxz5he03rp.cloudfront.net/build/production/eb30bd6315544053cf88536c7407408f3862d05d/892cb8e81e120a249e8d.svg"
							alt="map" class="css-81frcg--LocationMap-style--map">
						<c:set var="str" value="애월" />
						<button class="map-btn-1" onclick="location.href='activity_category.do?result=${str }'">
							<img class="map-icon" 
								src="resources/img/map-7.png">&nbsp;애월</button>
						<c:set var="str" value="제주시" />
						<button class="map-btn-2" onclick="location.href='activity_category.do?result=${str }'">	
							<img class="map-icon" 
								src="resources/img/map-2.png">&nbsp;제주시</button>
						<c:set var="str" value="함덕/구좌" />
						<button class="map-btn-3" onclick="location.href='activity_category.do?result=${str }'">
							<img class="map-icon" 
								src="resources/img/map-5.png">&nbsp;함덕/구좌</button>
						<c:set var="str" value="성산/우도" />
						<button class="map-btn-4" onclick="location.href='activity_category.do?result=${str }'">
							<img class="map-icon" 
								src="resources/img/sun.png">&nbsp;성산/우도</button>
						<c:set var="str" value="표선" />
						<button class="map-btn-5" onclick="location.href='activity_category.do?result=${str }'">
							<img class="map-icon" 
								src="resources/img/map-3.png"">&nbsp;표선</button>
						<c:set var="str" value="서귀포" />
						<button class="map-btn-6" onclick="location.href='activity_category.do?result=${str }'">
							<img class="map-icon" 
								src="resources/img/map-6.png">&nbsp;서귀포</button>
						<c:set var="str" value="중문" />
						<button class="map-btn-7" onclick="location.href='activity_category.do?result=${str }'">
							<img class="map-icon" 
								src="resources/img/map-4.png">&nbsp;중문</button>
						<c:set var="str" value="한림/협재" />
						<button class="map-btn-8" onclick="location.href='activity_category.do?result=${str }'">
							<img class="map-icon" 
								src="resources/img/map-8.png">&nbsp;한림/협재</button>
					</div>
				</div>
			</div>
		</div>
	</section> <!-- 제주도 지도 section end -->
	
	<!--액티비티 추천 상품 -->
	<c:set var="alist" value="${Alist }" />
	
	<section class="LocationOffers-module__container--YvQqd">
		<div class="Grid-module__container--YH1rv">
			<div class="Grid-module__row--GTpEN">
				<header class="SectionHeader-module__container--bh_K2">
					<div>
						<h2 class="SectionHeader-module__title--GHbNr">추천 상품</h2>
					</div>
					
					<div class="SectionHeader-module__link--e1BPS">
						<a class="ShowMore-module__container--qTQB7" href="activity_list.do">
							<span class="ShowMore-module__label--nbwnw">전체보기 ></span>
						</a>
					</div>
				</header>
			</div>
		</div>
		
		<div class="Grid-module__container--YH1rv">
			<div class="Grid-module__row--GTpEN Grid-module__full--V7SXd">
				<div class="CardSwiper-module__container--XeLHJ CardSwiper-module__common--uy14J">
					<div class="Carousel-module__container--bsSzp">
						<div class="swiper-container swiper-container-horizontal">
							<div class="swiper-wrapper" style="width: 2160px; transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
								<!-- 추천 상품 -->
								<c:forEach items="${alist }" var="adto">
								<a data-toggle="modal" href="${adto.getA_no() }"  class="CardContainer-module__container--B5cqm CardShare-module__container--lu1iP CardContainer-module__fixedWidth--XQbwP CardContainer-module__offer--Npil0 CardContainer-module__swiper--xl_Sd swiper-slide swiper-slide-active" style="width: 270px;">
									<!-- 이미지 -->
									<div class="OfferVerticalCard-module__thumbnail--hPkZk">
										<div class="CardThumbnail-module__container--t05no CardThumbnail-module__vertical--fg4fQ">
											<div class="LazyImageLoader-module__container--xHxKX">
												<img alt="" class="LazyImageLoader-module__image--FB3yN MRT-LazyImageLoader__indicator LazyImageLoader-module__visible--n47Jt CardThumbnail-module__image--Tc1b4" data-src="https://d2ur7st6jjikze.cloudfront.net/offer_photos/110141/590640_medium_1635738265.jpg?1635738265" src="resources/img/${adto.getA_img() }">
												<div class="LazyImageLoader-module__placeholder--iH82U CardThumbnail-module__image--Tc1b4"></div>
											</div>
										</div>
									</div>
									<!-- 내용 -->
									<div class="OfferVerticalCard-module__body--QqE0h CardShare-module__body--SgF6m">
										<!-- 액티비티 카테고리 -->
										<div class="CardCategory-module__container--QvB9e">
											<div class="CardCategory-module__label--cLofl" style="overflow: hidden; text-overflow: ellipsis; -webkit-box-orient: vertical; display: -webkit-box; -webkit-line-clamp: 1;">${adto.getA_category() }</div>
										</div>
										<h3 class="CardTitle-module__container--l9OrK CardTitle-module__vertical--COffX">
											<div class="CardTitle-module__title--WAHI8" style="overflow: hidden; text-overflow: ellipsis; -webkit-box-orient: vertical; display: -webkit-box; -webkit-line-clamp: 2;">${adto.getA_name() }</div>
										</h3>
										<!-- 액티비티 평점, 가격 -->
										<div class="OfferVerticalCard-module__info--mUIkY">
											<div class="OfferVerticalCard-module__review--bDld6">
												<div class="CardRating-module__container--y1t4m">
													<div class="starRating starRating--m starRating--blue starRating--">
														<!-- 별 -->
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
															<path class="starColor" fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path>
														</svg>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
															<path class="starColor" fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path>
														</svg>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
															<path class="starColor" fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path>
														</svg>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
															<path class="starColor" fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path>
														</svg>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
															<path class="starColor" fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path>
														</svg>
													</div>
													    <!-- 평균 점수 -->
													    <span class="CardRating-module__review--EyAmj">5</span>
												</div>
											</div>
											<!-- 액티비티 가격 -->	
											<div class="CardPriceForVertical-module__container--jmRSV">
												<span class="CardPriceForVertical-module__main--VVTBF"><fmt:formatNumber value="${adto.getA_price() }" />
													<span class="CardPriceForVertical-module__unit--TTngM">원</span>
												</span>
												<span class="CardPriceForVertical-module__standard--jqgFm"> / 1인</span>
											</div>
										</div>
										
										<!-- 찜버튼 -->
										<div class="btn_cart">
											<c:if test="${!empty kdto }">
												<img src="resources/images/blankheart.png" id="cart_button" onmouseover="this.src='resources/images/heart.png'" onmouseout="this.src='resources/images/blankheart.png'" 
													onclick="location.href='prod_cart.do?userid=${kdto.getU_id()}&id=${fn:split(adto.getA_no(), '#')[0] }'">
											</c:if>
											<c:if test="${!empty edto }">
												<img src="resources/images/blankheart.png" id="cart_button" onmouseover="this.src='resources/images/heart.png'" onmouseout="this.src='resources/images/blankheart.png'" 
													onclick="location.href='prod_cart.do?userid=${edto.getU_id()}&id=${fn:split(adto.getA_no(), '#')[0] }'">
											</c:if>
											<c:if test="${empty kdto and empty edto }">
												<img src="resources/images/blankheart.png" id="cart_button" onmouseover="this.src='resources/images/heart.png'" onmouseout="this.src='resources/images/blankheart.png'" 
													onclick="heart_click();">
											</c:if>
										</div>								
	
									</div>
								</a> <!-- 추천 상품 첫 번째 end  -->
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> <!-- 액티비티 추천 상품 section end -->
	
	<!-- 관광명소 -->
	<c:set var="slist" value="${Slist }" />
	
	<section class="LocationOffers-module__container--YvQqd">
		<div class="Grid-module__container--YH1rv">
			<div class="Grid-module__row--GTpEN">
				<header class="SectionHeader-module__container--bh_K2">
					<div>
						<h2 class="SectionHeader-module__title--GHbNr">관광 명소</h2>
					</div>
				</header>
			</div>
		</div>
		
		<div class="Grid-module__container--YH1rv">
			<div class="Grid-module__row--GTpEN Grid-module__full--V7SXd CityLandmark-module__container--B4Zdi">
				<div class="Carousel-module__container--bsSzp">
					<div class="swiper-container swiper-container-horizontal">
						<div class="swiper-wrapper" style="width: 1440px; transform: translate3d(0px, 0px, 0px);">
							
							<c:forEach items="${slist }" var="sdto">
							<a data-toggle="modal" href="${sdto.getS_no() }" class="CityLandmarkItem-module__card--z9THH swiper-slide swiper-slide-active" style="width: 160px; margin-right: 20px;">
							<!-- <a href="/offers?t=llp&amp;qcr=Korea, Republic of&amp;qct=Jeju&amp;landmarks=Olle Trail" class="CityLandmarkItem-module__card--z9THH swiper-slide swiper-slide-active" style="width: 160px; margin-right: 20px;"> -->
								<img class="CityLandmarkItem-module__thumbnail--jVCJK" src="resources/img/${sdto.getS_img() }" alt="">
								<div class="CityLandmarkItem-module__body--xsaV6">
									<h3 class="spot_name">#${sdto.getS_name() }</h3>
									<!-- <span>103개의 상품</span> -->
									
									<!-- 찜버튼 -->
									<div class="spot_cart">
										<c:if test="${!empty kdto }">
											<img src="resources/images/blankheart.png" id="cart_button" onmouseover="this.src='resources/images/heart.png'" onmouseout="this.src='resources/images/blankheart.png'" 
												onclick="location.href='prod_cart.do?userid=${kdto.getU_id()}&id=${fn:split(sdto.getS_no(), '#')[0] }'">
										</c:if>
										<c:if test="${!empty edto }">
											<img src="resources/images/blankheart.png" id="cart_button" onmouseover="this.src='resources/images/heart.png'" onmouseout="this.src='resources/images/blankheart.png'" 
												onclick="location.href='prod_cart.do?userid=${edto.getU_id()}&id=${fn:split(sdto.getS_no(), '#')[0] }'">
										</c:if>
										<c:if test="${empty kdto and empty edto }">
											<img src="resources/images/blankheart.png" id="cart_button" onmouseover="this.src='resources/images/heart.png'" onmouseout="this.src='resources/images/blankheart.png'" 
												onclick="heart_click();">
										</c:if>
									</div>
				
								</div>
							</a>
							</c:forEach>
							
						</div>
						
						<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
					</div>
					
					<!-- 
					<button type="button" class="landmarks Carousel-module__button--dopOC Carousel-module__prev--rDOsF Carousel-module__disabled--YdarJ" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true">
						<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjNDk1MDU2IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTE0IDZsLTYgNi4wMDNMMTMuOTkzIDE4Ii8+Cjwvc3ZnPgo=" alt="prev">
					</button>
					
					<button type="button" class="landmarks Carousel-module__button--dopOC Carousel-module__next--Gk8nt" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false">
						<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjNDk1MDU2IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTEwIDZsNiA2LjAwM0wxMC4wMDcgMTgiLz4KPC9zdmc+Cg==" alt="next">
					</button>
					-->
				</div>
			</div>
		</div>
	</section> <!-- 관광명소 section end -->
	
	<!-- 추천일정 -->
	<c:set var="srdto" value="${SRdto }" />
	<c:set var="udto" value="${Udto }" />
	
	<section class="LocationOffers-module__container--YvQqd">
		<div class="Grid-module__container--YH1rv">
			<div class="Grid-module__row--GTpEN">
				<header class="SectionHeader-module__container--bh_K2">
					<div>
						<h2 class="SectionHeader-module__title--GHbNr">플랜 속 이 장소는?</h2>
					</div>
					
					<div class="SectionHeader-module__link--e1BPS">
						<a class="ShowMore-module__container--qTQB7" href="">
							<span class="ShowMore-module__label--nbwnw">전체보기 ></span>
						</a>
					</div>
				</header>
			</div>
		</div>
		
		<div class="Grid-module__container--YH1rv">
			<div class="Grid-module__row--GTpEN Grid-module__full--V7SXd">
				<div class="CardSwiper-module__container--XeLHJ CardSwiper-module__common--uy14J">
					<div class="Carousel-module__container--bsSzp">
						<div class="swiper-container swiper-container-horizontal">
							<div class="swiper-wrapper" style="width: 2160px; transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
								<!-- 추천일정 첫 번째 -->
								<a data-toggle="modal" href="${srdto.getSr_no() }"  class="CardContainer-module__container--B5cqm CardShare-module__container--lu1iP CardContainer-module__fixedWidth--XQbwP CardContainer-module__offer--Npil0 CardContainer-module__swiper--xl_Sd swiper-slide swiper-slide-active" style="width: 270px;">
									<!-- 이미지 -->
									<div class="OfferVerticalCard-module__thumbnail--hPkZk">
										<div class="CardThumbnail-module__container--t05no CardThumbnail-module__vertical--fg4fQ">
											<div class="LazyImageLoader-module__container--xHxKX">
												<img alt="" class="LazyImageLoader-module__image--FB3yN MRT-LazyImageLoader__indicator LazyImageLoader-module__visible--n47Jt CardThumbnail-module__image--Tc1b4" data-src="https://d2ur7st6jjikze.cloudfront.net/offer_photos/110141/590640_medium_1635738265.jpg?1635738265" src="resources/img/${srdto.getSr_img() }">
												<div class="LazyImageLoader-module__placeholder--iH82U CardThumbnail-module__image--Tc1b4"></div>
											</div>
										</div>
									</div>
									<!-- 내용 -->
									<div class="OfferVerticalCard-module__body--QqE0h CardShare-module__body--SgF6m">
										<!-- 추천일정 작성자, 이름 -->
										<div class="CardCategory-module__container--QvB9e">

											<div class="CardCategory-module__label--cLofl" style="overflow: hidden; text-overflow: ellipsis; -webkit-box-orient: vertical; display: -webkit-box; -webkit-line-clamp: 1;">${udto.getU_name() }님 일정 속 이곳은?</div>

										</div>
										<h3 class="CardTitle-module__container--l9OrK CardTitle-module__vertical--COffX">
											<div class="CardTitle-module__title--WAHI8" style="overflow: hidden; text-overflow: ellipsis; -webkit-box-orient: vertical; display: -webkit-box; -webkit-line-clamp: 2;">도두봉</div>
										</h3>
										<h5 class="plan_cont">
											#공항근처 #키세스존 #인생샷
										</h5>
									</div>
								</a> <!-- 추천 일정 첫 번째 end  -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> <!-- 추천 일정 section end -->
	
	<!-- 추천 액티비티 모달창 -->
	<c:forEach items="${alist }" var="aadto">
	<div class= "modal fade modal-dialog-centered modal-dialog-scrollable" id="${fn:split(aadto.getA_no(), '#')[0] }" role="dialog">  <!-- 사용자 지정 부분① : id명 --> 
		<div class="modal-dialog">
		<!-- Modal content -->
		<div class="modal-content">
	       <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h4 class="plan-modal-title">상세 정보</h4> <!-- 사용자 지정 부분② : 타이틀 --> 
			</div>
			
			<div class="modal-body">
				<div class="modal-text">
					<img alt="" src="resources/img/${aadto.getA_img_cont() }" width="100%" height="60%">
				</div>
			</div>
		</div>
		</div>
	</div>
	</c:forEach>
	
	<!-- 관광 명소 모달창 -->
	<c:forEach items="${slist }" var="mdto">
	<div class="modal fade modal-dialog-centered modal-dialog-scrollable" id="${fn:split(mdto.getS_no(), '#')[0] }" role="dialog">  <!-- 사용자 지정 부분① : id명 --> 
		<div class="modal-dialog">
		<!-- Modal content -->
		<div class="modal-content">
	       <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h4 class="modal-title">상세 정보</h4> <!-- 사용자 지정 부분② : 타이틀 --> 
			</div>
		
			<div class="modal-body">
				<img alt="" src="resources/img/${mdto.getS_img_cont() }" width="100%" height="60%"> <!-- 사용자 지정 부분③ : 텍스트 메시지 --> 
				<div class="modal-text">
					<p>${mdto.getS_cont() }</p>
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
	
		</div>
		</div>
	</div>
	</c:forEach>
	
	<!-- 추천 일정 모달창 -->
	<div class="modal fade modal-dialog-centered modal-dialog-scrollable" id="${fn:split(srdto.getSr_no(), '#')[0] }" role="dialog">  <!-- 사용자 지정 부분① : id명 --> 
		<div class="modal-dialog">
		<!-- Modal content -->
		<div class="modal-content">
	       <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="plan-modal-title">${Udto.getU_name() }님의 일정 속 이곳은?</h4> <!-- 사용자 지정 부분② : 타이틀 --> 
			</div>
			
			<div class="modal-body">
				<img alt="" src="resources/img/${srdto.getSr_img() }" width="100%" height="60%"> <!-- 사용자 지정 부분③ : 텍스트 메시지 --> 
				<div class="modal-text">
					<p>${srdto.getSr_cont() }</p>
					<p>${srdto.getSr_cont() }</p>
					<p>${srdto.getSr_cont() }</p>
					<p>${srdto.getSr_cont() }</p>
				</div>
			</div>
	
			<div class="modal-footer" style="display: flex;">
				<div class="modal-footer-cart">
					<p class="modal-footer-title">이 곳이 마음에 든다면</p>
					<button type="button" class="modal-footer-button">담기</button>
					
				</div>
				<div class="modal-footer-plan">
					<p class="modal-footer-title">전체 일정이 궁금하다면</p>
					<button type="button" class="modal-footer-button" onclick="location.href='plan_detail.do?Planner_no=1'">보러가기</button>
				</div>
			</div>
		</div>
		</div>
	</div>
	
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>
					
</body>
</html>
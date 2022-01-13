<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트래블래너 :: 나다운 진짜 여행</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.big{	
		margin-top: 200px;
			
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: white;

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


</style>

</head>
<body>

<header>
		<jsp:include page="../include/header.jsp" />
</header>



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
    				<button type="button" class = " btn btn-outline-info btn-sm" onclick="location.href='activity_list.do'">돌아가기</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${!empty kdto.u_id }">
					<input type="submit" class="btn btn-outline-info btn-sm" value="등록">
				</c:if>
				<c:if test="${!empty edto.u_id }">
					<input type="submit" class="btn btn-outline-info btn-sm" value="등록">
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


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	.modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;

        width: 600px;
        height: 750px;

        padding: 40px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
    
      .modal_body::-webkit-scrollbar {
    	display: none; /* Chrome, Safari, Opera*/
		}


    .content{
    
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
	.content1{
		margin-top:15px;
      	width:450px;
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
      
      .content::-webkit-scrollbar{
       	display:none; 
       }
       .content1::-webkit-scrollbar{
       	display:none; 
       }
	textarea:focus{
		outline:none;
	}
  	
  	#formFileSm{
  		width:300px;
  	}

  	
</style>

</head>
<body>

<div class="modal" >
    <div class="modal_body" style="overflow-y: scroll;">
    
    <div class="freview">
    	<h3 style="color: skyblue">Travelanner</h3>
    	<br>
    	<form method="post" enctype="multipart/form-data"
    		action="<%=request.getContextPath() %>/frlist_write.do">
    		<table cellspacing="0" style="border-top: none";>
    		<tr align="left">
    			<td> 아이디&nbsp;&nbsp;&nbsp;&nbsp;|</td>
    			<td colspan="3" align="center">
					<input type="submit" class="btn btn-outline-info btn-sm" value="등록">
				</td>
			
			<tr align="left">
			<td>평점
				<select name="fr_grade" class="stars">
					<option class="stars" value="5">★★★★★</option>
					<option class="stars" value="4">★★★★☆</option>
					<option class="stars" value="3">★★★☆☆</option>
					<option class="stars" value="2">★★☆☆☆</option>
					<option class="stars" value="1">★☆☆☆☆</option>
					
				</select>
			</td>
			</tr>
			
			<tr align="left">
					<td> <textarea name="fr_cont" class="content1" placeholder="리뷰를 남겨주세요!" ></textarea></td>
			</tr>
			
			<tr align="left">
	      <td> <input class="form-control form-control-sm" id="formFileSm" type="file" name="file3"> <br> </td>
			</tr>
			<tr>
				<td style="width:600px" colspan="4">
					<hr>
				</td>
			</tr>
			
			
			
    		</table>
    	</form>
    </div>
    
    
    
	<table cellspacing="0" style="border-top: none";>
	<c:set var="list" value="${fList }" />
	
	
	<c:forEach items="${list }" var="i">
	<input type="hidden" name="fr_no" value="${i.getFr_no() }">
	
	<tr align="left">
		<td> ${i.getUser_id()}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;${i.getFr_date() }</td>
		
		<td colspan="2" align="right">
			<input type="button" class="btn btn-outline-danger btn-sm " value="삭제"
				onclick="if(confirm('삭제하시겠습니까?')) {
					location.href='frlist_delete.do?no=${i.getFr_no()}'
				}else { return; }">
		</td>
	</tr>
	<tr align="left">
			<c:if test="${ 5==i.getFr_grade() }">
				<td class="stars"> ★★★★★ </td>
			</c:if>
			
			<c:if test="${ 4==i.getFr_grade() }">
				<td class="stars"> ★★★★☆</td>
			</c:if>
			
			<c:if test="${ 3==i.getFr_grade() }">
				<td class="stars"> ★★★☆☆</td>
			</c:if>
			
			<c:if test="${ 2==i.getFr_grade() }">
				<td class="stars"> ★★☆☆☆</td>
			</c:if>
			
			<c:if test="${ 1==i.getFr_grade() }">
				<td class="stars"> ★☆☆☆☆</td>
			</c:if>
	</tr>
	
	<tr align="left">
		<td> <textarea readonly class="content" >${i.getFr_cont() }</textarea></td>
		
		<c:if test="${ !empty i.getFr_img() }">
				<td colspan="4" align="right"> <img width="130" height="100" src="<%=request.getContextPath()%>/resources/image/${i.getFr_upload()}"> </td>
		</c:if>
		<c:if test="${ empty i.getFr_img() }">
				<td> ${i.getFr_img() } </td>
		
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
    <button class="btn-open-popup" >Modal 띄우기</button>
    
   
    
    <script>
      const body = document.querySelector("body");
      const modal = document.querySelector(".modal");
      const btnOpenPopup = document.querySelector(".btn-open-popup");

      
      
      
      btnOpenPopup.addEventListener("click", () => {
        modal.classList.toggle("show");

        if (modal.classList.contains("show")) {
          body.style.overflow = "hidden";
        }
      });

      modal.addEventListener("click", (event) => {
        if (event.target === modal) {
          modal.classList.toggle("show");

          if (!modal.classList.contains("show")) {
            body.style.overflow = "auto";
          }
        }
      });
    </script>

</body>
</html>
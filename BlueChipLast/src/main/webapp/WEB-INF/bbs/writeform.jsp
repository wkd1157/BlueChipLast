<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>

<head>
<title>글쓰기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<c:set var="root" value="<%=request.getContextPath()%>" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
	<body>
	<script type="text/javascript">
		$(function(){
			id=localStorage.getItem("key1");
			id=id.replace("님 환영합니다","");
			/* alert(id); */
			$("#myid").text(id);
			$("#writer").val(id);
			
		});
		function goBack(){
			//window.history.back();
		}

</script>
	<form action="write.idol" method="post" >
		<table class="table table-striped" style="width:99%; height:500px; margin:0 auto;">
			<tr>
				<th style="height:10%">작성자</th>
				<td colspan="3">
					<!-- <span id="myid"> -->
					<input type="text" name="writer" id="writer" value="test">
					</span>
				</td>
			</tr>
			<tr >
				<th style="height:10%">제목</th>
				<td colspan="3">
					<input type="text" name="subject" class="form-control"
					required="required" style="width:45%" maxlength="20">
				</td>
			</tr>
			<tr>
			<th style="height:60%">내용</th>
				<td colspan="3">
					<textarea name="content" class="form-control"
					required="required" style="width:80%; height:80%;" ></textarea>
				</td>
			</tr>
			<tr>
				<td style="width:10%" height="10%" >
				</td>
				<td >	
					<input type="submit" value="게시글 저장" class="form-control">
				</td>
				<td>
					<input type="reset" value="글쓰기취소">
					</td>
				<td>
	      			<input type="button" value="목록" onclick="goBack();">
				</td>
				
			</tr>
		</table>
		</form>
	</body>
</html>

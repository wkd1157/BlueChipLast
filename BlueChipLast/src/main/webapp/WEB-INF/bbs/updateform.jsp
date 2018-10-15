<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="utf-8">
<title>수정하기</title>
<c:set var="root" value="<%=request.getContextPath() %>"/> 
</head>
<body>
<script type="text/javascript">
function goBack(){
	window.history.back();
}
</script>
<div class="container">
	<form action="update.idol" method="post">
		<input type="hidden" name="num" value="${dto.num}">
	<input type="hidden" name="pageNum" value="${pageNum}"> 
		<table class="table table-bordered" style="margin:0 auto;font-size: 10pt; width:90%">
			<tr>
				<td align="center" width="10%">글쓴이 :</td>
				<td width="90%">${dto.writer}</td>
			</tr>
			<tr>
				<td align="center" width="10%">제목 :</td>
				<td><input type="text" name="subject" value="${dto.subject}" maxlength="20"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea cols="50" rows="20" name="content" style="width: 100%;" maxlength="1000">${dto.content} </textarea>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="수정하기"></td>
				<td><input type="button" value="수정하기 취소" onclick="goBack();"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>













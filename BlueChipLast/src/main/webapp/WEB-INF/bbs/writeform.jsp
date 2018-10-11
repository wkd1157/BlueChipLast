<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>글쓰기</title>
	</head> 
	<body>
		<form action="write.idol" method="post"  class="form-inline">
		<table class="table table-striped" style="width:400px; margin:0 auto;">
			<tr>
				<th style="width: 100px;">작성자</th>
				<td style="width: 200px;">
					<input type="text" name="writer" class="form-control"
					required="required">
				</td>
			</tr>
			<tr>
				<th style="width: 100px;">제목</th>
				<td style="width: 200px;">
					<input type="text" name="subject" class="form-control"
					required="required">
				</td>
			</tr>
			<tr>
				<td stlye="width:200px;" colspan="2">
					<textarea style="width:350px; height:150px;" name="content" class="form-control"
					required="required"></textarea>
				</td>
			</tr>
			<tr>
				<th style="width:150px;">사진업로드</th>
				<td style="width:200px;">
					<input type="button" id="btnadd" value="사진추가">
					<div id="imgarea"></div>
				</td>
			</tr>
			<tr>
				<th style="width: 100px;">비밀번호</th>
				<td style="width: 200px;">
					<input type="text" name="pass" class="form-control"
					required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="게시글 저장" class="form-control">
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>

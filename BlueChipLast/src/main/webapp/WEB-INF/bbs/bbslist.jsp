<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>

<head>
<title>게시판</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<c:set var="root" value="<%=request.getContextPath()%>" />
</head>

	<body>
	<table style="width:700px; margin:0 auto;" class="table table-hover">
		<thead>
			<tr>
				<th style="width: 60px;">번호</th>
				<th style="width: 250px; text-align:center;">제목</th>
				<th style="width: 80px;">작성자</th>
				<th style="width: 70px;">조회수</th>
				<th style="width: 100px;">작성일</th>
			</tr>
		</thead>
		<tbody><!--여러번 선언 가능 -->
		<c:forEach var="dto" items="${list}">
		<tr>
				<td align="center">${no}</td>
				<c:set var="no" value="${no-1}"/>
				<td align="left">
				<!-- 제목 출력부분 수정: 댓글 갯수 출력하기 -->
					<a href="content.idol?num=${dto.num}&pageNum=${currentPage}">
					<c:forTokens var="s" items="${dto.subject}" delims=":" varStatus="i">
						<c:if test="${i.count==1}">${s}</c:if> <!-- 제목 출력 -->
						<c:if test="${i.count==2 and s>0}">
							<span  style="color:red;">(${s})</span><!-- 댓글 갯수 출력 -->
						</c:if>
					</c:forTokens></a>
				</td>
				<td algin="center">${dto.writer}</td>
				<td algin="center">${dto.readcount}</td>
				<td algin="center">
					<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		<input type="button" value="글쓰기" class="btn btn-sm btn-info"
		  style="margin-left: 550px;"
		  onclick="location.href='writeform.idol'">
		  
		  <!-- 페이징 처리 -->
		  <table style="margin:0 auto;">
		  <tr>
		  	<td align="center">
		  		<ul class="pagination">
		  		<c:if test="${startPage>1}">
		  			<li><a href="bbslist.idol?pageNum=${startPage-1}">이전</a></li>
		  		</c:if>
		  		<c:forEach var="pg" begin="${startPage}" end="${endPage}">
		  			<c:if test="${currentPage==pg}">
		  				<li><a href="bbslist.idol?pageNum=${pg}" style="color:red;">${pg}</a></li>
		  			</c:if>
		  			<c:if test="${currentPage!=pg}">
		  				<li><a href="bbslist.idol?pageNum=${pg}" style="color:black;">${pg}</a></li>
		  			</c:if>
		  		</c:forEach>
		  		
		  		<c:if test="${endPage<totalPage}">
		  			<li><a href="bbslist.idol?pageNum=${endPage+1}">다음</a></li>
		  		</c:if>
		  		</ul>
		  		</td>
		  </tr>
		  </table>
	
	</body>
</html>
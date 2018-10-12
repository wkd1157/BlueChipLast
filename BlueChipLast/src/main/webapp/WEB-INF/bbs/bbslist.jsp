<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>

<head>
<title>게시판</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<c:set var="root" value="<%=request.getContextPath()%>" />
<script type="text/javascript">
$(function(){
	$("#email123").click(function(){
		kakaologin=localStorage.key1;
		//alert(kakaologin)
		if(kakaologin==null || kakaologin.length==0||kakaologin=='undefined'){
			alert("로그인을 먼저 해주세요")
			return false;
		}
		location.href='writeform.idol';
		return true;
	});
});
</script>
</head>

	<body>
	<table style="width:95%; margin:0 auto;" class="table table-hover">
		<thead>
			<tr>
				<th style="width: 10%;">번호</th>
				<th style="width: 40%; text-align:center;">제목</th>
				<th style="width: 15%;">작성자</th>
				<th style="width: 10%;">조회수</th>
				<th style="width: 25%;">작성일</th>
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
		<tr><td align="right" colspan="5" style="background:white">	
		<input type="button" id="email123" value="글쓰기">		
		
				</td></tr>
		</table>
		
		  
		  <!-- 페이징 처리 -->
		  <table style="width:95%; margin:0 auto;">
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
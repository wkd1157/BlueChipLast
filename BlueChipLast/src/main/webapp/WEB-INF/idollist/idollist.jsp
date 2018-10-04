<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>

<head>
<title>Idol-Group-Ranking</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<c:set var="root" value="<%=request.getContextPath()%>" />
</head>

<body>

	<!-- Section -->
	<section>
		<header class="major">
			<h2>List-ALL &nbsp;&nbsp;(<b style="color: red;">${pageNum}</b> / ${totalPage})Page</h2> 
		</header>

		<div class="posts">
			<c:forEach var="a" begin="0" end="8">

				<article>
					<a href="idolHome.idol?koreanname=${PPList[a].koreanname}"
						class="image"> <img style="height: 250px;"
						src=<c:if test = "${PPList[a].ppurl==null}">"${root}/image/noimg.jpg"</c:if>"${PPList[a].ppurl}">
					</a>
					<h3 class="align-center">
						<b>${(a+1)+(9*(pageNum-1))}</b>. ${IMList[a].globalname}
					</h3>
					<p class="align-center">
						<b>Korean Name</b> : ${IMList[a].koreanname}<br>
						<b>ENT</b> :
						<c:if test="${IMList[a].entertainment == null}">
							 No Data
						</c:if>
						${IMList[a].entertainment}<br>
						<b>DebutYear</b> : ${IMList[a].debutyear}
					</p>
					<div class="align-center"><a href="idolHome.idol?koreanname=${PPList[a].koreanname}" class="button">More</a></div>			
				</article>
			</c:forEach>
		</div>
		<br>
		<ul class="pagination" style="width: 100%; text-align: center;">
			<c:if test="${startPage == 1}">
				<!-- 첫페이지가 1보다 크면 1페이지가 아니니까 이전버튼 활성화 -->
				<li><a href="idolList.idol?pageNum=${startPage-1}"
					class="button disabled"> Prev</a></li>
			</c:if>
			<c:if test="${startPage > 1}">
				<!-- 첫페이지가 1보다 크면 1페이지가 아니니까 이전버튼 활성화 -->
				<li><a href="idolList.idol?pageNum=${startPage-1}"
					class="button">Prev</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">		
				<%-- <li><a href="idolList.idol?pageNum=${i}" class= <c:if test="${pageNum!=i}">"page"</c:if>"page active">${i}</a></li> --%>
				<li><a href="idolList.idol?pageNum=${i}" class="page">${i}</a></li>
			</c:forEach>
			<c:if test="${endPage < totalPage}">
				<li><a href="idolList.idol?pageNum=${endPage+1}" class="button">
						Next</a></li>
			</c:if>
			<c:if test="${endPage == totalPage}">
				<li><a href="idolList.idol?pageNum=${endPage+1}"
					class="button disabled"> Next</a></li>
			</c:if>
		</ul>
		
	</section>
</body>
</html>
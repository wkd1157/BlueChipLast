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
			<h2>Search Result</h2>
		</header>

		<div class="posts">
			
			<c:forEach var="a" items ="${PPList}" varStatus="i">
							
				<article>
					<a href="idolHome.idol?koreanname=${a.koreanname}"
						class="image"> <img style="height: 250px;"
						src=<c:if test = "${a.ppurl==null}">"${root}/image/noimg.jpg"</c:if>"${a.ppurl}">
					</a>
					<h3>
						<a href="idolHome.idol?koreanname=${a.koreanname}">${IMList[i.index].globalname}</a>
					</h3>
					<p>
						<b>Korean Name</b> : ${IMList[i.index].koreanname}<br>
						<b>ENT</b> :
						<c:if test="${IMList[i.index].entertainment == null}">
							 No Data
						</c:if>
						${IMList[i.index].entertainment}<br>
						<b>DebutYear</b> : ${IMList[i.index].debutyear}
					</p>
					<ul class="actions">
						<li><a href="idolHome.idol?koreanname=${a.koreanname}" class="button">More</a></li>
					</ul>
				</article>
			</c:forEach>
		</div>
		
	</section>
</body>
</html>
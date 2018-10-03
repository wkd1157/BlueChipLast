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

	<!-- Banner -->
	<section id="banner">
		<div class="content">
			<header>
				<h1>${IMDto.globalname}</h1>
				<p>Profile</p>
			</header>
			<p>
				<c:if test="${IMDto.koreanname != null}">
					<b>KoreanName</b> : ${IMDto.koreanname}<br>
				</c:if>
				<c:if test="${IMDto.debutalbum != null}">
					<b>DebutAlbum</b> : ${IMDto.debutalbum}<br>
				</c:if>
				<c:if test="${IMDto.members != null}">
					<b>Member</b> : ${IMDto.members}<br>
				</c:if>
				<c:if test="${IMDto.leader != null}">
					<b>Leader</b> : ${IMDto.leader}<br>
				</c:if>
				<c:if test="${IMDto.entertainment != null}">
					<b>Entertainment</b> : ${IMDto.entertainment}<br>
				</c:if>
				<c:if test="${IMDto.mainprize != null}">
					<b>MainPrize</b> : ${IMDto.mainprize}<br>
				</c:if>
				<c:if test="${IMDto.breakyear != null}">
					<b>BreakYear</b> : ${IMDto.breakyear}<br>
				</c:if>
			</p>
			<ul class="actions">
				<li><a href="#" class="button big">Learn More</a></li>
			</ul>
		</div>
		<span class="image object"> <img src="${PPDto.ppurl}" alt="" />
		</span>
	</section>

	<!-- Section 1 -->
	<section>
		<header class="major">
			<h2>YouTube Top 9</h2>
		</header>
		<div class="posts">
			<c:forEach var="a" begin="0" end="8">

				<article>

					<iframe style="align-items: center;" width="350" height="250"
						src="https://www.youtube.com/embed/${IYList[a].yturl.split('=')[1]}"
						frameborder="0" allowfullscreen></iframe>
					<br> <a href="${IYList[a].yturl}">${IYList[a].yttitle}</a>


					<ul class="actions">
						<li><a href="${IYList[a].yturl}" class="button">YouTube</a></li>
					</ul>
				</article>
			</c:forEach>
		</div>
	</section>
	
	<!-- Section 2 -->
	<section>
		<header class="major">
			<h2>RealTime Daum News 9</h2>
		</header>
		<div class="posts">
			<c:forEach var="a" begin="0" end="8" varStatus="i">
				<c:set var="title" value="${list[a]}" />

				<article>
					<%-- <a class="image"><img style="height: 250px;"
									src="${list[20+a]}"></a> --%>

					<p>
						<b>${title}<br></b> ${list[20+a]}
					</p>

					<ul class="actions">
						<li><a href="${list[10+a]}" class="button">More</a></li>
					</ul>
				</article>
			</c:forEach>
		</div>
	</section>

</body>
</html>
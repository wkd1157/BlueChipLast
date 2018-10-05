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
			<!-- <ul class="actions">
				<li><a href="#" class="button big">Learn More</a></li>
			</ul> -->
		</div>
		<span class="image object"> <img src="${PPDto.ppurl}" alt="" />
		</span>
	</section>

	<!-- Section 1 -->
	<section id="youtube">
		<header class="major">
			<h2>YouTube Top 9</h2>
		</header>
		<div class="posts">
			<c:forEach var="a" begin="0" end="8">

				<article>
				<div class="align-center">
					<iframe width="350" height="250"
						src="https://www.youtube.com/embed/${IYList[a].yturl.split('=')[1]}"
						frameborder="0" allowfullscreen></iframe></div>
					<br>
					<p><b>${IYList[a].yttitle}</b></p>
					
					<div class="align-center"> <a href="${IYList[a].yturl}" class="button">YouTube</a></div>
				</article>
			</c:forEach>
		</div>
	</section>
	
	<!-- Section 2 -->
	<section id="news">
		<header class="major">
			<h2>RealTime Daum News 9</h2>
		</header>
		<%-- <div class="posts">
			<c:forEach var="a" begin="0" end="8" varStatus="i">
				<c:set var="title" value="${list[a]}" />

				<article>
					<a class="image"><img style="height: 250px;"
									src="${list[20+a]}"></a>

					<p>
						<b>${title}<br></b> ${list[20+a]}
					</p>

					<ul class="actions">
						<li><a href="${list[10+a]}" class="button">More</a></li>
					</ul>
				</article>
			</c:forEach>
		</div> --%>
		<div class="row">
			<c:forEach var="a" begin="0" end="8" varStatus="i">
			<c:set var="title" value="${getDaumNews[a]}" />
			<div class="col-4 col-12-medium">
				<div><b>${title}</b><br><br></div>
				<blockquote>${getDaumNews[20+a]} <div class="align-right"><a href="${getDaumNews[10+a]}" class="button small">More</a></div></blockquote>		
				
			</div>
			</c:forEach>
		</div>
		
	</section>

	<section id="photo">
		<header class="major">
			<h2>Insta Photo</h2>
		</header>
		<div class="posts">
			<c:forEach var="str" items="${getInstaPhoto}" varStatus="i">
				<article>
					<c:forTokens var="data" items="${str}" delims="|" varStatus="n">
						<c:if test="${n.count==1}">
							<a href="${data}" class="image"> <img src="${data}"
								style="height: 250px;">
							</a>
						</c:if>
						<c:if test="${n.count==2}">
							<p>${data}</p>
						</c:if>
					</c:forTokens>
				</article>
			</c:forEach>
		</div>
	</section>


</body>
</html>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>

<head>
	<title>Idol-Group-Ranking</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<c:set var="root" value="<%=request.getContextPath()%>"/>
	
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script type="text/javascript">
	
	
		$(function() {
			$("#btnSearch").click(function() {
				if ($("#category").val() == 0)
					alert("Category를 선택하세요");

				else if ($("#category").val() == 1) {
					name = "%25" + $("#query").val() + "%25";
					if (name == "%25%25")
						alert("검색어를 입력해주세요");
					else {
						var url = "${root}/idolNameSearch.idol?name=" + name;
						window.location.href = url;
					}
				}

				else if ($("#category").val() == 2) {
					name = "%25" + $("#query").val() + "%25";
					if (name == "%25%25")
						alert("검색어를 입력해주세요");
					else {
						var url = "${root}/idolEntSearch.idol?name=" + name;
						window.location.href = url;
					}
				}

				else {
					name = "%25" + $("#query").val() + "%25";
					if (name == "%25%25")
						alert("검색어를 입력해주세요");
					else {
						var url = "${root}/idolDebutYearSearch.idol?name=" + name;
						window.location.href = url;
					}
				}

			});
		});
	</script>

</head>
<body>


	<!-- Search -->
	<section>
	<div class="col-12">
			<select name="category" id="category">
				<option value="0">- Category -</option>
				<option value="1">Korean&Global Name</option>
				<option value="2">Entertainment</option>
				<option value="3">DebutYear</option>
			</select>
			</div>
		 
			<input type="text" name="query" id="query"
				placeholder="Input Text"> <br> 
			<div class="align-center"><a class="button primary icon fa-search" id="btnSearch">Search</a></div>
	
	
	</section>

	<!-- Menu -->
		<nav id="menu">
			<header class="major">
				<h2>Menu</h2>
			</header>
			<ul>
				<li><a href="main.idol">MainPage</a></li>
				<li><a href="idolList.idol">IdolGroup</a></li>
				<li><span class="opener">IdolHome</span>
					<ul>
						<li><a href="#youtube">Go~YouTube!</a></li>
						<li><a href="#news">Go~News!</a></li>
						<li><a href="#photo">Go~Photo!</a></li>
						
					</ul></li>
				<li><a href="bbslist.idol">자유 게시판</a></li> 
			</ul>
		</nav>



		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">
				&copy; Untitled. All rights reserved. Demo Images: <a
					href="https://unsplash.com">Unsplash</a>. Design: <a
					href="https://html5up.net">HTML5 UP</a>.
			</p>
		</footer>

	
</body>
</html>











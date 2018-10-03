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
	<a href="main.idol" class="logo"><strong>Idol-Group</strong>
		Ranking Site</a>

	<ul class="icons">
		<li><strong>Log-In</strong></li>
		<li><a href="#" class="icon fa-google"><span class="label">Google</span></a></li>
		<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
		<li><a href="#" class="content"><strong>Naver</strong></a></li>
	</ul>
</body>
</html>
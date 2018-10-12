<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>내용</title>
		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	</head> 
	<body>
		<script type="text/javascript">
		$(function(){
			$("#email111").click(function(){
				kakaologin=localStorage.key1;
				//alert(kakaologin)
				if(kakaologin==null || kakaologin.length==0||kakaologin=='undefined'){
					alert("로그인을 먼저 해주세요")
					
					return false;
				}
				location.href='updateform.idol?num=${dto.num}&pageNum=${pageNum}'
				return true;
			});
		});
		
		$(function(){
			$("#email112").click(function(){
				kakaologin=localStorage.key1;
				//alert(kakaologin)
				if(kakaologin==null || kakaologin.length==0||kakaologin=='undefined'){
					alert("로그인을 먼저 해주세요")
					
					return false;
				}
				location.href='delete.idol?num=${dto.num}&pageNum=${pageNum}'
				return true;
			});
		});
		
		$(function(){
			id=localStorage.getItem("key1");
			id=id.replace("님 환영합니다","");
			/* alert(id); */
			$("#myid").text(id);
			
		});
</script>
		<table class="table table-bordered" style="width:80%; margin:0 auto;">
			<caption><b>게시글 확인</b></caption>
			<tr>
				<td>
					<b>작성자:${dto.writer}</b>
					(<span style="font-size:9pt; color:#ccc;">작성일:
					<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
					</span>)
				</td>
			</tr>
			<tr>
				<td style="text-align:left;">제목: ${dto.subject}</td>
			</tr>
			<tr height="300" valign="top">
				<td style="text-align:left;">
					<pre>${dto.content}</pre>
					<%-- <br>
					<b style="cursor:pointer;" id="acount">댓글 ${acount}</b><br>
					<answer style="padding-left:20px;">
						<c:forEach var="a" items="${alist}">
							<b style="padding-left:20px; font-size:10pt;">${a.nickname}</b>: ${a.content}&nbsp;&nbsp;
							<span style="font-size:9pt; color:#ccc;">
								<fmt:formatDate value="${a.writeday}" pattern="yyyy-MM-dd HH:mm"/><br>
							</span>
						</c:forEach>
					</answer> --%>
				</td>
			</tr>
			
			<%-- <!-- 댓글 폼  -->
			<tr>
				<td align="left">
					<form action="answer.idol" method="post" class="form-inline">
						<div class="form-group">
						<span id="myid"></span>
						<input type="text" name="content" style="width:320pl;" placeholder="댓글쓰기">
						
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="pageNum" value="${pageNum}">
						
						<input type="submit" value="저장" class="btn btn-xs btn-default">
						</div>
					</form>
				</td>
			</tr> --%>
			<tr>
				<td align="right">
					<input type="button" class="btn btn-sm btn-success" id="email111" value="수정" 
					>
					
					<input type="button" class="btn btn-sm btn-warning" id="email112" value="삭제" 
					>
					
					<input type="button" class="btn btn-sm btn-danger" value="목록" 
					onclick="location.href='bbslist.idol?pageNum=${pageNum}'"> 
				</td>
			</tr>
		</table>
		
	</body>
</html>
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

	
	<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
 
<div id="kakao_btn_changed">
<a href="javascript:loginWithKakao()">
<img src="/BlueChipLast/image/klogin.PNG" width="200"></a>
</div>
 
 

<script>
var kname=localStorage.getItem("key1");
console.log(localStorage.getItem("key1"));
console.log(kname);
//로그인 및 로그아웃 버튼 생성 처리
var cookiedata = document.cookie;
if(cookiedata.indexOf('kakao_login=done') < 0){
    createLoginKakao();
}else{
    createLogoutKakao();
}

			/* 로그인 관련 쿠키 생성 및 삭제 */
			function setCookie( name , value , expired ){
			 
			 var date = new Date();
			 date.setHours(date.getHours() + expired);
			 var expried_set = "expries="+date.toGMTString();
			 document.cookie = name + "=" + value + "; path=/;" + expried_set + ";"
			 
			}
			
			
			function getCookie(name){
				 
			    var nameofCookie = name + "=";
			    var x = 0;
			    while(x <= document.cookie.length){
			        var y = ( x + nameofCookie.length);
			        if(document.cookie.substring(x,y) == nameofCookie){
			            if((endofCookie = document.cookie.indexOf(";",y)) == -1)
			                endofCookie = document.cookie.length;
			            return unescape(document.cookie.substring(y,endofCookie));
			        }
			        x = document.cookie.indexOf(" ",x) + 1;
			        if( x == 0 )
			            break;
			        }
			        
			        return "";
			}
			
			 // 사용할 앱의 JavaScript 키를 설정
		    Kakao.init('cd216f0edc63ab928c283e541d5c9286');  
			
		 // 로그인 처리
		    function loginWithKakao(){
		        
		        Kakao.Auth.cleanup(); 
		        Kakao.Auth.loginForm({
		            persistAccessToken: true,
		            persistRefreshToken: true,
		            success: function(authObj) {
		               Kakao.API.request({
		                  url:'/v1/user/me',
		                  success: function(res){
		                	 /*  alert(JSON.stringify(res));

		                      alert(JSON.stringify(authObj));
		                      console.log(res.id);   
		                      console.log(res.kaccount_email);
		                      console.log(res.properties['nickname']);
		                      console.log(authObj.access_token);  //id, email, nickname, token  */
		                      
		                      setCookie("kakao_login","done",1); // 쿠키생성 (로그인)
		                      //console.log(JSON.stringify(res));
		                      createLogoutKakao();
		                      //window.location.href="../login.com";
		                      localStorage.setItem("key1", res.properties.nickname+"님 환영합니다"); 
		                      //localStorage.key1=res.properties.nickname;
		                      //console.log(res.properties.nickname);
		                      //console.log(localStorage.getItem("key1"));
		                      getKey();

		            },
		            fail: function(error){
		                alert(JSON.stringify(error));
		             }
		             });
		             },
		                 fail: function(err) {
		                  alert(JSON.stringify(err));
		             }
		                      
		         });
		     }
		    

		     // 로그아웃 처리
		        function logoutWithKakao(){
		            Kakao.Auth.logout();
		            alert('카카오 로그아웃 완료!');
		            setCookie("kakao_login","",-1);  // 쿠키삭제 (로그아웃)
		            //deleteCookie( "kakao_login" ); 쿠키삭제 다른 방법
		            createLoginKakao();
		            localStorage.removeItem("key1");
		            getKey();
		            location.href="main.idol";
		        }
		        
			
		     // 로그인 버튼생성
		        function createLoginKakao(){
		         var login_btn = "<a href='javascript:loginWithKakao()'>"+
		                        "<img src='/BlueChipLast/image/klogin.PNG' width='200'/></a>";
		         document.getElementById('kakao_btn_changed').innerHTML  = login_btn;
		        }
		         
		         
		        // 로그아웃 버튼생성
		        function createLogoutKakao(){
		         var logout_btn = "<a id='custom-logout-btn' href='javascript:logoutWithKakao()'>"+
		                        "<img src='/BlueChipLast/image/klogout.PNG' width='200'/></a>";
		         document.getElementById('kakao_btn_changed').innerHTML  = logout_btn;
		         
		        }
		      
				       
		      function getKey()
		      {
		    	  if(localStorage.key1==null || localStorage.key1=='undefined')
		    		  document.getElementById("kakao-name").innerText="";
		    	  else
		    	  	document.getElementById("kakao-name").innerText=localStorage.key1;
		      }
		        </script>
		        
		    
	<div id="kakao-name"></div>
</body>
</html>
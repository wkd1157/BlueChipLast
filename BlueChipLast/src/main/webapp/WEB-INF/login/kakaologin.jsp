<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

      <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
      <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<title>카카오 로그인</title>
	<c:set var="root" value="<%=request.getContextPath()%>"/>

	</script>
</head> 
<body>
<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
 
<div id="kakao_btn_changed">
<a href="javascript:loginWithKakao()">
<img src="${root}/image/kakaologin.png" width="200px"></a>
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
		        }
		        
			
		     // 로그인 버튼생성
		        function createLoginKakao(){
		         var login_btn = "<a href='javascript:loginWithKakao()'>"+
		                        "<img src='../image/kakaologin.png' width='200'/></a>";
		         document.getElementById('kakao_btn_changed').innerHTML  = login_btn;
		        }
		         
		         
		        // 로그아웃 버튼생성
		        function createLogoutKakao(){
		         var logout_btn = "<a id='custom-logout-btn' href='javascript:logoutWithKakao()'>"+
		                        "<img src='../image/kakaologout.png' width='200'/></a>";
		         document.getElementById('kakao_btn_changed').innerHTML  = logout_btn;
		         
		        }
		      
			
		       $(function(){
		        		getKey();
		        	 });
		       
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

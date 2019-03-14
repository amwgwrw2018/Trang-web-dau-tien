<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html itemscope itemtype="http://schema.org/Article">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<meta name="google-signin-client_id"
	content="205325160919-1g3c3l3agrjfqd7e61ftfh543l27i3rf.apps.googleusercontent.com">




<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
<link rel="stylesheet" href="lib/css/bootstrap.min.css">
<link rel="stylesheet" href="lib/css/bootstrap-theme.min.css">
<script src="lib/jquery-3.2.0.min.js"></script>
<script src="lib/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="cssQuanTrong.css">
<link rel="stylesheet" type="text/css" href="carousel.css">
<script src="lib/jquery.carouFredSel-6.1.0-packed.js"
	type="text/javascript"></script>

<script src="lib/javaScriptQuanTrong.js"></script>
<script src="lib/carousel.js"></script>
<link rel="stylesheet" type="text/css" href="FormCss.css">
<link rel="stylesheet" type="text/css"
	href="facebookAndGoogleButton.css">

</head>

<body>
	<script>
		window.fbAsyncInit = function() {
			FB.init({
				appId : '435417870144786',
				cookie : true,

				xfbml : true,
				version : 'v2.8'
			});

		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
	
	</script>
	<div id="divForEachParts">
		<jsp:include page="menu.jsp" />
		<div class="container">
			<%
				if (request.getAttribute("success") != null) {
			%>

			<h2 style="color: red;">
				<strong><%=(String) request.getAttribute("success")%></strong>
			</h2>

			<%
				}
			%>
			<form id="contact" action="XuLyKhachHangDangNhap" method="post">
				<h3>
					<fmt:message key="DangNhap" />
					:
				</h3>
				<fieldset>
					<input type="text" id="user" name="user" placeholder="Username"
						<%if (request.getParameter("user") != null) {%>
						value="<%=request.getParameter("user")%>" <%}%>>
					<%
						if (request.getAttribute("userError") != null) {
					%>
					<h4 style="color: red;"><%=(String) request.getAttribute("userError")%></h4>
					<%
						}
					%>
				</fieldset>
				<fieldset>
					<input type="password" id="pass" name="pass" placeholder="Password">
					<%
						if (request.getAttribute("passError") != null) {
					%>
					<h4 style="color: red;"><%=(String) request.getAttribute("passError")%></h4>
					<%
						}
					%>
				</fieldset>
				<fieldset>
					<button type="submit" value="Login" id="contact-submit">
						<fmt:message key="DangNhap" />
					</button>
				</fieldset>
				<%
					if (request.getAttribute("AccountNotExist") != null) {
				%>
				<h3 style="color: red;"><%=(String) request.getAttribute("AccountNotExist")%></h3>
				<%
					}
				%>
			</form>


			<form id="facebooklogin" action="FaceBookServlet" method="post" style="display: none;">
<input type="text" name="faceID" id="faceID">
<input type="text" name="faceName" id="faceName">
<input type="text" name="faceGender" id="faceGender">
			</form>

			<button class="loginBtn loginBtn--facebook" onclick="login()">
				Login with Facebook</button>

			<div class="g-signin2" data-onsuccess="onSignIn"></div>

			<form action="GoogleEmailServlet" method="post" id="googleLoginForm">
				<input type="hidden" name="userId" id="userid"> <input
					type="hidden" name="name" id="name">
			</form>
			<h2>
				<a href="ForgetPassword.jsp" style="color: red;">Quên Mật Khẩu?</a>
			</h2>
			<h2 style="color: yellow;">
				Chưa Có Tài Khoản?<a style="color: red;" href="dangKy.jsp">Đăng
					Ký</a>
			</h2>
		</div>
	</div>



	<script>
		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {

			});
		}
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();

			$("#userid").val(profile.getId());
			$("#name").val(profile.getName());
			signOut();
			document.getElementById('googleLoginForm').submit();
			
		}
		
		 function login(){
			  FB.login(function(response) {
				  FB.api('/me', function(response) {
				
					     $("#faceID").val(response.id);
					     $("#faceName").val(response.name);
					   
					    logout();
					 	document.getElementById('facebooklogin').submit();
					  
					     });
				});
		  }
		function logout(){
			  FB.logout(function(response) {
				  
				});
		}
	</script>


</body>
</html>

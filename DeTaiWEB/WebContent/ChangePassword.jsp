<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
  <link rel="stylesheet" href="lib/css/bootstrap.min.css">
  <link rel="stylesheet"  href="lib/css/bootstrap-theme.min.css"> 
  <script src="lib/jquery-3.2.0.min.js"></script>
  <script src="lib/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="cssQuanTrong.css">
  <link rel="stylesheet" type="text/css" href="carousel.css">
  <script src="lib/jquery.carouFredSel-6.1.0-packed.js" type="text/javascript"></script>

    <script src="lib/javaScriptQuanTrong.js"></script>
    <script src="lib/carousel.js"></script>
 <link rel="stylesheet" type="text/css" href="FormCss.css">
   
</head>

<body>
<div id="divForEachParts">
<jsp:include page="menu.jsp" />
 <div class="container">
 <form id="contact" action="ChangePassword" method="post">
 <h3>Đổi Mật Khẩu:</h3>
 <fieldset>
 <label>Nhập Mật Khẩu Hiện Tại:</label>
 <input type="password" name="pass" required>
 <%if(request.getAttribute("PasswordDoesntMatch")!=null){ %>
 <p style="color: red;"><%=(String)request.getAttribute("PasswordDoesntMatch") %></p>
 <%} %>
 </fieldset>
 <fieldset>
 <label>Nhập Mật Khẩu Mới:</label>
<input type="password" name="newPass" required>
 </fieldset>
 <fieldset>
 <button type="submit" id="contact-submit">Đổi Mật Khẩu</button>
 </fieldset>
<%if(request.getAttribute("changePassSuccess")!=null){ %>
<h2 style="color: red;"><%=(String)request.getAttribute("changePassSuccess") %>,<a href="index.jsp">Quay Lại Trang Chủ?</a></h2>
<%} %>
 </form>

 </div>
</div>
</body>
</html>

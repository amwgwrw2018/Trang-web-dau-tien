<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  

 
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
 <fmt:setBundle basename="CreateUserGUI" scope="session"/> 
<div id="divForEachParts">
<jsp:include page="menu.jsp" />
<div class="container">
<form id="contact" action="ForgetPassword" method="post">
<h3>Lấy Lại Mật Khẩu:</h3>
<fieldset>
<label>Nhập Email Hiện Tại:</label>
<input type="email" name="ForgetPassSendToEmail">
</fieldset>
<fieldset>
 <button type="submit" id="contact-submit">Lấy Lại Mật Khẩu:</button>
</fieldset>
<%if(request.getAttribute("sendEmailSuccess")!=null){ %>
<fieldset>
<h3  style="color: red;"><%=(String)request.getAttribute("sendEmailSuccess") %></h3>
</fieldset>
<%} %>
<%if(request.getAttribute("EmailNotExist")!=null){ %>
<fieldset>
<h3 style="color: red;"><%=(String)request.getAttribute("EmailNotExist") %></h3>
</fieldset>
<%} %>
</form>
</div>
</div>
</body>
</html>
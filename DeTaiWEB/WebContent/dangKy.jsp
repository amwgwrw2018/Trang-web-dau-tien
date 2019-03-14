<%@page import="java.util.Calendar"%>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
     <%@taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>
     
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
    <script src="lib/javaScriptQuanTrong.js"></script>
  <link rel="stylesheet" type="text/css" href="cssQuanTrong.css">
 <script type="text/javascript" src="lib/jquery.validate.min.js"></script>
 
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="FormCss.css">
 
 
</head>
<body>
<%Calendar ca=Calendar.getInstance(); %>
 <fmt:setBundle basename="CreateUserGUI" scope="session"/> 
<div id="divForEachParts">
<jsp:include page="menu.jsp" />
<div class="container">  
  <form id="contact" action="XuLyKhachHangDangKy" method="post">
    <h3><fmt:message key="DangKy" /> </h3>
 
    <fieldset>
    <label>UserName:</label>
      <input  type="text" tabindex="1" name="userName" <%if(request.getParameter("userName")!=null){ %> value="<%=request.getParameter("userName") %>" placeholder="<%=request.getParameter("userName") %>"<%}else{ %> placeholder="Nhập Tên Đăng Nhập(Type Username)" <%} %>>
 <%if(request.getAttribute("errorName")!=null){ %>
 <p style="color: red;"><%=(String)request.getAttribute("errorName") %></p>
 <%} %>
 <%if(request.getAttribute("errorExistUserName")!=null){ %>
 <p style="color: red;"><%=(String)request.getAttribute("errorExistUserName") %></p>
 <%} %>
    </fieldset>
    <fieldset>
    <label><fmt:message key="HoTen" /> </label>
    <input type="text" name="name" <%if(request.getParameter("name")!=null){ %> value="<%=(String)request.getParameter("name") %>" placeholder="<%=(String)request.getParameter("name") %>" <%}else{ %> placeholder="Nhập Họ Tên(Type Your First Name And Last Name)" <%} %>>
    <%if(request.getAttribute("errorHoTen")!=null){ %>
    <p style="color:red;"><%=(String)request.getAttribute("errorHoTen") %></p>
    <%} %>
    </fieldset>
    <fieldset>
  <label><fmt:message key="BirthDay"/> </label>
    
      <select name="day">
    <%for(int i =1;i<=31;i++){ %>
    <option value="<%=i%>" <%if(request.getParameter("day")!=null&&((String)request.getParameter("day")).equals((i+""))){ %> selected  <%} %> ><%=i %></option>
    <%} %>
    </select>
    
    <select name="month">
    <%for(int i =1;i<=12;i++){ %>
    <option  value="<%=i%>" <%if(request.getParameter("month")!=null&&((String)request.getParameter("month")).equals((i+""))){ %> selected  <%} %> ><%=i %></option>
    <%} %>
    </select>
    
    
    
    <select name="year">
    <%for(int i =1990;i<=ca.get(Calendar.YEAR);i++){ %>
    <option value="<%=i%>" <%if(request.getParameter("year")!=null&&((String)request.getParameter("year")).equals((i+""))){ %> selected  <%} %> ><%=i %></option>
    <%} %>
    </select>
    
    </fieldset>
    
    <fieldset>
    <label><fmt:message key="Gender" /> </label><input type="radio" name="gender" value="male" <%if((request.getParameter("gender")!=null&&((String)request.getParameter("gender")).equals("male"))||request.getParameter("gender")==null){ %> checked <%} %>>Nam
    <input type="radio" name="gender" value="female" <%if(request.getParameter("gender")!=null&&((String)request.getParameter("gender")).equals("female")){%> checked <%} %>>Nữ
    </fieldset>
    
    <fieldset>
    <label><fmt:message key="Password" /> :</label>
     <input type="password"  name="pass" tabindex="2">
     <%if(request.getAttribute("errorPass")!=null){ %>
      <p style="color: red;"><%=(String)request.getAttribute("errorPass") %></p>
     <%} %>
    </fieldset>
    
      <fieldset>
    <label><fmt:message key="PasswordAgain" />:</label>
     <input type="password"  name="passre" tabindex="3">
     <%if(request.getAttribute("errorPassre")!=null){ %>
      <p style="color: red;"><%=(String)request.getAttribute("errorPassre") %></p>
     <%} %>
     <%if(request.getAttribute("errorPassNotMatch")!=null){ %>
      <p style="color: red;"><%=(String)request.getAttribute("errorPassNotMatch") %></p>
     <%} %>
    </fieldset> 
    <fieldset>
    <label>Email:</label>
      <input type="email" tabindex="4" name="email" <%if(request.getParameter("email")!=null){ %> value="<%=request.getParameter("email") %>" placeholder="<%=request.getParameter("email") %>"<%}else{ %> placeholder="Email" <%} %>>
      
      <%if(request.getAttribute("errorEmail")!=null){ %>
 <p style="color: red;"><%=(String)request.getAttribute("errorEmail") %></p>
 <%} %>
    </fieldset>
    <fieldset>
    <label><fmt:message key="Phone" /> :</label>
      <input  type="tel" tabindex="5" name="phone" <%if(request.getParameter("phone")!=null){ %> value="<%=request.getParameter("phone") %>" placeholder="<%=request.getParameter("phone") %>"<%}else{ %> placeholder="Số Điện Thoại(Phone Number)" <%} %>>
        <%if(request.getAttribute("errorPhone")!=null){ %>
 <p style="color: red;"><%=(String)request.getAttribute("errorPhone") %></p>
 <%} %>
 <%if(request.getAttribute("outOfIndexPhone")!=null){ %>
 <p style="color: red;"><%=(String)request.getAttribute("outOfIndexPhone") %></p>
 <%} %>
    </fieldset>
<fieldset>
<label><fmt:message key="Address" /> :</label>
<textarea rows="3" cols="2" tabindex="6" name="address" <%if(request.getParameter("address")!=null){ %> value="<%=request.getParameter("address") %>" placeholder="<%=request.getParameter("address") %>"<%} %>></textarea>
<%if(request.getAttribute("errorAddress")!=null){ %>
<p style="color: red;"><%=(String)request.getAttribute("errorAddress") %></p>
<%} %>
</fieldset>


        <fieldset>
          <botDetect:captcha id="capchavvv" 
                                userInputID="captchaCode"
                                codeLength="1"
                                imageWidth="180"
                                imageStyle="GRAFFITI2" />
        </fieldset>        
   
 
   <fieldset>
      
                        <input id="captchaCode" type="text" name="captchaCode" />
                      <%if(request.getAttribute("CaptchaIncorrect")!=null){ %>
                      <p style="color: red;"><%=request.getAttribute("CaptchaIncorrect") %></p>
                      <%} %>
                   
   </fieldset>
    <fieldset>
      <button name="submit" type="submit" id="contact-submit" ><fmt:message key="DangKy" /></button>
    </fieldset>

    <script type="text/javascript" src="lib/validation-rules.js"></script>
  </form>
</div>

   </div>
</body>
</html>
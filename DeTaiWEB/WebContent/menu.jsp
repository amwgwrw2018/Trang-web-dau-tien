    <%@page import="Model.KhachHang"%>
<%@page import="Model.QuanLyKhachHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.MatHang"%>

<%@page import="Model.QuanLyMatHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
a{
background-color: transparent;
}
</style>

<title>Insert title here</title>
</head>
   
<body >

<%request.setCharacterEncoding("UTF-8"); %>
<%response.setCharacterEncoding("UTF-8"); %>
<%	response.setContentType("text/html;charset=UTF-8"); %>
<div id="khungMenu">

<div id="ngonNgu" >
<form action="changeLang" id="viet" method="post">
<input type="hidden" name="lang" value="vi_VN">

</form>
<a onclick="document.getElementById('viet').submit()"> <img src="image/vietnameseFlag.png" width="30" height="20"> Việt Nam</a>
<form action="changeLang" id="eng" method="post">
<input type="hidden" name="lang" value="en_US" >

</form>
<a onclick="document.getElementById('eng').submit()" > <img src="image/englandFlag.jpg" width="30" height="20"> English </a>
</div>

<div style="margin-bottom:20px;margin-top:30px;" id="slogan">
<img src="image/songphat.png"  id="mainLogo" width="195" height="110" >
<img src="image/NameLogo.png" width="907" height="110">
</div>



<nav class="navbar ">

<ul class="nav navbar-nav myList" id="navbaritem">

<li><a href="index.jsp"><img src="image/homePageIcon.png" width="20" height="20"> <fmt:message key="TrangChu" /></a></li>

<li><a href="GioiThieu.jsp"><fmt:message key="GioiThieu" /></a></li>
<li><a href="lienHe.jsp"><fmt:message key="LienHe" /></a></li>
</ul>


<ul class="nav navbar-nav navbar-right myList">



</li>
<%if(session.getAttribute("customer")==null){ %>
<li id="formDangKy" ><a href="dangKy.jsp"><img src="image/signUpIcon.png" width="20" height="20">  <fmt:message key="DangKy" /></a>


</li>
<li id="formDangNhap" ><a href="login.jsp"><img src="image/loginIcon.png" width="20" height="20">  <fmt:message key="DangNhap" /></a></li>

<%}else{ %>
<%if((session.getAttribute("isAdmin")!=null)&&((boolean)(session.getAttribute("isAdmin")))){ %>
<li><a href="AdminControlProduct.jsp"><img src="image/wheel.png" width="20" height="20">  <fmt:message key="databaseManage"/> </a></li>
<%} %>

<li class="dropdown">

<a data-toggle="dropdown" ><fmt:message key="Hello"/> <%=(String)session.getAttribute("customer") %><span  class="glyphicon glyphicon-triangle-bottom"></span></a>


<div class="dropdown-menu" style="color:black;">
<table>

<%if(session.getAttribute("LoginWithGoogleOrFacebook")==null){ %>
<tr><td><a href="ChangePassword.jsp"><fmt:message key="changePass"/></a><br></td></tr>
<%} %>
<tr><td><a href="XuLyKhachHangDangXuat"> <fmt:message key="logout"/> </a></td></tr>
</table>
</div>

</li>
<%} %>










<li>
<form class="navbar-form" action="XuLyMatHangMuonTim" method="post">
<div class="input-group">
<input type="text" name="matHangMuonTim" class="form-control" required>

<div class="input-group-btn">
<button type="submit" class="btn btn-outline-success">SEARCH<i class="glyphicon glyphicon-search"></i></button>

</div>
</div>
</form>
</li>
</ul>
</nav>


</div>

<%if(session.getAttribute("customer")!=null&&session.getAttribute("listProductOrder")!=null){ %>
<%ArrayList<MatHang> listProductOrder=(ArrayList<MatHang>)session.getAttribute("listProductOrder"); %>
<div id="gioHang">
<button class="btn" style="width: 200px; background: #10edd7;" id="nutGioHang">
<strong><fmt:message key="cart"/>(<%=listProductOrder.size() %>) </strong></button>
<div id="listGioHang" >
<table class="table table-bordered" style="width: 600px;">
<tr>
<th>Ảnh</th>
<th>Tên Sản Phẩm:</th>
<th>Số Lượng Mua</th>
<th>Thao Tác</th>
</tr>
<%for(int i =0;i<listProductOrder.size();i++){ %>
<tr>
<td><img alt="" src="<%= listProductOrder.get(i).getDuongDan()%>" width="30" height="30"></td>
<td><span><%=listProductOrder.get(i).getTen() %></span></td>
<td><span>Số lượng: <%=listProductOrder.get(i).getSoLuongDatHang() %> Món</span></td>
<td>
<form action="ChangeNumberOfOrderedProduct" method="post" style="float:left;margin-left:5px;">
<input type="hidden" name="index" value="<%=i%>">
<input type="number" name="soLuongMua" min="1" max="<%=listProductOrder.get(i).getSoLuongConLai()%>" value="<%=listProductOrder.get(i).getSoLuongDatHang()%>">
<input type="hidden" name="redirectLocation" value="yes">
<input type="submit" class="btn"  style="background:#07b5ef;" value="Thay Đổi">
</form>
<form action="XoaSanPham" method="post" style="float:left;margin-left:5px;">
<input type="hidden" name="index" value="<%=i%>">
<input type="hidden" name="redirectLocation" value="yes">
<button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button>
</form>

</td>
</tr>

<%} %>
</table>
<%if(listProductOrder.size()!=0){ %>
<a href="thanhToan.jsp" class="btn" style="background:#07b5ef;color:white;float: right;"><fmt:message key="pay"/></a>
<%} %>
</div>
</div>
<% }%>

</body>
</html>
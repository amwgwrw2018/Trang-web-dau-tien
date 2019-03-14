<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-inverse">
 <div class="container-fluid">
	<ul class="nav navbar-nav">
		  <li><a href="index.jsp">Trang Chủ</a></li>
      <li><a href="AdminControlProduct.jsp">Quản Lý Mặt Hàng</a></li>
      <li><a href="AdminControlAccount.jsp">Quản Lý Khách Hàng</a></li>
      <li><a href="AdminControlBill.jsp">Quản Lý Hóa Đơn Hiện Có</a></li>
           <li><a href="AdminControlOrder.jsp">Quản Lý Đơn Hàng </a></li>

	</ul>
<ul class="nav navbar-nav navbar-right">
  <li class="dropdown">
<a href="#" data-toggle="dropdown"><span class="glyphicon glyphicon-log-in"></span> Xin Chào <%=(String)session.getAttribute("customer") %></a>
<ul class="dropdown-menu">

    <li><a href="XuLyKhachHangDangXuat"><span class=" glyphicon glyphicon-off"></span> Đăng Xuất</a></li>
</ul>

</li>
</ul>
</div>

</nav>
</body>
</html>
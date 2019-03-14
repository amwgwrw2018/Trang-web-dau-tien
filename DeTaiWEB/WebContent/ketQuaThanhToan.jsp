<%@page import="Model.FormatNumber"%>
<%@page import="java.util.Calendar"%>
<%@page import="Model.MatHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
  <link rel="stylesheet" href="lib/css/bootstrap.min.css">
  <link rel="stylesheet"  href="lib/css/bootstrap-theme.min.css"> 
  <script src="lib/jquery-3.2.0.min.js"></script>
  <script src="lib/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="cssQuanTrong.css">
    <script src="lib/javaScriptQuanTrong.js"></script>
  <style type="text/css">
  #khungHoaDon{
  margin: 0 auto;
  }
  </style>
</head>
<body>

<%ArrayList<MatHang> listProductOrder=(ArrayList<MatHang>)session.getAttribute("listProductOrder"); 
FormatNumber format=new FormatNumber();
%>
<div id="divForEachParts">
<jsp:include page="menu.jsp" />

<div class="container" style="margin-top:20px;">
<div class="alert alert-success">
  <strong>Thanh Toán Thành Công!</strong>  Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất,cảm ơn bạn đã tin tưởng và mua hàng tại trang web chúng tôi
</div>
<form action="XuatExcel" method="get" enctype="multipart/form-data">
<input type="submit" value="Xuất Ra Excel" class="btn btn-success">

</form>
<table class="table table-bordered" style="width: 1200px;margin:0 auto;">
<tr style="background-color: #07b5ef;"><td><h1>THÔNG TIN HÓA ĐƠN</h1></td></tr>
<tr><td><h4>Người Mua Hàng: <%=session.getAttribute("name") %></h4></td></tr>
<tr><td><h4>Số Điện Thoại:<%=session.getAttribute("phone") %></h4></td></tr>

<tr><td><h4>Địa Chỉ Người Mua:<%=(String)session.getAttribute("diachi") %></h4></td></tr>
<tr><td><h4>Sản Phẩm Đặt Mua:</h4></td></tr>
<tr><td>
<table class="table table-bordered">
<tr><th>Hình Ảnh Mặt Hàng</th>
<th>Tên Mặt Hàng</th>
<th>Số Lượng Mặt Hàng</th>
<th>Giá Mặt Hàng</th>
</tr>
<%for(MatHang mh:listProductOrder){ %>
<tr>
<td><img src="<%=mh.getDuongDan()%>" width="80" height="80"></td>
<td><h4><%=mh.getTen() %></h4></td>
<td><h4><%=mh.getSoLuongDatHang() %></h4></td>
<td><h4><%=format.addDotToTheNumber(mh.getGia()) %> VND</h4></td>
</tr>

<%} %>
</table>
</td></tr>
<tr><td><h3>Tổng Số Tiền: <%=format.addDotToTheNumber(Double.parseDouble((String)session.getAttribute("tongTien"))) %> VND</h3></td></tr>
<tr><td><h3>Hình Thức Thanh Toán: <%=(String)session.getAttribute("hinhThucThanhToan") %></h3></td></tr>
<tr><td><h3>Ngày Xuất Hóa Đơn: <%=(String)session.getAttribute("ThoiGianXuatHoaDon") %></h3></td></tr>
<tr><td><a class="btn btn-success" href="TiepTucMuaHang">TIẾP TỤC MUA HÀNG</a></td></tr>
</table>
</div>
</div>
</body>
</html>
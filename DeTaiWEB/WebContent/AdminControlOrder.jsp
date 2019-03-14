<%@page import="Model.DonHang"%>
<%@page import="Model.HoaDon"%>
<%@page import="Model.QuanLyHoaDonVaDonHang"%>
<%@page import="Model.Account"%>
<%@page import="Model.QuanLyTaiKhoan"%>
<%@page import="Model.KhachHang"%>
<%@page import="Model.QuanLyKhachHang"%>
<%@page import="Model.MatHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.QuanLyMatHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title></title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
  <link rel="stylesheet" href="lib/css/bootstrap.min.css">
  <link rel="stylesheet"  href="lib/css/bootstrap-theme.min.css"> 
  <script src="lib/jquery-3.2.0.min.js"></script>
  <script src="lib/js/bootstrap.min.js"></script>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link rel="stylesheet" href="lib/dataTables.bootstrap.min.css">
<script src="lib/jquery.dataTables.min.js"></script>
<script src="lib/dataTables.bootstrap.min.js"></script>

  <script src="lib/jquery.viewportchecker.js"></script>
	<link rel="stylesheet" type="text/css" href="adminControlCss.css">
		<script>
	  $.ajax({ //XỬ LÝ AJAX CHO MENU
          url : "adminMenu.jsp",
          type : "POST",
          dataType:"text",
          data : {
               
          },
          success : function (result){
              $('#menu').html(result);
          }
      });
	</script>
</head>
<body>

<div id="menu"></div>
<%QuanLyHoaDonVaDonHang qlhd=new QuanLyHoaDonVaDonHang();

%>
<%ArrayList<DonHang> list=qlhd.getAllOrder();
%>
<div id="divForEachParts">
<h1>Danh Sách Hóa Đơn Hiện Có:</h1>



<table class="table table-bordered" id="table1">
<thead>
	<tr>

	<th>Mã Đơn Hàng</th>
		
<th>Mã Hóa Đơn</th>

<th>Ngày Tạo Đơn Hàng</th>
<th>Trạng Thái Thanh Toán</th>

<th>Tổng Giá Tiền</th>
<th>Xác Nhận Thanh Toán</th>

	</tr>
	</thead>
	<tbody>
	<%for(DonHang dh:list){ %>
<tr>

<td><%=dh.getMaDonHang() %></td>
<td><%=dh.getMaHoaDon() %></td>

<td><%=dh.getNgayTao()%></td>
<td><%=dh.getTrangThaiThanhToan()%></td>
<td><%=dh.getTongTien() %> VNĐ</td>

<td>
<%if(dh.getTrangThaiThanhToan().equals("Đã Thanh Toán")){ %>
<h4>Đơn hàng này đã được thanh toán</h4>
<%}else{ %>
<button class="btn btn-default" data-toggle="modal" data-target="#myModal<%=dh.getMaDonHang()%>">Xác Nhận Đã Thanh Toán</button>
<div id="myModal<%=dh.getMaDonHang()%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
   
      <div class="modal-body">
<h3>Bạn Có Chắc Đơn Hàng Này Đã Được Thanh Toán ?</h3>
<form action="XacNhanThanhToanDonHang" method="post">
<input type="hidden" value="<%=dh.getMaDonHang()%>" name="maDH">
<button class="btn btn-default" type="submit">Xác Nhận Đã Thanh Toán</button>
</form>
      </div>
      <div class="modal-footer">
  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<%} %>
</td>






</tr>
<%} %>
</tbody>

</table>

</div>

<script>
	$(document).ready(function() {
	    $('#table1').DataTable();
	    
	} );
	</script>
</body>
</html>
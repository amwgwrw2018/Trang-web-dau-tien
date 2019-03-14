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
<%ArrayList<HoaDon> list=qlhd.getAllBill();
%>
<div id="divForEachParts">
<h1>Danh Sách Hóa Đơn Hiện Có:</h1>



<table class="table table-bordered" id="table1">
<thead>
	<tr>

	<th>Mã Khách Hàng</th>
		
<th>Hình Thức Thanh Toán</th>

<th>Ghi Chú</th>
<th>Tên Khách Hàng</th>

<th>Địa Chỉ Khách Hàng</th>

<th>Số Điện Thoại Khách Hàng</th>
<th>Danh Sách Mặt Hàng Đã Đặt</th>
<th>Xác Nhận</th>
	</tr>
	</thead>
	<tbody>
	<%for(HoaDon hd:list){ %>
<tr>

<td><%=hd.getMaKhachHang() %></td>
<td><%=hd.getHinhThucThanhToan() %></td>

<td><%=hd.getGhiChu() %></td>
<td><%=hd.getTenThaythe() %></td>
<td><%=hd.getDiaChiThayThe() %></td>
<td><%=hd.getSoDienThoaiThayThe() %></td>
<td><button class="btn" style="background: #07b5ef;" data-toggle="modal" data-target="#myModal<%=hd.getMaHoaDon()%>">Danh Sách Mặt Hàng Của Hóa Đơn Số <%=hd.getMaHoaDon() %></button>
<div id="myModal<%=hd.getMaHoaDon()%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
   
      <div class="modal-body">
  <table class="table table-bordered">
  <tr>
  <th>Tên mặt hàng</th>
  <th>Ảnh</th>
  <th>Số Lượng Đã Đặt</th>
  <th>Đơn Giá</th>
  </tr>
 <%for(MatHang mh:hd.getOrderedList()){ %>
 <tr>
 <td><%=mh.getTen() %></td>
 <td><img src="<%=mh.getDuongDan()%>" width="40" height="40"></td>
 <td><%=mh.getSoLuongDaDatKhiThanhToan() %></td>
 <td><%=mh.getGia() %> VND</td>
 </tr>
 <%} %>
  </table>

      </div>
      <div class="modal-footer">
  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


</td>
<td>
<%if(hd.getTrangThaiXacNhan()==0){ %>

<button class="btn btn-default" data-toggle="modal" data-target="#myModal<%=hd.getMaHoaDon()%>xn">Xác Nhận Hóa Đơn Khớp Với Phản Hồi Của Khách Hàng</button> 
<div id="myModal<%=hd.getMaHoaDon()%>xn" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
   
      <div class="modal-body">
<h3>Bạn Có Chắc Muốn Xác Nhận Hóa Đơn Này?</h3>
<form action="XyLyXacNhanDonHang" method="post">
<input type="hidden" name="maHD" value="<%=hd.getMaHoaDon()%>">

<button class="btn btn-default" type="submit">Xác Nhận Hóa Đơn Khớp Với Phản Hồi Của Khách Hàng</button>  </form>
      </div>
      <div class="modal-footer">
  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<%}else{ %>
<h4 style="color: #33cc00;"><span class="glyphicon glyphicon-ok"></span>   Đã Xác Nhận Hóa Đơn Này</h4>
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
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
<%QuanLyKhachHang qlkh=new QuanLyKhachHang();
QuanLyTaiKhoan qltk=new QuanLyTaiKhoan();

%>
<%ArrayList<KhachHang> list=qlkh.getAllNguoiDung();
ArrayList<Account> listTK=qltk.getAllAccount();
%>
<div id="divForEachParts">
<h1>Danh Sách Khách Hàng:</h1>
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal2"><span class="glyphicon glyphicon-pencil" ></span>Thêm Khách Hàng Và Tài Khoản:</button>

<!-- Modal -->
<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
   
      <div class="modal-body">
  <form action="AddCustomer" method="post">
<h2>THÊM KHÁCH HÀNG:</h2>
	

<label>Nhập Tên Khách Hàng:</label><br><br>
<input type="text" name="tenKH" placeholder="Nhập Tên Khách Hàng" required><br><br>
<label>Giới Tính Khách Hàng :</label><br><br>
<input type="radio" name="genderKH" value="male">Nam<br>
<input type="radio" name="genderKH" value="female">Nữ<br>
<label>Nhập Ngày Sinh:</label><br><br>
     <select name="day">
    <%for(int i =1;i<=31;i++){ %>
    <option value="<%=i%>" ><%=i %></option>
    <%} %>
    </select>
    
    <select name="month">
    <%for(int i =1;i<=12;i++){ %>
    <option  value="<%=i%>" ><%=i %></option>
    <%} %>
    </select>
    
    
    
    <select name="year">
    <%for(int i =1990;i<=2017;i++){ %>
    <option value="<%=i%>" ><%=i %></option>
    <%} %>
    </select>
    <br><br>
<label>Nhập Địa Chỉ:</label><br><br>
<textarea name="diachiKH" placeholder="Nhập Địa Chỉ" required></textarea><br><br>
<label>Nhập Số Điện Thoại:</label><br><br>
<input type="text" name="phone" required><br><br>

<label>Nhập UserName:</label><br><br>
<input type="text" name="username" placeholder="Nhập Username" required><br><br>
<label>Nhập Password:</label><br><br>
<input type="password" name="pass" required><br><br>
<label>Nhập Email:</label><br><br>
<input type="email" name="email" required><br><br>
<button class="btn btn-success" type="submit"><span class="glyphicon glyphicon-pencil"></span> Thêm Khách Hàng</button>
<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</form>
      </div>
      <div class="modal-footer">

      </div>
    </div>

  </div>
</div>
<table class="table table-bordered" id="table1">
<thead>
	<tr>

	<th>Tên</th>
		
<th>Giới Tính</th>
<th>Ngày Sinh</th>
<th>Địa Chỉ</th>
<th>Số Điện Thoại</th>

<th>Mã Tài Khoản</th>

<th>Thao Tác 

	</th>
	</tr>
	</thead>
	<tbody>
	<%for(KhachHang kh:list){ %>
<tr>

	<td><%=kh.getName() %></td>
	<td><%=kh.getGioitinh() %></td>
<td><%=kh.getBirthday() %></td>
<td><%=kh.getAddress() %></td>
<td><%=kh.getPhone() %></td>

<td><%=kh.getMaTaiKhoan() %></td>
<td>
<button class="btn btn-danger"  data-toggle="modal" data-target="#myModalDelete<%=kh.getMaKhachHang()%>"><span class="glyphicon glyphicon-remove"></span></button>


<div id="myModalDelete<%=kh.getMaKhachHang()%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
     <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
      <div class="modal-body">
 <form action="DeleteCustomer" method="post">
<input type="hidden" name="deleteValue" value="<%=kh.getMaKhachHang()%>">
<h3>Bạn có chắc muốn xóa Khách hàng <%=kh.getName()%>? và Tài Khoản của Khách Hàng này là <%=kh.getMaTaiKhoan() %></h3>
<button class="btn btn-danger" type="submit"><span class="glyphicon glyphicon-remove"></span> Xóa Khách Hàng</button>
</form>
      </div>
      <div class="modal-footer">
       
      </div>
    </div>

  </div>
</div>
<button type="button" class="btn btn-info " data-toggle="modal" data-target="#myModalChange<%=kh.getMaKhachHang()%>"><span class="glyphicon glyphicon-pencil" ></span></button>

<!-- Modal -->
<div id="myModalChange<%=kh.getMaKhachHang()%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
   
      <div class="modal-body">
     <form id="form1" action="ChangeProduct" method="post" enctype="multipart/form-data" acceptcharset="UTF-8">
<h2>THAY ĐỔI THÔNG TIN KHÁCH HÀNG</h2>
<label>Nhập Tên Khách Hàng Mới:</label><br><br>
<input type="text" name="tenKH"><br><br>
<label>Nhập Giới Tính:</label><br><br>
<input type="text" name="gender"><br><br>
<label>Ngày Sinh:</label><br><br>
<input type="text" name="birthday"><br><br>
<label>Địa Chỉ:</label><br><br>
<input type="text" name="address"><br><br>
<label>Số Điện Thoại:</label><br><br>
<input type="text" name="phone"><br><br>
<button class="btn btn-success" type="submit"><span class="glyphicon glyphicon-pencil" data-dismiss="modal"></span> Sửa Sản Phẩm</button>
 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</form>
      </div>
      <div class="modal-footer">
       
      </div>
    </div>

  </div>
</div>

</td>
</tr>
<%} %>
</tbody>

</table>
<h1>Danh Sách Tài Khoản:</h1>
<table class="table table-bordered" id="table2">
<thead>
<tr>
<th>Mã Tài Khoản</th>
<th>Username</th>
<th>Password</th>

<th>Email Đăng Ký</th>

</tr>
</thead>
<tbody>
<%for(Account ac:listTK){ %>
<tr>
<td><%=ac.getMaTaiKhoan() %></td>
<td><%=ac.getUsername() %></td>
<td><%=ac.getPassword() %></td>

<td><%=ac.getEmail() %></td>

</tr>
<%} %>
</tbody>

</table>
</div>


<script>
	$(document).ready(function() {
	    $('#table1').DataTable();
	    $('#table2').DataTable();
	} );
	</script>
</body>
</html>
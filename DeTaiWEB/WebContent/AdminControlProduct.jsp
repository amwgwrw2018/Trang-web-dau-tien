<%@page import="Model.thongTinKemTheoSanPham"%>
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

<%QuanLyMatHang qlmh=new QuanLyMatHang(); %>
<%ArrayList<MatHang> danhSachMatHang=qlmh.getAll();
ArrayList<thongTinKemTheoSanPham> listMaMatHang=qlmh.getAllMaMatHang();
ArrayList<thongTinKemTheoSanPham> listMaNhaSX=qlmh.getAllMaNhaSanXuat();

%>
<div id="divForEachParts">
<h1>Danh Sách Mặt Hàng Hiện Có</h1>
<table class="table table-bordered" id="example">
<thead>
	<tr>
	<th>Ảnh Sản Phẩm</th>
	<th>Mã Sản Phẩm</th>
		<th>Tên Sản Phẩm</th>
<th>Giá Sản Phẩm</th>
<th>Tên Loại Sản Phẩm</th>

<th>Tên Nhà Sản Xuất</th>
<th>Mô Tả Về Sản Phẩm</th>
<th>Số Lượng</th>
<th>Thao Tác 
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal2"><span class="glyphicon glyphicon-pencil" ></span> Thêm Sản Phẩm</button>

<!-- Modal -->
<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
   
      <div class="modal-body">
  
  <form id="form2" action="AddProduct" method="post"  enctype="multipart/form-data" >
<h2>THÊM SẢN PHẨM</h2>
	
	<label>Chọn Mã Loại Sản Phẩm :</label><br><br>
	<select name="maloaiSP">
	<%for(thongTinKemTheoSanPham s:listMaMatHang){ %>
	<option value="<%=s.getMa()%>"><%=s.getMa()+"-"+s.getTenTheoMa() %></option>
	<%} %>
	</select><br><br>
<label>Nhập Tên Sản Phẩm :</label><br><br>
<input type="text" name="tenSP" placeholder="Nhập Tên Sản Phẩm" required><br><br>
<label>Chọn Mã Nhà Sản Xuất :</label><br><br>
<select name="maNSXSP">
<%for(thongTinKemTheoSanPham s:listMaNhaSX){ %>
	<option value="<%=s.getMa()%>"><%=s.getMa()+"-"+s.getTenTheoMa() %></option>
	<%} %>
</select><br><br>
<label>Nhập Giá Sản Phẩm :</label><br><br>
<input type="number" name="giaSP" placeholder="Nhập Giá Sản Phẩm" required><br><br>
<label>Nhập Mô Tả Về Sản Phẩm :</label><br><br>
<textarea name="motaSP" placeholder="Nhập Mô Tả Sản Phẩm" required></textarea>
<label>Tải Lên Ảnh Về Sản Phẩm:</label><br><br>
<input type="file" name="imageSP" accept="image/*" required ><br><br>
<label>Nhập Số Lượng Sản Phẩm Hiện Có:</label><br><br>
<input type="text" name="soluongSP" placeholder="Nhập Số Lượng Sản Phẩm" required><br>
<button class="btn btn-success" type="submit"><span class="glyphicon glyphicon-pencil"></span> Thêm Sản Phẩm</button>
<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</form>

      </div>
      <div class="modal-footer">

      </div>
    </div>

  </div>
</div>
	</th>
	</tr>
	</thead>
	<tbody>
	<%for(MatHang mh:danhSachMatHang){ %>
	
<tr>
<td><img alt="" src="<%=mh.getDuongDan()%>" width="30" height="30"></td>
	<td><%="MH"+mh.getMaSanPham() %></td>
	<td><%=mh.getTen() %></td>
<td><%=(int)mh.getGia() %></td>
<td><%=mh.getTenLoaiMatHang() %></td>

<td><%=mh.getNhaSanXuat() %></td>
<td><%=mh.getMota() %></td>
<td><%=mh.getSoLuongConLai() %></td>
<td>
<button class="btn btn-danger"  data-toggle="modal" data-target="#myModalDelete<%=mh.getMaSanPham()%>"><span class="glyphicon glyphicon-trash"></span></button>


<div id="myModalDelete<%=mh.getMaSanPham()%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
     <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
      <div class="modal-body">
 <form action="DeleteProduct" method="post">
<input type="hidden" name="deleteValue" value="<%=mh.getMaSanPham()%>">
<h3>Bạn có chắc muốn xóa Sản Phẩm <%=mh.getTen()%>?</h3>
<button class="btn btn-danger" type="submit"><span class="glyphicon glyphicon-remove"></span> Xóa Sản Phẩm</button>
</form>
      </div>
      <div class="modal-footer">
       
      </div>
    </div>

  </div>
</div>
<button type="button" class="btn btn-info " data-toggle="modal" data-target="#myModalChange<%=mh.getMaSanPham()%>"><span class="glyphicon glyphicon-pencil" ></span></button>

<!-- Modal -->
<div id="myModalChange<%=mh.getMaSanPham()%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
   
      <div class="modal-body">
     <form id="form1" action="ChangeProduct" method="post" enctype="multipart/form-data" acceptcharset="UTF-8">
<h2>THAY ĐỔI THÔNG TIN SẢN PHẨM</h2>
<label>Nhập Tên Sản Phẩm Cần Sửa:</label><br>
<input type="text" name="tenSPchange" value="<%=mh.getTen()%>" required><br>
<label>Nhập Giá Sản Phẩm Cần Sửa:</label><br>
<input type="number" name="giaSPchange"  value="<%=mh.getGia()%>" required><br>
<label>Nhập Mã Loại Sản Phẩm Cần Sửa:</label><br>
	<select name="maLoaiSPchange">
	<%for(thongTinKemTheoSanPham s:listMaMatHang){ %>
	<option value="<%=s.getMa()%>" <%if(mh.getMaLoaiMatHang().equals(s.getMa())){ %> selected <%} %>><%=s.getMa()+"-"+s.getTenTheoMa() %></option>
	<%} %>
	</select><br>
<label>Nhập Nhà Sản Xuất Sản Phẩm Cần Sửa:</label><br>
<select name="maNSXSPchange">
<%for(thongTinKemTheoSanPham s:listMaNhaSX){ %>
	<option value="<%=s.getMa()%>"  <%if(mh.getMaNhaSanXuat().equals(s.getMa())){ %> selected <%} %>><%=s.getMa()+"-"+s.getTenTheoMa() %></option>
	<%} %>
</select><br>
<label>Nhập Mô Tả Về Sản Phẩm Cần Sửa:</label><br>
<textarea name="motaSPchange" required><%=mh.getMota()%></textarea>
<label>Nhập Số Lượng Sản Phẩm Cần Sửa:</label><br>
<input type="text" name="soLuongSPchange"  value="<%=mh.getSoLuongConLai()%>" required><br>
<label>Cập Nhật Ảnh Sản Phẩm Cần Sửa:</label><br>
<input type="checkbox" name="dontWantToChangeImg" value="yes" class="changeImg" > Không Thay Đổi Ảnh Sản Phẩm <br><br>
<input type="file" name="imageSPchange" class="uploadFile" accept="image/*" ><br>
<input type="hidden" name="maSoSP" value="<%=mh.getMaSanPham()%>">
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

</div>




<script>



	function setCheck(index){
		document.getElementsByClassName("changeImg")[index].onchange=function(i){
		if(	document.getElementsByClassName("uploadFile")[index].disabled){
			document.getElementsByClassName("uploadFile")[index].disabled=false;
		}else{
			document.getElementsByClassName("uploadFile")[index].disabled=true;
		}
		}
	}	
		
	

	$(document).ready(function() {
	    $('#example').DataTable();
	} );
	</script>
</body>
</html>
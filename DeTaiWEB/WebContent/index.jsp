<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
    <%@page import="Model.FormatNumber"%>
<%@page import="Model.KhachHang"%>
<%@page import="Model.QuanLyKhachHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.MatHang"%>

<%@page import="Model.QuanLyMatHang"%>
<%@page  language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="vi">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">

 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
  <link rel="stylesheet" href="lib/css/bootstrap.min.css">
  <link rel="stylesheet"  href="lib/css/bootstrap-theme.min.css"> 
  <script src="lib/jquery-3.2.0.min.js"></script>
  <script src="lib/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="cssQuanTrong.css">
  <link rel="stylesheet" type="text/css" href="carousel.css">
  <script src="lib/jquery.carouFredSel-6.1.0-packed.js" type="text/javascript"></script>

   <script type="text/javascript" src="lib/javaScriptQuanTrong.js"></script>
    <script src="lib/carousel.js"></script>
<script type="text/javascript">


window.addEventListener('load', function (){
	getPage(1,8,'mainProduct');

});
window.addEventListener('load', function (){

	getPage(1,10,'HumanProducts');
	
});
window.addEventListener('load', function (){
	
	getPage(1,10,'StructureProduct');
});

</script>

<title>Web Bán Mô Hình</title>


</head>

 <%if(session.getAttribute("lang")!=null){ %>
  <fmt:setLocale value='<%=(String)session.getAttribute("lang") %>' scope="session" />
  <%}else{ %>
    <fmt:setLocale value='vi_VN' scope="session" />
 <%} %>
    <fmt:setBundle basename="CreateUserGUI" scope="session"/>   
<body>

<%QuanLyMatHang qlmh=new QuanLyMatHang(); 

%>
<%ArrayList<MatHang> listProductOrder=(ArrayList<MatHang>)session.getAttribute("listProductOrder"); %>
<%ArrayList<MatHang> list=qlmh.getAll(); 

%>

<%ArrayList<MatHang> listHouse=qlmh.getAllHouse(); %>
<%ArrayList<MatHang> listMan=qlmh.getAllMan(); %>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setCharacterEncoding("UTF-8"); %>
<%	response.setContentType("text/html;charset=UTF-8"); 
FormatNumber format=new FormatNumber();
if(request.getAttribute("byPrice")!=null){// sap xep tat ca cac bang
	list.sort(new Comparator<MatHang>(){
		public int compare(MatHang o1, MatHang o2){
			return 	o1.getGia()>o2.getGia() ? 1 : o1.getGia()==o2.getGia() ? 0 : -1;
						
			}
		});
	listHouse.sort(new Comparator<MatHang>(){
		public int compare(MatHang o1, MatHang o2){
			return 	o1.getGia()>o2.getGia() ? 1 : o1.getGia()==o2.getGia() ? 0 : -1;
						
			}
		});
	listMan.sort(new Comparator<MatHang>(){
		public int compare(MatHang o1, MatHang o2){
			return 	o1.getGia()>o2.getGia() ? 1 : o1.getGia()==o2.getGia() ? 0 : -1;
						
			}
		});
}else{
	if(request.getAttribute("byName")!=null){
		list.sort(new Comparator<MatHang>(){
			public int compare(MatHang o1, MatHang o2){
				return 	o1.getTen().compareToIgnoreCase(o2.getTen());
							
				}
			});
		listHouse.sort(new Comparator<MatHang>(){
			public int compare(MatHang o1, MatHang o2){
				return 	o1.getTen().compareToIgnoreCase(o2.getTen());
							
				}
			});
			listMan.sort(new Comparator<MatHang>(){
				public int compare(MatHang o1, MatHang o2){
					return 	o1.getTen().compareToIgnoreCase(o2.getTen());
								
					}
				});
	}
}

%>





<div id="khungToanTheWeb">
<jsp:include page="menu.jsp" />

<jsp:include page="khungDanhSachChonLuaMatHang.jsp" />


<div id="wrapper">
      <div id="carousel">
      <%for(MatHang mh:list){ %>
     <div>
          <img src="<%=mh.getDuongDan() %>" width="330" height="330" data-toggle="modal" data-target="#modalCarousel<%=mh.getMaSanPham()%>" onclick="addLuotXem('<%=mh.getMaSanPham()%>')"/>

          <span><%=mh.getTen() %></span>
        </div>
        
         <%} %>

      </div>
      </div>
      <%for(MatHang mh:list){ %>
                <div id="modalCarousel<%=mh.getMaSanPham()%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
   <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Sản Phẩm:<%=mh.getTen() %></h4>
      </div>
      <div class="modal-body">
     <img alt="" src="<%=mh.getDuongDan()%>" width="100" height="100" >
     <h5 style="color:red;"><strong>Giá:<%=format.addDotToTheNumber(mh.getGia()) %></strong></h5>
     <h5>Nhà Sản Xuất: <%= mh.getNhaSanXuat() %></h5>
     <h5><%=mh.getMota() %></h5>
     <%if(mh.getSoLuongConLai()==0){ %>
<h4 style="text-align: center; color: red;">Hết Hàng</h4>
<%}else{ %>
     <form action="XuLyKhachHangMuaHang" method="post">
     <input type="hidden" name="SoLuongConLaiSanPhamDuocDatHang" value="<%=mh.getSoLuongConLai()%>">
<input type="hidden" name="TenSanPhamDuocDatHang" value="<%= mh.getTen() %>">
<input type="hidden" name="GiaSanPhamDuocDatHang" value="<%= mh.getGia() %>">
<input type="hidden" name="DuongDanSanPhamDuocDatHang" value="<%= mh.getDuongDan() %>">

<input type="hidden" name="MaSanPhamDatHang" value="<%=mh.getMaSanPham()%>">
<input type="hidden" value="<%=this.getClass().getSimpleName().replaceFirst("_jsp",".jsp") %>" name="currentURL">
<button type="submit" class="btn"  id="OrderButton"><img src="image/XeDayShop.png" width="20px" height="20px" ><fmt:message key="ThemVaoGioHang" /></button>
</form> 
<%} %>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
      <%} %>
      <marquee><strong><fmt:message key="Slogan"/></strong></marquee>
      
      
      
<div style="clear: both;"></div>


<div id="tieudeSPMoi">
<img src="image/newIcon.jpg" width="50" height="50" style="float: right;">
<h2></span><fmt:message key="SanPhamMoi" /></h2> </div>
<div id="sanPhamMoi">
<%ArrayList<MatHang> listNewProduct=qlmh.getNewProduct(); %>
<%for(MatHang mh:listNewProduct){ %>

<div style="float: left;">
<img src="<%=mh.getDuongDan()%>" class="img-circle" width="152" height="152" style="margin: 20px;" data-toggle="modal" data-target="#modalNew<%=mh.getMaSanPham()%>" onclick="addLuotXem('<%=mh.getMaSanPham()%>')">

<div id="modalNew<%=mh.getMaSanPham()%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
   <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Sản Phẩm:<%=mh.getTen() %></h4>
      </div>
      <div class="modal-body">
     <img alt="" src="<%=mh.getDuongDan()%>" width="100" height="100" >
     <h5 style="color:red;"><strong>Giá:<%=format.addDotToTheNumber(mh.getGia()) %></strong></h5>
     <h5>Nhà Sản Xuất: <%= mh.getNhaSanXuat() %></h5>
     <h5><%=mh.getMota() %></h5>
     <%if(mh.getSoLuongConLai()==0){ %>
<h4 style="text-align: center; color: red;">Hết Hàng</h4>
<%}else{ %>
     <form action="XuLyKhachHangMuaHang" method="post">
     <input type="hidden" name="SoLuongConLaiSanPhamDuocDatHang" value="<%=mh.getSoLuongConLai()%>">
<input type="hidden" name="TenSanPhamDuocDatHang" value="<%= mh.getTen() %>">
<input type="hidden" name="GiaSanPhamDuocDatHang" value="<%= mh.getGia() %>">
<input type="hidden" name="DuongDanSanPhamDuocDatHang" value="<%= mh.getDuongDan() %>">

<input type="hidden" name="MaSanPhamDatHang" value="<%=mh.getMaSanPham()%>">
<input type="hidden" value="<%=this.getClass().getSimpleName().replaceFirst("_jsp",".jsp") %>" name="currentURL">
<button type="submit" class="btn"  id="OrderButton"><img src="image/XeDayShop.png" width="20px" height="20px" ><fmt:message key="ThemVaoGioHang" /></button>
</form> 
<%} %>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<a>
<p><%= mh.getTen()%></p>
<p>Nhà Sản Xuất: <%=mh.getNhaSanXuat() %></p>
<p><strong><%=format.addDotToTheNumber(mh.getGia()) %>VND</strong></p>

</a>
</div>
<%} %>
<div style="clear: both;"></div>
</div>
<div id="quangCao">
<div id="quangCao" >
<img src="image/tinhTe.png"><br>
<img src="image/tiMi.png">
</div>
</div>

<div  id="productList">
<form id="sorting" method="post" action="XuLySapXepMatHang" class="form-group" >
<input type="hidden" value="<%=this.getClass().getSimpleName().replaceFirst("_jsp",".jsp") %>" name="currentURL">
<select name="typeOfSorting" onchange="sort()" class="form-control" style="width: 30%; float: left;">
<option><fmt:message key="SortLabel" /></option>
  <option value="byName" <%if((request.getParameter("typeOfSorting")!=null)&&(((String)request.getParameter("typeOfSorting")).equals("byName"))){ %> selected <%} %>><fmt:message key="SortByName" /></option>
   <option value="byPrice" <%if((request.getParameter("typeOfSorting")!=null)&&(((String)request.getParameter("typeOfSorting")).equals("byPrice"))){ %> selected <%} %>><fmt:message key="SortByPrice" /></option>
    

</select>
</form>

<div id="danhSachMatHang" ><!-- sssssssssssssssssssssssssssssssssssss -->

<div id="khungTieuDe"  class="well">
<h3><fmt:message key="DanhSachMatHang" /></h3>

</div>

<div id="mainDetailProduct">
<%for(MatHang mh:list){ %>

<div  style="  float:left; margin-bottom:60px;" class="mainProduct" >

<img alt="" src="<%=mh.getDuongDan()%>" width="201" height="201"  data-toggle="modal" data-target="#modal<%=mh.getMaSanPham()%>" onclick="addLuotXem('<%=mh.getMaSanPham()%>')">
<!-- TAO MODAL CHO TUNG SAN PHAM -->

<div id="modal<%=mh.getMaSanPham()%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Sản Phẩm:<%=mh.getTen() %></h4>
      </div>
      <div class="modal-body">
     <img alt="" src="<%=mh.getDuongDan()%>" width="100" height="100" >
     <h5 style="color:red;"><strong>Giá:<%=format.addDotToTheNumber(mh.getGia()) %></strong></h5>
      <h5>Nhà Sản Xuất: <%= mh.getNhaSanXuat() %></h5>
     <h5><%=mh.getMota() %></h5>
     <%if(mh.getSoLuongConLai()==0){ %>
<h4 style="text-align: center; color: red;">Hết Hàng</h4>
<%}else{ %>
     <form action="XuLyKhachHangMuaHang" method="post" <%if(mh.getSoLuongConLai()==0){ %> style="display: none;" <%} %>>
     <input type="hidden" name="SoLuongConLaiSanPhamDuocDatHang" value="<%=mh.getSoLuongConLai()%>">
<input type="hidden" name="TenSanPhamDuocDatHang" value="<%= mh.getTen() %>">
<input type="hidden" name="GiaSanPhamDuocDatHang" value="<%= mh.getGia() %>">
<input type="hidden" name="DuongDanSanPhamDuocDatHang" value="<%= mh.getDuongDan() %>">
<input type="hidden" name="MaSanPhamDatHang" value="<%=mh.getMaSanPham()%>">
<input type="hidden" value="<%=this.getClass().getSimpleName().replaceFirst("_jsp",".jsp") %>" name="currentURL">
<button type="submit" class="btn"  id="OrderButton"><img src="image/XeDayShop.png" width="20px" height="20px" ><fmt:message key="ThemVaoGioHang" /></button>
</form> 
<%} %>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<p><%=mh.getTen() %></p>
<p>Nhà Sản Xuất: <%=mh.getNhaSanXuat() %></p>

<p style="color:red;"><%=format.addDotToTheNumber(mh.getGia()) %>VND</p>
<p><img src="image/eye-icon.png" width="20" height="20">Lượt Xem:<%=mh.getLuotXem() %></p>
<%if(mh.getSoLuongConLai()==0){ %>
<h4 style="text-align: center; color: red;">Hết Hàng</h4>
<%}else{ %>
<form action="XuLyKhachHangMuaHang" method="post" >

<input type="hidden" name="SoLuongConLaiSanPhamDuocDatHang" value="<%=mh.getSoLuongConLai()%>">
<input type="hidden" name="TenSanPhamDuocDatHang" value="<%= mh.getTen() %>">
<input type="hidden" name="GiaSanPhamDuocDatHang" value="<%= mh.getGia() %>">
<input type="hidden" name="DuongDanSanPhamDuocDatHang" value="<%= mh.getDuongDan() %>">
<input type="hidden" name="MaSanPhamDatHang" value="<%=mh.getMaSanPham()%>">
<input type="hidden" value="<%=this.getClass().getSimpleName().replaceFirst("_jsp",".jsp") %>" name="currentURL">
<button type="submit" class="btn"  id="OrderButton"><img src="image/XeDayShop.png" width="20px" height="20px"><fmt:message key="ThemVaoGioHang" /></button>
</form> 
<%} %>
</div>


<%} %>
</div>
<div id="phanTrangMain">

<ul class="pagination">

<%for(int i =1;i<=list.size()/8+1;i++){ %>
<li class="pageOfMainProducts">
<a onclick="getPage(<%=1+(8*(i-1))%>,<%=i*8%>,'mainProduct')"><%=i %></a>
</li>
<%} %>
</ul>
</div>


</div>
<div id="sanPhamNoiBat">
<div id="tieuDeSanPhamNoiBat"  class="well"><h3><fmt:message key="SanPhamNoiBat" /></h3></div>
<%ArrayList<MatHang> sanPhamNoiBat=qlmh.getBestProduct(); %>
<%for(MatHang mh:sanPhamNoiBat){ %>
<div style="margin-bottom: 10px; padding-left:10px;">
<img src="<%=mh.getDuongDan()%>" width="40" height="40" data-toggle="modal" data-target="#modalNB<%=mh.getMaSanPham()%>" onclick="addLuotXem('<%=mh.getMaSanPham()%>')">

<div id="modalNB<%=mh.getMaSanPham()%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Sản Phẩm:<%=mh.getTen() %></h4>
      </div>
      <div class="modal-body">
     <img alt="" src="<%=mh.getDuongDan()%>" width="100" height="100" >
     <h5 style="color:red;"><strong>Giá:<%=format.addDotToTheNumber(mh.getGia()) %></strong></h5>
      <h5>Nhà Sản Xuất: <%= mh.getNhaSanXuat() %></h5>
     <h5><%=mh.getMota() %></h5>
     <%if(mh.getSoLuongConLai()==0){ %>
<h4 style="text-align: center; color: red;">Hết Hàng</h4>
<%}else{ %>
     <form action="XuLyKhachHangMuaHang" method="post">
     <input type="hidden" name="SoLuongConLaiSanPhamDuocDatHang" value="<%=mh.getSoLuongConLai()%>">
<input type="hidden" name="TenSanPhamDuocDatHang" value="<%= mh.getTen() %>">
<input type="hidden" name="GiaSanPhamDuocDatHang" value="<%= mh.getGia() %>">
<input type="hidden" name="DuongDanSanPhamDuocDatHang" value="<%= mh.getDuongDan() %>">
<input type="hidden" name="MaSanPhamDatHang" value="<%=mh.getMaSanPham()%>">
<input type="hidden" value="<%=this.getClass().getSimpleName().replaceFirst("_jsp",".jsp") %>" name="currentURL">
<button type="submit" class="btn"  id="OrderButton"><img src="image/XeDayShop.png" width="20px" height="20px" ><fmt:message key="ThemVaoGioHang" /></button>
</form> 
<%} %>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<span><%=mh.getTen() %></span>

</div>
<%} %>
</div>
<div id="hotLine">
<div id="tieuDehotLine" class="well"> <h3><fmt:message key="HotLineLienHe" /></h3></div>

 
<p><fmt:message key="HotLineContent"/></p>
<div><img src="image/phoneIcon.png" width="30" height="30"><h4>08.6670.8999</h4></div>
</div>
<div id="hitCounter">
<%
QuanLyKhachHang qlkh=new QuanLyKhachHang();
qlkh.insertSoLuongKhachHangTruyCap();
%>

<h4><fmt:message key="truycap"/> :</h4>
<h4 style="text-align: center;"><%=qlkh.getSoLuongTruyCap() %></h4>

</div>



<div  id="khungKienTruc">
<div id="tieuDeKienTruc" class="well"><h3><fmt:message key="MHKTKT" /></h3></div>

<div id="detailKT">
<%for(MatHang mh:listHouse){ %>

<div style="  float:left; margin-bottom:60px;" class="StructureProduct" >
<img alt="" src="<%=mh.getDuongDan()%>" width="201" height="201"  data-toggle="modal" data-target="#modalKT<%=mh.getMaSanPham()%>" onclick="addLuotXem('<%=mh.getMaSanPham()%>')">
<%System.out.println(mh.getMaSanPham()); %>
<div id="modalKT<%=mh.getMaSanPham()%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Sản Phẩm:<%=mh.getTen() %></h4>
      </div>
      <div class="modal-body">
     <img alt="" src="<%=mh.getDuongDan()%>" width="100" height="100" >
     <h5 style="color:red;"><strong>Giá:<%=format.addDotToTheNumber(mh.getGia()) %></strong></h5>
      <h5>Nhà Sản Xuất: <%= mh.getNhaSanXuat() %></h5>
     <h5><%=mh.getMota() %></h5>
     <%if(mh.getSoLuongConLai()==0){ %>
<h4 style="text-align: center; color: red;">Hết Hàng</h4>
<%}else{ %>
     <form action="XuLyKhachHangMuaHang" method="post">
     <input type="hidden" name="SoLuongConLaiSanPhamDuocDatHang" value="<%=mh.getSoLuongConLai()%>">
<input type="hidden" name="TenSanPhamDuocDatHang" value="<%= mh.getTen() %>">
<input type="hidden" name="GiaSanPhamDuocDatHang" value="<%= mh.getGia() %>">
<input type="hidden" name="DuongDanSanPhamDuocDatHang" value="<%= mh.getDuongDan() %>">
<input type="hidden" name="MaSanPhamDatHang" value="<%=mh.getMaSanPham()%>">
<input type="hidden" value="<%=this.getClass().getSimpleName().replaceFirst("_jsp",".jsp") %>" name="currentURL">
<button type="submit" class="btn"  id="OrderButton"><img src="image/XeDayShop.png" width="20px" height="20px"><fmt:message key="ThemVaoGioHang" /></button>
</form> 
<%} %>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<p><%=mh.getTen() %></p>
<p>Nhà Sản Xuất: <%=mh.getNhaSanXuat() %></p>
<p style="color:red;"><%=format.addDotToTheNumber(mh.getGia()) %>VND</p>
<p><img src="image/eye-icon.png" width="20" height="20">Lượt Xem:<%=mh.getLuotXem() %></p>
<%if(mh.getSoLuongConLai()==0){ %>
<h4 style="text-align: center; color: red;">Hết Hàng</h4>
<%}else{ %>
<form action="XuLyKhachHangMuaHang" method="post">
<input type="hidden" name="SoLuongConLaiSanPhamDuocDatHang" value="<%=mh.getSoLuongConLai()%>">
<input type="hidden" name="TenSanPhamDuocDatHang" value="<%= mh.getTen() %>">
<input type="hidden" name="GiaSanPhamDuocDatHang" value="<%= mh.getGia() %>">
<input type="hidden" name="DuongDanSanPhamDuocDatHang" value="<%= mh.getDuongDan() %>">
<input type="hidden" name="MaSanPhamDatHang" value="<%=mh.getMaSanPham()%>">
<input type="hidden" value="<%=this.getClass().getSimpleName().replaceFirst("_jsp",".jsp") %>" name="currentURL">
<button type="submit" class="btn"  id="OrderButton"><img src="image/XeDayShop.png" width="20px" height="20px"><fmt:message key="ThemVaoGioHang" /></button>
</form> 
<%} %>
</div>


<%} %>
</div>
<div id="phanTrangKT">
<ul class="pagination" ><!-- XỬ LÝ PHÂN TRANG CHO PHẦN KHUNG DANH SÁCH KIẾN TRÚC -->
<%for(int i=1;i<=listHouse.size()/10+1;i++){ %>
<li>
<a onclick="getPage(<%=1+(10*(i-1))%>,<%=i*10%>,'StructureProduct')"><%=i %></a>
</li>
<%} %>
</ul>
</div>



<div style="clear: both;"></div>
</div>




<div  id="khungNhanVat">
  <div id="tieuDeNhanVat" class="well"><h3><fmt:message key="MHNV" /></h3></div>
  <div id="detailNV">

<%for(MatHang mh:listMan){ %>

<div style="  float:left; margin-bottom:60px;" class="HumanProducts">
<img alt="" src="<%=mh.getDuongDan()%>" width="201" height="201"  data-toggle="modal" data-target="#modalNV<%=mh.getMaSanPham()%>" onclick="addLuotXem('<%=mh.getMaSanPham()%>')">

<div id="modalNV<%=mh.getMaSanPham()%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Sản Phẩm:<%=mh.getTen() %></h4>
      </div>
      <div class="modal-body">
     <img alt="" src="<%=mh.getDuongDan()%>" width="100" height="100" >
     <h5 style="color:red;"><strong>Giá:<%=format.addDotToTheNumber(mh.getGia()) %></strong></h5>
      <h5>Nhà Sản Xuất: <%= mh.getNhaSanXuat() %></h5>
     <h5><%=mh.getMota() %></h5>
     <%if(mh.getSoLuongConLai()==0){ %>
<h4 style="text-align: center; color: red;">Hết Hàng</h4>
<%}else{ %>
     <form action="XuLyKhachHangMuaHang" method="post">
     <input type="hidden" name="SoLuongConLaiSanPhamDuocDatHang" value="<%=mh.getSoLuongConLai()%>">
<input type="hidden" name="TenSanPhamDuocDatHang" value="<%= mh.getTen() %>">
<input type="hidden" name="GiaSanPhamDuocDatHang" value="<%= mh.getGia() %>">
<input type="hidden" name="DuongDanSanPhamDuocDatHang" value="<%= mh.getDuongDan() %>">
<input type="hidden" name="MaSanPhamDatHang" value="<%=mh.getMaSanPham()%>">
<input type="hidden" value="<%=this.getClass().getSimpleName().replaceFirst("_jsp",".jsp") %>" name="currentURL">
<button type="submit" class="btn"  id="OrderButton"><img src="image/XeDayShop.png" width="20px" height="20px"><fmt:message key="ThemVaoGioHang" /></button>
</form> 
<%} %>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<p><%=mh.getTen() %></p>
<p>Nhà Sản Xuất: <%=mh.getNhaSanXuat() %></p>
<p style="color:red;"><%=format.addDotToTheNumber(mh.getGia()) %>VND</p>
<p><img src="image/eye-icon.png" width="20" height="20">Lượt Xem:<%=mh.getLuotXem() %></p>
<%if(mh.getSoLuongConLai()==0){ %>
<h4 style="text-align: center; color: red;">Hết Hàng</h4>
<%}else{ %>
<form action="XuLyKhachHangMuaHang" method="post">
<input type="hidden" name="SoLuongConLaiSanPhamDuocDatHang" value="<%=mh.getSoLuongConLai()%>">
<input type="hidden" name="TenSanPhamDuocDatHang" value="<%= mh.getTen() %>">
<input type="hidden" name="GiaSanPhamDuocDatHang" value="<%= mh.getGia() %>">
<input type="hidden" name="DuongDanSanPhamDuocDatHang" value="<%= mh.getDuongDan() %>">
<input type="hidden" name="MaSanPhamDatHang" value="<%=mh.getMaSanPham()%>">
<input type="hidden" value="<%=this.getClass().getSimpleName().replaceFirst("_jsp",".jsp") %>" name="currentURL">
<button type="submit" class="btn"  id="OrderButton"><img src="image/XeDayShop.png" width="20px" height="20px"><fmt:message key="ThemVaoGioHang" /></button>
</form> 
<%} %>
</div>


<%} %>
</div>
<div id="phanTrangHM">
<ul class="pagination" >
<%for(int i=1;i<=listMan.size()/10+1;i++){ %>
<li>
<a onclick="getPage(<%=1+(10*(i-1))%>,<%=i*10%>,'HumanProducts')"><%=i %></a>
</li>
<%} %>
</ul>
</div>



<div style="clear: both;"></div>
</div>



<div style="clear: both;"></div>
</div>











<jsp:include page="bottomOfThePage.jsp"></jsp:include>
<div id="comment">
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<div class="fb-comments" data-href="http://localhost:8080/DeTaiWEB/index.jsp" data-width="100%" data-numposts="5"></div>
</div>
</div>

<script type="text/javascript">
document.getElementsByClassName("currentPageInput").value=window.location;
</script>





</body>
</html>
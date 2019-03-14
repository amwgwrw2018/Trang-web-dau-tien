<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<%@page import="Model.FormatNumber"%>
<%@page import="Model.MatHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.QuanLyMatHang"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
  <link rel="stylesheet" href="lib/css/bootstrap.min.css">
  <link rel="stylesheet"  href="lib/css/bootstrap-theme.min.css"> 
  <script src="lib/jquery-3.2.0.min.js"></script>
  <script src="lib/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="cssQuanTrong.css">
 <script type="text/javascript" src="lib/javaScriptQuanTrong.js"></script>
  <script src="lib/jquery.viewportchecker.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mô Hình Cây Cối Hoa Quả</title>
<style type="text/css">
	
	p{
		font-size: 20px;
	}
  #menuItem{
    margin-right: 20px;
    background-color: green;
  }
</style>

</head>
<body>
<%FormatNumber format=new FormatNumber(); %>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.9&appId=435417870144786";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div id="divForEachParts">
<jsp:include page="menu.jsp" />
<%if(request.getAttribute("listFoundedProduct")!=null){ %><!-- DANH SÁCH MẶT HÀNG TÌM ĐƯỢC QUA KHUNG SEARCH -->

<%ArrayList<MatHang> listFounded=(ArrayList<MatHang>)request.getAttribute("listFoundedProduct"); %>
<table class="table table-bordered" style="width:1000px;margin:0 auto;">
<tr>
<th>Tên Sản Phẩm</th>
<th>Hình Ảnh</th>
<th>Mô Tả</th>
<th>Giá</th>
</tr>
<%for(int i=0;i<listFounded.size();i++){ %>
<tr><td><h4 style="width: auto;"><%=listFounded.get(i).getTen() %>:</h4></td>


<td><img style="float: left; margin-left: 30px; margin-right:30px;" alt="" src="<%=listFounded.get(i).getDuongDan()%>" width="140" height="140" class="img-rounded"></td>


<td><h4 ><%=listFounded.get(i).getMota() %></h4></td>
<td><h4 style="color: red;"><%=format.addDotToTheNumber(listFounded.get(i).getGia() )%> VNĐ</h4></td>
    <td><form action="XuLyKhachHangMuaHang" method="post">
     <input type="hidden" name="SoLuongConLaiSanPhamDuocDatHang" value="<%=listFounded.get(i).getSoLuongConLai()%>">
<input type="hidden" name="TenSanPhamDuocDatHang" value="<%= listFounded.get(i).getTen() %>">
<input type="hidden" name="GiaSanPhamDuocDatHang" value="<%= listFounded.get(i).getGia() %>">
<input type="hidden" name="DuongDanSanPhamDuocDatHang" value="<%= listFounded.get(i).getDuongDan() %>">
<input type="hidden" name="MaSanPhamDatHang" value="<%=listFounded.get(i).getMaSanPham()%>">
<button type="submit" class="btn" style="background:#07b5ef; "><img src="image/XeDayShop.png" width="20px" height="20px"><fmt:message key="ThemVaoGioHang" /></button>
</form> </td>





</tr>
<%} %>
</table>
<%}%>
<div class="fb-comments" data-href="http://localhost:8080/DeTaiWEB/chiTietMatHangTimDuoc.jsp" data-numposts="5" data-width="100%" style=""></div>
</div>
</body>
</html>
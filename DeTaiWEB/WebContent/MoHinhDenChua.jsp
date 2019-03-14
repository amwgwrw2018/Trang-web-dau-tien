<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="Model.FormatNumber"%>
<%@page import="Model.MatHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.QuanLyMatHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="vi">
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
  <script src="lib/jquery.viewportchecker.js"></script>

<title><fmt:message key="Shrine"/></title>
<style type="text/css">
	
	
  #menuItem{
    margin-right: 20px;
    background-color: green;
  }
</style>

</head>
<body onload="getPage(1,8,'ShrineProducts')">
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.9&appId=435417870144786";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
 <fmt:setBundle basename="CreateUserGUI" scope="session"/> 
<%QuanLyMatHang qlmh=new QuanLyMatHang(); %>
<%ArrayList<MatHang> listShrine=qlmh.getAllShrine(); 
if(request.getAttribute("byPrice")!=null){
listShrine.sort(new Comparator<MatHang>(){
	public int compare(MatHang o1, MatHang o2){
	return 	o1.getGia()>o2.getGia() ? 1 : o1.getGia()==o2.getGia() ? 0 : -1;
				
	}
});
}
if(request.getAttribute("byName")!=null){
	listShrine.sort(new Comparator<MatHang>(){
		public int compare(MatHang o1, MatHang o2){
			return 	o1.getTen().compareToIgnoreCase(o2.getTen());
						
			}
		});
}
FormatNumber format=new FormatNumber();
%>

<div id="divForEachParts">
<jsp:include page="menu.jsp" />
<h2 style="border-bottom: 1px dotted black;"><fmt:message key="Shrine"/></h2>
<jsp:include page="khungDanhSachChonLuaMatHang.jsp" />
<form id="sorting" method="post" action="XuLySapXepMatHang" class="form-group" >
<input type="hidden" value="<%=this.getClass().getSimpleName().replaceFirst("_jsp",".jsp") %>" name="currentURL">
<select name="typeOfSorting" onchange="sort()" class="form-control" style="width: 30%; float: left;">
<option><fmt:message key="SortLabel" /></option>
  <option value="byName" <%if((request.getParameter("typeOfSorting")!=null)&&(((String)request.getParameter("typeOfSorting")).equals("byName"))){ %> selected <%} %>><fmt:message key="SortByName" /></option>
   <option value="byPrice" <%if((request.getParameter("typeOfSorting")!=null)&&(((String)request.getParameter("typeOfSorting")).equals("byPrice"))){ %> selected <%} %>><fmt:message key="SortByPrice" /></option>
    

</select>
</form>

<div  id="khungChiTiet">
  <div id="tieuDeChiTiet" class="well"><h3><img src="image/shrineIcon.png" width="40" height="40"><fmt:message key="Shrine"/></h3></div>
   <div id="detailForEachType">
  <%for(MatHang mh:listShrine){ %>

<div class="ShrineProducts">
<img alt="" src="<%=mh.getDuongDan()%>" width="203" height="203" class="img-rounded" data-toggle="modal" data-target="#myModal<%=mh.getMaSanPham()%>" onclick="addLuotXem('<%=mh.getMaSanPham()%>')">

<div id="myModal<%=mh.getMaSanPham()%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Sản Phẩm:<%=mh.getTen() %></h4>
      </div>
      <div class="modal-body">
     <img alt="" src="<%=mh.getDuongDan()%>" width="100" height="100" class="img-rounded">
     <h5>Giá:<%=format.addDotToTheNumber(mh.getGia()) %></h5>
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
<p>Lượt Xem:<%=mh.getLuotXem() %></p>
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


<div id="phanTrangShrine">
  <ul class="pagination">
  
<%for(int i =1;i<=listShrine.size()/8+1;i++){ %>
<li>
<a onclick="getPage(<%=i+8*(i-1)%>,<%=i*8%>,'ShrineProducts')"><%=i %></a>
</li>
<%} %>
  </ul>
</div>





<div id="end" style="clear: both;"></div>
</div>
<jsp:include page="bottomOfThePage.jsp"></jsp:include>
<div class="fb-comments" data-href="http://localhost:8080/DeTaiWEB/MoHinhDenChua.jsp" data-width="100%"  data-numposts="5"></div>
</div>
</body>
</html>
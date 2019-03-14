<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#khungDanhSach div a{
transition:0.5s color,0.5 font-size;

}
#khungDanhSach div a:hover{
text-decoration:none;
font-size: 15px;
}


</style>
</head>
<body>

<div id="tieuDeDanhSach"><h3><fmt:message key="DanhMucMatHang" /></h3></div>
<div id="khungDanhSach" >





<div><a href="MoHinhKyQuanTheGioi.jsp"><span class="  glyphicon glyphicon-triangle-right"></span><fmt:message key="KyQuanTheGioi" /></a></div>
<div><a href="MoHinhNhaDanDung.jsp"><span class="  glyphicon glyphicon-triangle-right"></span><fmt:message key="Nha" /></a></div>
<div><a href="MoHinhDenChua.jsp"><span class="  glyphicon glyphicon-triangle-right"></span><fmt:message key="Chua" /></a></div>
<div><a href="MoHinhKienTrucChauAu.jsp"><span class="  glyphicon glyphicon-triangle-right"></span><fmt:message key="KTChauAu" /></a></div>

<div><a href="MoHinhNhanVatHoatHinh.jsp"><span class="  glyphicon glyphicon-triangle-right"></span><fmt:message key="NVHoatHinh" /></a></div>
<div><a href="MoHinhDongVat.jsp"><span class="  glyphicon glyphicon-triangle-right"></span><fmt:message key="MHDongVat" /></a></div>
<div><a href="MoHinhCayCoi.jsp"><span class="  glyphicon glyphicon-triangle-right"></span><fmt:message key="MHCayCoi" /></a></div>
<div><a href="MoHinhXeCo.jsp"><span class="  glyphicon glyphicon-triangle-right"></span><fmt:message key="MHXe" /></a></div>






</div>

</body>
</html>
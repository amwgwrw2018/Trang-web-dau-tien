
<%@page import="Model.FormatNumber"%>
<%@page import="Model.MatHang"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title><fmt:message key="thanhtoandonhang" /> </title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
  <link rel="stylesheet" href="lib/css/bootstrap.min.css">
  <link rel="stylesheet"  href="lib/css/bootstrap-theme.min.css"> 
  <script src="lib/jquery-3.2.0.min.js"></script>
  <script src="lib/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="cssQuanTrong.css">

  <script src="lib/jquery.viewportchecker.js"></script>
  <link rel="stylesheet" type="text/css" href="thanhToanCss.css">
</head>
<body>
<%long tong=0; %>
 <fmt:setBundle basename="CreateUserGUI" scope="session"/>  
 <div id="divForEachParts">
<jsp:include page="menu.jsp" />
<div id="khungThanhToan" >
	<div id="tieuDe"><h2><fmt:message key="thanhtoandonhang" /> </h2></div>
<div id="layout1">
	<p><strong><fmt:message key="product" /> </strong></p>
<div id="content1">
<%ArrayList<MatHang> listProductOrder=(ArrayList<MatHang>)session.getAttribute("listProductOrder"); 
FormatNumber format=new FormatNumber();
%>

<%if(session.getAttribute("listProductOrder")!=null){ %>

<%for(int i=0;i<listProductOrder.size();i++){ %>
<%tong+=(listProductOrder.get(i).getGia()*(listProductOrder.get(i).getSoLuongDatHang())); %>
<div style="margin: 10px;"><img src="<%=listProductOrder.get(i).getDuongDan() %>" width="70" height="70"><span><%=listProductOrder.get(i).getTen() %></span>
<form action="ChangeNumberOfOrderedProduct" method="post" id="changePdForm" >
<input type="hidden" name="index" value="<%=i%>">
<label><fmt:message key="number"/> :</label><br>
<input type="number" name="soLuongMua" min="1" max="<%=listProductOrder.get(i).getSoLuongConLai()%>" value="<%=listProductOrder.get(i).getSoLuongDatHang()%>">
</form>
<button class="btn" onclick="document.getElementById('changePdForm').submit()"><fmt:message key="suasp"/> </button>

<form action="XoaSanPham" method="post" id="removePdForm" style="display: none;">
<input type="hidden" name="index" value="<%=i%>">
</form>
<button class="btn btn-danger" onclick="document.getElementById('removePdForm').submit()"><span class="glyphicon glyphicon-remove"></span><fmt:message key="xoasp"/> </button>
<p>Giá: <%=format.addDotToTheNumber(listProductOrder.get(i).getGia()) %> VNĐ</p>
</div>
<%} %>

<%} %>











</div>

<div><h3><fmt:message key="total"/> : <%=format.addDotToTheNumber(tong)%> VNĐ</h3></div>
</div>
<form action="LuuThongTinKhachHangKhiThanhToan" method="post" id="FormInfo">
<div id="layout2" >
	<input type="hidden" name="tongTien" value="<%=tong%>">
	<p><strong><fmt:message key="ttgiaohang"/> </strong></p>

	<div id="content2">

	<ul class="form-style-1">
	<li><input id="thongTin" type="checkbox" name="macdinh" value="yes" onchange="check()" <%if(session.getAttribute("LoginWithGoogleOrFacebook")!=null){ %> disabled <%} %>><fmt:message key="useDefault"/></li>
	<li><label><fmt:message key="HoTen"/>:</label><input id="name" type="text" name="name" class="field-long" <%if(request.getParameter("name")!=null){ %> value="<%=request.getParameter("name") %>" <%} %>/></li>
	<%if(request.getAttribute("errorName")!=null){ %>
	<li><p style="color:red;"><%=(String)request.getAttribute("errorName") %></p></li>
	<%} %>
	<li><label><fmt:message key="Phone"/>:</label><input id="phone" type="text" name="phone" class="field-long" <%if(request.getParameter("phone")!=null){ %> value="<%=request.getParameter("phone") %>" <%} %>/></li>
	<%if(request.getAttribute("errorPhone")!=null){ %>
	<li><p style="color:red;"><%=(String)request.getAttribute("errorPhone") %></p></li>
	<%} %>
	<li><label><fmt:message key="Address"/>:</label></li>
	<%if(request.getAttribute("errorAddress")!=null){ %>
	<li><p style="color:red;"><%=(String)request.getAttribute("errorAddress") %></p></li>
	<%} %>
	<li><textarea id="diachi" name="diachi" style="width: 100%;height: 100px;" required><%if(request.getParameter("diachi")!=null){ %><%=request.getParameter("diachi") %><%} %></textarea> </li>
	


  

   

</ul>
 
	<div style="border-top: 1px solid #d2dbd4;padding-top: 20px;">
	<div style="text-align: center;">
	<p><strong><fmt:message key="ghichu"/> </strong></p>
<textarea style="width: 90%;height: 100px;" name="ghiChu"></textarea>
</div>
	</div>

	</div>

</div>
<div id="layout3">
	
	<p><strong><fmt:message key="hinhthuctt"/> </strong></p>
	
<div class="hinhThuc">

<div><input type="radio" name="hinhThucThanhToan" value="Thanh Toán Bằng Tiền Mặt(COD)" /><label id="payMoney"><img src="image/payMoney.png" width="50" height="50"><fmt:message key="tienmat"/> </label></div>
       <div><input type="radio" name="hinhThucThanhToan" value="Thanh Toán Bằng Thẻ ATM" /><label id="payMoney"><img src="image/ATM.png" width="50" height="50"><fmt:message key="atm"/> </label></div>

<%if(request.getAttribute("missingHowToPurchase")!=null){ %>
<p style="color: red;"><%=(String)request.getAttribute("missingHowToPurchase") %></p>
<%} %>
</div>
	
</div>

</form>
</div>


<button id="submitThanhToan" class="btn" onclick="document.getElementById('FormInfo').submit()" ><fmt:message key="thanhtoan" /> </button>
</div>
<script type="text/javascript">
function check(){
if(document.getElementById("thongTin").checked){
	document.getElementById("name").disabled=true;
	document.getElementById("phone").disabled=true;
	document.getElementById("diachi").disabled=true;
}else{
	document.getElementById("name").disabled=false;
	document.getElementById("phone").disabled=false;
	document.getElementById("diachi").disabled=false;
}
}
	$(".hinhThuc :radio").hide().click(function(e){
    e.stopPropagation();
});
$(".hinhThuc div").click(function(e){
    $(this).closest(".hinhThuc").find("div").removeClass("selected");
    $(this).addClass("selected").find(":radio").click();
});
$(document).ready(function(){

    $.ajax({
        url : "menu.jsp",
        type : "post",
        dataType:"text",
        data : {
             
        },
        success : function (result){
            $('#menu').html(result);
        }
    });
	
});
</script>
</body>
</html>
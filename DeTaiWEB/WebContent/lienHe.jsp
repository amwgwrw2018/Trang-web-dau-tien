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

  <script src="lib/jquery.viewportchecker.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".foot").viewportChecker({
		 classToAdd: 'visible animated fadeInDown',
	        offset: 100,
	      
	});
    $.ajax({ //XỬ LÝ AJAX CHO MENU
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
</head>
<body>
<div id="divForEachParts">
<jsp:include page="menu.jsp" />
  <p>LIÊN HỆ<br>

Shop Mô Hình là shop online chuyên bán các loại mô hình dùng để trưng bày hoặc trang trí cho không gian của bạn <br>

Địa Chỉ: Khu phố 6- Phường Linh Trung - Quận Thủ Đức, Hồ Chí Minh<br>
Email hỗ trợ abc@gmail.com<br>
Hotline 090.8268.007 (Vui lòng gọi trước khi đến)<br>


Với các bạn ở xa có thể gửi vào 1 trong 3 Tài Khoản sau:<br>
<br>
1.Ngân hàng ACB<br>
Chủ TK: Nguyễn Tấn Nhựt<br>
Số TK: 143091319<br>
<br>

2.Ngân hàng Đông Á<br>
Chủ TK: Lê Hiếu Nghĩa<br>
Số TK: 0103931732<br>
<br>

3.Ngân hàng Vietcombank<br>
Chủ TK: Huỳnh Hồng Đức<br>
Số TK: 0421000442816<br>
</p>
<h1>Địa Chỉ Chi Tiết:</h1>
<img src="image/map.png">

</div>
</body>
</html>
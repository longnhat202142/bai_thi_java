<%@page import="bean.thanhtoanthibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.giohangthibo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh toán</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
</head>
<style type="text/css">
.actives {
			background-color: #ff5400b3; /* Màu nền đỏ */
			color: black; /* Màu chữ đen đậm */
			font-weight: bold; /* In đậm chữ */
		}
		li{
		 list-style: none;
		}
		ul li a{
			 color:black;
			 font-weight: 600;
		}
		ul li {
		font-weight: 600;
		
		}
		@media (max-width:739px){
			.tieude{
			display:none;
			}
		}
		article{
		margin-right:20px;
		}
		.navbar-form .form-group {
		margin-bottom: 0;
		}
		.navbar-form .btn {
		margin-left: 10px;
		}
		.navbar-right .glyphicon-shopping-cart {
		margin-right: 5px;
		}
		.carousel-inner {
		width: 80%;
		margin: 0 auto; /* Căn giữa theo chiều ngang */
		}
		.carousel-inner .item img {
		max-width:100%;
		height: auto;
		display: block;
		margin: 0 auto; /* Căn giữa theo chiều ngang */
		}
		.img-hover:hover{
		 transform: scale(1.2) rotateY(10deg);
		opacity: 0.8;
		}
		.img-hover {
		transition: transform 0.3s ease, opacity 0.3s ease;
		opacity: 1;
		transform-style: preserve-3d;
		}
		.giay-a{
		box-shadow: rgba(6, 24, 44, 0.4) 0px 0px 0px 2px, rgba(6, 24, 44, 0.65) 0px 4px 6px -1px, rgba(255, 255, 255, 0.08) 0px 1px 0px inset;
		margin-bottom:15px;
		padding-top:5px;
		width:30%;
		height:30px;
		text-decoration: none;
		color: black;
      	background: #b5ff007d;
		}
		.giay-p{
		 text-align: center;
		 font-weight: 700;
		 font-size: 25px;
		 position: absolute;
		  top: 50%;
		 left: 40%;
		  transform: translate(-40%, -50%);
		 
		}
		.giay-p_a{
		 box-shadow: rgba(0, 0, 0, 0.08) 0px 1px 2px, rgba(0, 0, 0, 0.08) 0px 2px 4px, rgba(0, 0, 0, 0.08) 0px 4px 8px, rgba(0, 0, 0, 0.08) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.08) 0px 32px 64px;
		 background: black;
		 padding:10px 15px;
		 border-radius:4px;
		 margin-left:10px;
		 text-decoration: none;
		 outline: none;
		}
		.footer {
		  display: grid;
		  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
		  grid-gap: 20px;
		  background-color: #f2f2f2;
		  padding: 20px;
		}
		
		.footer__column {
		  text-align: left;
		}
		
		.footer__column h4 {
		  margin-top: 0;
		}
		
		.footer__column ul {
		  list-style: none;
		  padding: 0;
		  margin: 0;
		}
		
		.footer__column li {
		  margin-bottom: 10px;
		}
		
		@media screen and (max-width: 600px) {
		  .footer {
		    grid-template-columns: 1fr;
		  }
		}
		a {
		  text-decoration: none;
		}
		
		a:hover {
		  text-decoration: none;
		}

		.soHangTrongGio{
	   color: #fff;
	   background-color: red;
	   width: 17px;
	   display: block;
	   text-align: center;
	   border-radius: 50%;
	   position: absolute;
	   top: 4px;
	   right: 0;
    	}
</style>
<body>

<nav style="background: #0000008f;margin-bottom:0;border-bottom:none;text-align: center;" class="navbar navbar-inverse tieude">
		
	<div class="container-fluid">
	<ul class="nav navbar-nav">
	<li><a href="#" style="border-right: 1px solid white;height:20px;padding: 0px 10px;margin: 15px auto;">
	Hotline:0966158666(8h – 21h30)</a></li>
	<li><a href="#">Liên hệ hợp tác</a></li>
	</ul>
	<ul class="nav navbar-nav navbar-right">
	<li><a href="#" style="border-right: 1px solid white;height:20px;padding: 0px 10px;margin: 15px auto;">Tìm cửa hàng</a></li>
	<li><a href="#" style="border-right: 1px solid white;height:20px;padding: 0px 10px;margin: 15px auto;">Kiểm tra hàng</a></li>
	<li><a href="#">Mua hàng tại Shopify</a></li>
	</ul>
	</div>
	</nav>
	<nav class="navbar navbar-inverse" style="background:#00ceff61">
	<div class="container-fluid">
	<div class="navbar-header">
	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	</button>
	<a class="navbar-brand" href="#">
			<img src="anhlogo.jpg" style="width:45px; display: block; margin:-9px -8px;">
			</a>
	</div>
	<div class="collapse navbar-collapse" id="myNavbar">
	<ul class="nav navbar-nav">
	<li><a href="giaycontroller">Trang chủ</a></li>
	<li><a href="giaycontroller">Tất cả sản phẩm</a></li>
	<%if (session.getAttribute("dangnhaplayten")!=null){%>
	<li><a href="giogiaycontroller">Giỏ hàng
	
	</a></li>
	<li><a href="thanhtoanthicontroller">Thanh toán</a></li>
	<li><a href="lichsuthicontroller">Lịch sử mua hàng	</a></li>
	<%}else{ %>
	
	<li><a href="" data-toggle="modal" data-target="#loginModal" >Giỏ hàng</a></li>
	<li><a href="" data-toggle="modal" data-target="#loginModal">Xác nhận đặt mua</a></li>
	<li><a href="" data-toggle="modal" data-target="#loginModal">Thanh toán</a></li>
	<li><a href="" data-toggle="modal" data-target="#loginModal">Lịch sử mua hàng</a></li>
	<%} %>
	</ul>
	<ul class="nav navbar-nav navbar-right">
	<li style="padding-bottom: 19px">
	
	<div style="margin-top:12px">
				 <!-- Trigger the modal with a button --> 
				 <!-- <input type="submit" data-toggle="modal" data-target="#myModal" value="Đăng ký" style="border-radius:5px">-->
				 <%if (session.getAttribute("dangnhaplayten")==null) {%>
				 <a href="#" data-toggle="modal" data-target="#myModal" style="color: black;text-decoration: none;padding:0 20px">
				 <span class="glyphicon glyphicon-user"></span> Đăng ký</a>
				 <%} %>
				 <!-- Modal -->
				 <div class="modal fade" id="myModal" role="dialog">
				 <div class="modal-dialog">
				 <!-- Modal content-->
				 <div class="modal-content">
				 <div class="modal-header">
				 <button type="button" class="close" data-dismiss="modal">&times;</button>
				 <form action="khachhangthicontroller" method="post">
							<div class="form-group">
						 	 Nhập họ và tên: <br>
						 	<input type="text" class="form-control" name="txtht" required>
						 </div>
					 		<div class="form-group">
							 Nhập địa chỉ:<br>
							 <input type="text" class="form-control" name="txtdc" required>
					 	</div>
					 	
					 	<div class="form-group">
							 Nhập số điện thoại: <br>
							 <input type="text" class="form-control" name="txtsdt" required>
					 	</div>
					 	<div class="form-group">
							 Nhập gmail:<br>
							 <input type="email" class="form-control" required name="txtemail">
					 	</div>
					 	<div class="form-group">
							 Nhập tên đăng nhập:<br>
							 <input type="text" class="form-control" required name="txtun">
					 	</div>
					 	<div class="form-group">
							 Nhập mật khẩu:<br>
							 <input type="password" class="form-control" required name="txtpasslan1">
					 	</div>
					 	<div class="form-group">
							 Nhập lại mật khẩu:<br>
							 <input type="password" class="form-control" required= name="txtpasslan2">
					 	</div>
					 	<div class="modal-footer">
						
						 <input type="submit" class="btn btn-primary" name="btndangki" value="Đăng ký"
						 style="width:100%">
						 <p style="text-align: center">Bằng việc đăng kí, bạn đã đồng ý với shop về 
						 <a href="#" style="color:orange;">Điều khoản dịch vụ</a> & 
						 <a href="#" style="color:orange;">Chính sách bảo mật</a>
						 </p>	
				 </div>
				</form>
				 </div>
				
				 
				 </div>
				
				 </div>
				 </div>
		</div>
		 
		
		
		
	</li>
	
	<li style="padding-bottom: 19px">
	<div style="margin-top:12px">
					<!-- Nút Đăng nhập -->
		<%
			if (session.getAttribute("dangnhaplayten")!=null){%>
				<a href="#" data-toggle="modal" data-target="#loginModal" style="color: black;text-decoration: none;padding:0 20px">
				Welcome : <%=(String) session.getAttribute("dangnhaplayten")%>
				</a>
		<%}else {%>
		<a href="#" data-toggle="modal" data-target="#loginModal" style="color: black;text-decoration: none;padding:0 20px">
		
			<span class="glyphicon glyphicon-log-in" ></span> Đăng nhập</a>
			<%} %>
					<!--<a data-toggle="modal" data-target="#loginModal">Welcome</a> --->
					<!-- Modal Đăng nhập -->
				<div class="modal fade" id="loginModal" role="dialog">
					<div class="modal-dialog">
					 <!-- Modal content-->
					   <div class="modal-content">
					 	<div class="modal-header">
					 		<button type="button" class="close" data-dismiss="modal">&times;</button>
					 			<form class="form-horizontal" method="post" action="khachhangthicontroller">
					 				<div class="form-group">
							 	<div class="col-sm-12 ">
							 Tên đăng nhập:
							 <input type="text" class="form-control" placeholder="Tên đăng nhập" name="txttendangnhap">
							 	</div>
					 			</div>
							 <div class="form-group">
							 <div class="col-sm-12 ">
							 Mật khẩu:
							 <input type="password" class="form-control" placeholder="Mật khẩu" name="txtpassword">
							 </div>
					 		</div>
							 <div class="modal-footer">
							 		<input type="submit" class="btn btn-primary" value="Đăng nhập" style="width:100%">
							 	 	
							 </div>
					 		</form>
					 </div>
					
					 </div>
					 </div>
					</div>
				 </div></li>
			<li><a href="dangxuatthicontroller"><span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>		 
				 
		 <!-- Kiem tra dang nhap sai -->
		 <%
		 	if (request.getParameter("ktpass")!=null){%>
		 	<script type="text/javascript">
		 		alert("Dang nhap sai ! Hay dang nhap lai");

		 	</script>
		 	
		 <%}%>		 
				 

	</ul>
	</div>
	</div>
	</nav>


<!--  PHẦN THÂN BÀI -->
<div class="container" style="margin-top: 40px;">  
  <div class="row">
  	<div class="col-sm-12">
  	<% 
  	ArrayList <thanhtoanthibean> dsthanhtoan= (ArrayList<thanhtoanthibean>) request.getAttribute("dsthanhtoan");%>
  		<%if (dsthanhtoan!=null){
  		long tongtien = 0;
  		%>
  		<h2>DANH SÁCH SẢN PHẨM CHƯA THANH TOÁN</h2>
  		<table border='1' width='100%' class="table table-hover">
  		<%
  		int n = dsthanhtoan.size();
  		for (int i=0;i<n;i++){ 
  		 thanhtoanthibean g =dsthanhtoan.get(i) ;
  		%>
  			<tr>
  			<td style="padding:10px;">
  			<img height="100" width="100" src="<%=g.getAnh()%>"> 
  			</td>
  			<td><%=g.getTengiay() %></td>
  			<td><%=g.getGia() %></td>
  			<td><%=g.getSoluongmua() %></td>
  			<td><%=g.getThanhtien()%></td>
  			
  		</tr>
  <%}
  		%>
  		</table>
  <form action="lichsuthicontroller" id="formthanhtoan" method="post">
  </form>
  <div class="row">
	<div class="col-sm-12 text-left">
		<h2 style="font-weight: 600;">Thông tin của bạn:</h2>
		<div style="font-size: 20px;" class="row">
			<div style="width: 50%" class="col-sm-6 text-left">
				<b>Họ tên:</b> <input style="width: 100%; margin-bottom: 10px;"  type="text" name="hoten" value="<%= dsthanhtoan.get(0).getHoten()%>" disabled>
				<b>Địa chỉ:</b> <input style="width: 100%" type="text" name="diachi" value="<%= dsthanhtoan.get(0).getDiachi() %>" disabled>
			</div>
			<div style="width: 50%" class="col-sm-6 text-left">
				<b>Số điện thoại:</b> <input style="width: 100%; margin-bottom: 10px;" type="text" name="sodt" value="<%=dsthanhtoan.get(0).getSodienthoai() %>" disabled>
				<b>Email:</b> <input style="width: 100%" type="text" name="email" value="<%= dsthanhtoan.get(0).getEmail()%>" disabled>
			</div>
		</div>
	</div>
  </div>
  
    <div class="row">
		<div class="col-sm-12 text-left">
		<% 
		for(thanhtoanthibean h: dsthanhtoan){
			tongtien += h.getThanhtien();
		}
		%>
		<table style="width: 100%; border-top: 2px solid #ccc; margin-top: 30px;">
			<tr style="font-size: 18px; display: flex; justify-content: space-between; margin: 0 100px; margin-top: 20px;">
				<td style="width: 200px; text-align: center;">Tạm tính (<%=dsthanhtoan.size() %> sản phẩm) </td>
				<td style="width: 200px; text-align: center;"><%=tongtien %> VNĐ</td>
			</tr>
			<tr style="font-size: 18px; display: flex; justify-content: space-between; margin: 0 100px; margin-top: 10px;">
				<td style="width: 200px; text-align: center;">Phí giao hàng </td>
				<td style="width: 200px; text-align: center;">0 VNĐ</td>
			</tr>
			<tr style="font-size: 18px; display: flex; justify-content: space-between; margin: 0 100px; margin-top: 10px;">
				<td style="width: 200px; text-align: center;">Giảm giá </td>
				<td style="width: 200px; text-align: center;">0 VNĐ</td>
			</tr>
			<tr style="font-size: 18px; display: flex; justify-content: space-between; margin: 0 100px; margin-top: 10px;">
				<td style="width: 200px; text-align: center;"><b style="line-height: 35px; display: block;">Tổng tiền</b> </td>
				<td style="width: 200px; text-align: center;"><b style="font-size: 25px; color: red;"><%=tongtien %> VNĐ</b></td>
			</tr>
			<tr style="font-size: 18px; display: flex; justify-content: center; margin: 0 100px;  margin-top: 20px;">
				<td><input name="btndathang" type="submit" style=" background-color: #11c12ca3; border-radius: 20px; width: 400px;  height: 40px; color: white; font-size: 25px; display: block; text-align: center; line-height: 40px;" form="formthanhtoan" value="Đặt Mua Hàng"></input> </td>
			</tr>			
		</table>
		</div>
	</div>
	<%} else{%>
		<h2>Bạn chưa có sản phẩm nào để thanh toán</h2>
	<%}%>
	

  
  </div>
  </div>
</body>
</html>
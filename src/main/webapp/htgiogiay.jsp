<%@page import="bo.giohangthibo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaigiaybean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
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
	<%if (session.getAttribute("ggiay")!=null) {
		giohangthibo g= null;
		g = (giohangthibo) session.getAttribute("ggiay");
		int sl = g.dsgiohang.size();
		 if (sl!= 0){%>
			 <span class="soHangTrongGio"><%=sl%></span>
		 <%} %>

	<%}%>
	</a></li>
	<li><a href="thanhtoanthicontroller">Thanh toán</a></li>
	<li><a href="lichsuthicontroller">Lịch sử mua hàng	</a></li>
	<%}else{ %>
	
	<li><a href="" data-toggle="modal" data-target="#loginModal" >Giỏ hàng</a></li>
	<li><a href="" data-toggle="modal" data-target="#loginModal">Xác nhận đặt mua</a></li>
	<li><a href="" data-toggle="modal" data-target="#loginModal">Thanh toán</a></li>
	<li><a href="" data-toggle="modal" data-target="#loginModal">Lịch sử mua hàng</a></li>
	<%} %>
	</a></li>
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
				 
				 
		 <!-- Kiem tra dang nhap sai -->
		 <%
		 	if (request.getParameter("ktpass")!=null){%>
		 	<script type="text/javascript">
		 		alert("Dang nhap sai ! Hay dang nhap lai");

		 	</script>
		 	
		 <%}%>		 
				 
	<li><a href="dangxuatthicontroller"><span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
	</ul>
	</div>
	</div>
	</nav>
	
	
	<!-- PHẦN HIỂN THỊ GIỎ HÀNG-->
	
	<form action="giogiaycontroller" method="post" id="form-checkbox-xoa">
	</form>
	
	<div class="container">
    
	<table>
		<%
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		int n=0;
		if (session.getAttribute("ggiay")!=null){
			
			giohangthibo g = new giohangthibo();
			g = (giohangthibo) session.getAttribute("ggiay");
			 n = g.dsgiohang.size();%>
			<table border='2' width='100%' class="table table-hover">
			<%if (n!=0) {%>
			<tr style="color:red;background: gray">
				<td><b>Hinh anh</b></td>
			 	<td><b>Ten sach</b></td>
			 	<td><b>Gia </b></td>
			 	<td><b>So luong mua</b></td>
			 	<td><b>Thanh tien</b></td>
			 	
			 <tr>
			<%}%>
			<% for (int i = 0 ; i < n ;i++){%>
				<tr>
		   <td style="padding:10px;">
			<img  height="100" width="100" src="<%=g.dsgiohang.get(i).getAnh() %>">
			</td>
			<td><%=g.dsgiohang.get(i).getTengiay() %></td>
			<td><%=g.dsgiohang.get(i).getGia() %></td>
			<td><%=g.dsgiohang.get(i).getSoluongmua()%></td>
			<td><%=g.dsgiohang.get(i).getThanhtien()%></td>	
			
			<td>
			<form action="suagiaycontroller?mgiay=<%=g.dsgiohang.get(i).getMagiay()%>" method="post">
				<input type="number" style="width:60px" name="Sua">
				<input type="submit" value="Cập nhật" name="btnsua" class="btn btn-primary">
			</form>
			</td>
			
			 <td>
			 <a href="xoagiaycontroller?mgiay=<%=g.dsgiohang.get(i).getMagiay()%>">X</a>
			 </td>
			 <td valign="middle" width="50px" height="60px">
			 <input type="checkbox" name="<%=g.dsgiohang.get(i).getMagiay()%>" form="form-checkbox-xoa">
			 </td>
			</tr>		
			<%}%>
			</table>
			
			<%if (n!=0) {%>
			<div class="left">
			<a href="giaycontroller" class="btn btn-success" style="margin-top:10px;color:black" >Tiếp tục mua hàng</a>
			<a href="xacnhanthicontroller" class="btn btn-info" style="margin-top:10px;color:black" >Xác nhận đặt mua</a>
			<input type="submit" name="btnxoa" value="Xóa" form="form-checkbox-xoa" class="btn btn-info" style="margin-top:10px;color:black">
			<div style="margin-top:10px;" class="btn btn-info"><a style="color:black;font-size:600" href="tragiaycontroller">Trả lại hàng</a></div>
			</div>
			<div style="margin-top:10px" align="right"><p style="color:red;font-size:20px;font-weight: 600">Tổng tiền : <%=g.TongTienGiay()%> VND</p></div>
		<%}%>
		<%}%>
		
		
		<%if (session.getAttribute("ggiay")==null || n==0) {%>
		<div>Giỏ hàng đang trống. Mời bạn  <a href="giaycontroller" class="btn btn-success">Chọn mua hàng</a></div>
	
	<%} %>
	</table>
	</div>
</body>
</html>
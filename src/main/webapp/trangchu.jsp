<%@page import="bo.giohangthibo"%>
<%@page import="bean.giaybean"%>
<%@page import="bean.loaigiaybean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		    pageEncoding="UTF-8"%>
		<!DOCTYPE html>
		<html>
		<head>
		<meta charset="UTF-8">
		<title>Trang chủ</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
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
		width:25%;
		height:45px;
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
    	.hienthigiohang{
    	width:400px;
    	
    	top:calc(100% + 6px);
    	background-color: #008cff2b;
    	z-index:2;
    	position: absolute;
    	box-shadow: 0 2px 12px #ccc;
 		display:none;
 		animation: fadeIn ease-in 0.2s;
 		cursor: pointer;
    	}
    	.hienthigiohangksanpham{
    	
    	}
    	@keyframes fadeIn{
    	from
    		opacity: 0;
    	to
    		opacity: 1;	
    	}
    	
    	.sanpham::after{
    	 	content: "";
    	 	position: absolute;
    		left:20px;
    		top:-30px;
    		border-width: 15px;
    		border-style: solid;
    		border-color: transparent transparent #008cff2b transparent; 
    	}
    	.header-cart:hover .hienthigiohang{
    	 	display:block;
    	}
		
		</style>
	<script>
	$(document).ready(function() {
		 $("ul.nav li").click(function() {
		 $("ul.nav li").removeClass("actives"); // Xóa lớp 'actives' khỏi tất cả các nút
		 $(this).addClass("actives"); // Thêm lớp 'actives' vào nút được nhấp
		 // Kiểm tra nếu là menu "Tất cả sản phẩm" thì thay thế lớp 'dropdow' bằng 'actives'
		
		 });
		});
	</script>
	</head>
	<body>
	
	<!-- THANH NAVBAR -->
	<nav style="background: #0000008f;margin-bottom:0;border-bottom:none;text-align: center;" class="navbar navbar-inverse tieude">
		
	<div class="container-fluid">
	<ul class="nav navbar-nav">
	<li><a href="#" style="border-right: 1px solid white;height:20px;padding: 0px 10px;margin: 15px auto;">
	Hotline:0966158666(8h – 21h30)</a></li>
	<li><a href="#">Liên hệ hợp tác</a></li>
	</ul>
	<ul class="nav navbar-nav navbar-right">
	<li><a href="#"  data-toggle="modal" data-target="#myModal3" style="border-right: 1px solid white;height:20px;padding: 0px 10px;margin: 15px auto;">Quản lí shop</a></li>
				<div class="modal fade" id="myModal3" role="dialog">
					<div class="modal-dialog">
					 <!-- Modal content-->
					   <div class="modal-content">
					 	<div class="modal-header">
					 		<button type="button" class="close" data-dismiss="modal">&times;</button>
					 			<form class="form-horizontal" method="post" action="admindangnhapcontroller">
					 				<div class="form-group">
							 	<div class="col-sm-12 ">
							 Tên admin:
							 <input type="text" class="form-control" placeholder="Tên admin" name="txttenadmin">
							 	</div>
					 			</div>
							 <div class="form-group">
							 <div class="col-sm-12 ">
							 Mật khẩu:
							 <input type="password" class="form-control" placeholder="Mật khẩu" name="txtpasswordadmin">
							 </div>
					 		</div>
							 <div class="modal-footer">
							 		<input type="submit" name="addangnhap" class="btn btn-primary" value="Đăng nhập" style="width:100%">
							 	 	
							 </div>
					 		</form>
					 </div>
					
					 </div>
					 </div>
					</div>
			
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
	<li class="dropdow"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Hãng giày<span class="caret"></span></a>
	<ul class="dropdown-menu">
	<%
				 ArrayList<loaigiaybean> dsloaigiay = (ArrayList<loaigiaybean>)request.getAttribute("dsloaigiay");
				 for (loaigiaybean sloai:dsloaigiay){%>
					 <li><a href="giaycontroller?maloai=<%=sloai.getMaloai()%>">
					  <%=sloai.getTenloai()%>
					 </a></li>
				<% }%>
	</ul>
	</li>
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
							 <input type="password" class="form-control" required name="txtpasslan2">
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
	<!-- PHẦN THANH TÌM KIẾM -->
	<nav class="navbar navbar-inverse" style="background: #fcf8e3e0; margin-top: -19px;border-top: none;">
		<div class="container">
			<div class="row">
			<div class="collapse navbar-collapse " id="myNavbar">
				<ul class="nav navbar-nav tieude">
				<%
				
				 for (loaigiaybean sloai:dsloaigiay){%>
					 <li><a href="giaycontroller?maloai=<%=sloai.getMaloai()%>">
					  <%=sloai.getTenloai()%>
					 </a></li>
				 <% }%>
			
				
				</ul>
				<form class="navbar-form navbar-right"  action="giaycontroller">
					<div class="form-group">
						<input type="text" name="txttim" class="form-control" placeholder="Tìm kiếm..." style="width: 100%;">
					</div>
					<input type="submit" class="btn btn-default" value="Tìm kiếm">
				</form>
				
				<!-- HIEN THI SAN PHAM DA THEM KHI HOVER VAO -->
				
				
				<ul class="nav navbar-nav navbar-right" style="position: relative;">
					<li><a href="#" class="header-cart"><span class="glyphicon glyphicon-shopping-cart "></span>Giỏ hàng
						<div class="hienthigiohang">

							<% if (session.getAttribute("ggiay")!=null){
							giohangthibo g = new giohangthibo();
							g = (giohangthibo) session.getAttribute("ggiay");
			 				int n = g.dsgiohang.size();%>
			 				<%if(n!=0) %><p style="color:red;text-align: center;">Sản phẩm đã thêm</p> 
			 				<% if (n!=0){
			 					
			 				for (int i = 0 ; i < n ;i++){%>
			 				
			 				<ul  class="sanpham" style="display: flex;margin-top:5px;padding-left:0;justify-content: space-around;background-color:#0003;">
							<li style="color:black;font-weight: 600">
							<img  height="100" width="100" src="<%=g.dsgiohang.get(i).getAnh() %>">
							</li>
							
							<li style="color:black;margin-top:10px;">
							<%=g.dsgiohang.get(i).getTengiay()%>
							</li>
							<li style="color:orange;margin-top:10px;"><%=g.dsgiohang.get(i).getGia() %></li>

							</ul>
							<%}
			 				}
			 				else {%>
							<p style="color:red;text-align: center;">Chưa có sản phẩm</p>
							
							<%} %>
							<%} 
							
							else{%>
							<p style="color:red;text-align: center;">Chưa có sản phẩm</p>
							<%} %>
						</div>
					
					</a></li>
				</ul>
			</div>
		</div>
		</div>
	</nav>
	
	
	
	<!-- PHẦN THÂN BÀI -->
	<div class="container tieude" style="margin-top:-19px">
	
	<div id="myCarousel" class="carousel slide " data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
	<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	<li data-target="#myCarousel" data-slide-to="1"></li>
	<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<!-- Wrapper for slides -->
	<div class="carousel-inner" >
	<div class="item active">
	<img src="b1.jpg" alt="a1" >
	</div>
	<div class="item">
	<img src="b2.jpg" alt="a2" > 
	</div>
	<div class="item">
	<img src="b3.jpg" alt="a3">
	</div>
	
	</div>
	<a class="left carousel-control" href="#myCarousel" data-slide="prev" style="padding: 0">
	
	<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" data-slide="next" style="padding: 0">
	
	<span class="sr-only">Next</span>
	</a>
	</div>
	</div>


	<div class="container" style="margin-top:10px;text-align:center">
	  <h2><b>SẢN PHẨM</b></h2>
	  <p>Đây là sản phẩm của shop.</p>
	</div>
	
	<div class="container" style="margin-top:10px">
	
		<div class="row">
		<%
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		ArrayList<giaybean> dsgiay =(ArrayList<giaybean>) request.getAttribute("dsgiay");
		int n = dsgiay.size();
		for (int i = 0 ; i < n ;i++){
			giaybean giay = dsgiay.get(i);
		%>
		<div class="col-lg-4 col-md-6 col-xs-12" >
			<div style="border:2px solid #ddd;text-align:center;margin-bottom:15px;box-sizing: border-box">
			<div style="overflow: hidden;">
			<a href="motacontroller?magiay=<%=giay.getMagiay()%>&giagiay=<%=giay.getGia()%>
			&anhgiay=<%=giay.getAnh()%>&tengiay=<%=giay.getTengiay()%>" >
			<img  class="img-hover" height="200" style="width: 80%; height: 300px;" src="<%=giay.getAnh() %>">
			</a>
  			
  			</div>
			<p style="height: 20px; overflow: hidden;display: block;text-overflow: ellipsis;white-space: nowrap;"><%=giay.getTengiay()%></p>
			<p><b>Gia : <%=giay.getGia() %></b></p>
			<div style="display:flex;justify-content: space-around;">
			<%if (session.getAttribute("dangnhaplayten")!=null) {%>
			<a href="giogiaycontroller?mgiay=<%=giay.getMagiay()%>&tgiay=<%=giay.getTengiay()%>&gia=<%=giay.getGia()%>&anh=<%=giay.getAnh()%>" 
			class="giay-a">Đặt hàng</a>
			
			<%} else{%>
		
			<a href=""  data-toggle="modal" data-target="#loginModal" class="giay-a">Đặt hàng</a>
			<%}%>
			
			
			</div>
			</div>
		</div>
		
		<% }%>
	
		</div>
		</div>
		
		<div class="container" style="margin-top:10px;display:flex">
			
		   <article  class="tieude">
		   <h1>CÂU CHUYỆN, PHONG CÁCH VÀ TRANG PHỤC THỂ THAO TẠI ADIDAS, TỪ NĂM 1949</h1>
    		<p>Thể thao giúp chúng ta khỏe mạnh. Giữ cho bạn chánh niệm. Mang chúng ta lại với nhau. Thông qua thể thao, chúng ta có sức mạnh để thay đổi cuộc sống. Cho dù đó là thông qua những câu chuyện của các vận động viên truyền cảm hứng. Giúp bạn đứng dậy và di chuyển. Trang phục thể thao có các công nghệ mới nhất, để nâng cao hiệu suất của bạn. Đánh bại PB.adidas của bạn cung cấp một ngôi nhà cho vận động viên điền kinh, cầu thủ bóng rổ, trẻ em bóng đá, người đam mê thể dục. Người leo núi cuối tuần thích trốn khỏi thành phố. Giáo viên yoga truyền bá các động tác. 3-Stripes được nhìn thấy trong sân khấu âm nhạc. Trên sân khấu, lễ hội. Quần áo thể thao của chúng tôi giúp bạn tập trung trước khi tiếng còi cất lên. Trong cuộc đua. Và ở vạch đích. Chúng tôi ở đây để hỗ trợ người sáng tạo. Cải thiện trò chơi của họ. Cuộc sống của họ. Và thay đổi thế giới.
			adidas không chỉ là trang phục thể thao và quần áo tập luyện. Chúng tôi hợp tác với những người giỏi nhất trong ngành để cùng sáng tạo. Bằng cách này, chúng tôi mang đến cho người hâm mộ trang phục và phong cách thể thao phù hợp với nhu cầu thể thao của họ, đồng thời lưu ý đến tính bền vững. Chúng tôi ở đây để hỗ trợ người sáng tạo. Cải thiện trò chơi của họ. Tạo sự thay đổi. Và chúng tôi nghĩ về tác động của chúng tôi đối với thế giới của chúng tôi.</p>
		   </article>
		   
		   <article class="tieude">
		   <h1>Quần áo tập luyện, cho bất kỳ môn thể thao nào</h1>
    	    <p>thiết kế của adidas dành cho và đồng hành cùng các vận động viên thuộc mọi thể loại. Người sáng tạo, những người thích thay đổi trò chơi. Thách thức quy ước. Phá vỡ các quy tắc và xác định những quy tắc mới. Sau đó phá vỡ chúng một lần nữa. Chúng tôi cung cấp cho các đội và cá nhân quần áo thể thao trước trận đấu. Để luôn tập trung. Chúng tôi thiết kế trang phục thể thao giúp bạn về đích. Để giành chiến thắng trong trận đấu. Chúng tôi hỗ trợ phụ nữ với áo ngực và quần tất được sản xuất có mục đích. Hỗ trợ từ thấp đến cao. Thoải mái tối đa. Chúng tôi thiết kế, đổi mới và lặp đi lặp lại. Thử nghiệm các công nghệ mới trong hành động. Trên sân cỏ, đường đua, sân bóng, hồ bơi. Quần áo tập thể dục cổ điển truyền cảm hứng cho những trang phục dạo phố mới. Giống như NMD, Ozweego và bộ đồ thể thao Firebird của chúng tôi. Các mô hình thể thao cổ điển được đưa trở lại cuộc sống. Giống như Stan Smith. Và Siêu sao. Bây giờ được nhìn thấy trên đường phố và các sân khấu.
			Thông qua các bộ sưu tập của mình, chúng tôi làm mờ ranh giới giữa thời trang cao cấp và hiệu suất cao. Giống như bộ sưu tập quần áo thể thao adidas by Stella McCartney của chúng tôi – được thiết kế để phù hợp với cả bên trong và bên ngoài phòng tập. Hoặc một số món đồ phong cách sống adidas Originals của chúng tôi, cũng có thể được mặc như trang phục thể thao. Cuộc sống của chúng ta không ngừng thay đổi. Ngày càng trở nên đa năng hơn. Và adidas thiết kế với ý nghĩ đó.</p>
    		</article>
    	
		</div>
		
		<div class="container-fluid" style="margin-top:30px;background:#ede734;height:135px;position: relative;">
		  <div class="row">
		    <p class="giay-p">TRỞ THÀNH HỘI VIÊN & HƯỞNG ƯU ĐÃI 15% 
		    <a class="giay-p_a" href="" data-toggle="modal" data-target="#myModal">ĐĂNG KÍ MIỄN PHÍ</a>
		    </p>
		  </div>
		</div>
		
		<footer class="bg-dark text-center text-white">
  <!-- Grid container -->
  <div class="container p-4">
    <!-- Section: Social media -->
    <section class="mb-4">
      <!-- Facebook -->
      <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-facebook-f"></i
      ></a>

      <!-- Twitter -->
      <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-twitter"></i
      ></a>

      <!-- Google -->
      <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-google"></i
      ></a>

      <!-- Instagram -->
      <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-instagram"></i
      ></a>

      <!-- Linkedin -->
      <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-linkedin-in"></i
      ></a>

      <!-- Github -->
      <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-github"></i
      ></a>
    </section>
    <!-- Section: Social media -->

    <!-- Section: Form -->
    <section class="">
      <form action="">
        <!--Grid row-->
        <div class="row d-flex justify-content-center">
          <!--Grid column-->
          <div class="col-auto">
            <p class="pt-2">
              <strong>Sign up for our newsletter</strong>
            </p>
          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-md-5 col-12">
            <!-- Email input -->
            <div class="form-outline form-white mb-4">
              <input type="email" id="form5Example21" class="form-control" />
              <label class="form-label" for="form5Example21">Email address</label>
            </div>
          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-auto">
            <!-- Submit button -->
            <button type="submit" class="btn btn-outline-light mb-4">
              Subscribe
            </button>
          </div>
          <!--Grid column-->
        </div>
        <!--Grid row-->
      </form>
    </section>
    <!-- Section: Form -->

    <!-- Section: Text -->
    <section class="mb-4">
      <p>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt distinctio earum
        repellat quaerat voluptatibus placeat nam, commodi optio pariatur est quia magnam
        eum harum corrupti dicta, aliquam sequi voluptate quas.
      </p>
    </section>
    <!-- Section: Text -->

    <!-- Section: Links -->
    <section class="">
      <!--Grid row-->
      <div class="row">
        <!--Grid column-->
        <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
          <h5 class="text-uppercase">Chăm sóc khách hàng</h5>

          <ul class="list-unstyled mb-0">
            <li>
              <a href="#!" class="text-white">Trung tâm mua sắm</a>
            </li>
            <li>
              <a href="#!" class="text-white">Vận chuyển & hoàn tiền</a>
            </li>
            <li>
              <a href="#!" class="text-white">Chăm sóc khách hàng</a>
            </li>
            <li>
              <a href="#!" class="text-white">Chính sách bảo hàng</a>
            </li>
            <li>
              <a href="#!" class="text-white">Thanh toán</a>
            </li>
          </ul>
        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
          <h5 class="text-uppercase">Đơn vị tài trợ</h5>
              <ul class="list-unstyled mb-0">
              <li>
              <div>THANH TOÁN</div>
              <img src="anh_thanh_toan.jpg">
              </li>
              <li>
              <div>VẬN CHUYỂN</div>
              <img src="anh_van_chuyen.jpg">
              </li>
              </ul>
          
        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
          <h5 class="text-uppercase">Về Adidas</h5>

          <ul class="list-unstyled mb-0">
            <li>
              <a href="#!" class="text-white">Tuyển dụng</a>
            </li>
            <li>
              <a href="#!" class="text-white">Chính sách bảo mật</a>
            </li>
            <li>
              <a href="#!" class="text-white">Flash sales</a>
            </li>
            <li>
              <a href="#!" class="text-white">Điều khoản</a>
            </li>
          </ul>
        </div>
  
      </div>
     
    </section>
  </div>

 
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.6);">
    © 2020 Copyright:
    <a class="text-white" href="#">ADIDAS VIỆT NAM</a>
  </div>
 
</footer>


		<div class="container-fluid" style="height:80px;background:grey">
		<div class="row">
			<ul style="display:flex;justify-content:space-around;margin-top:30px"> 
			 <li>Cài đặt Cookie</li>
			 <li> Chính sách bảo mật</li>
			 <li>Điều kiện và điều khoản</li>
			 <li>Adidas Việt Nam</li>
			</ul>
			</div>
		</div>
	</body>
	</html>
	
	
	

<%@page import="bo.giohangthibo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaigiaybean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mô tả</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
</head>
<style type="text/css">
	.caption {
   
    color: #fff;
    position: absolute;
    bottom: 0;
    left: 0;
    width: 95%;
    top: 100%;
    height: 100px;
    margin-top: 11px;
    margin-left: 15px;
    
}
	.caption h3 {
	    margin-top: 0;
}
	.fab {
  font-size: 24px;
  margin-right: 10px;
}
.heart {
  width: 10px;
  height: 10px;
  background-color: red;
  position: relative;
  transform: rotate(-45deg);
}
.heart::before,
.heart::after {
  content: "";
  position: absolute;
  width: 10px;
  height: 10px;
  background-color: red;
}
.heart::before {
  border-radius: 6px 6px 0 0;
  top: -6px;
  left: 0;
}
.heart::after {
  border-radius: 6px 6px 6px 0;
  top: 0;
  left: 6px;
}
a {
  text-decoration: none;
}

a:hover {
  text-decoration: none;
}
li{
	list-style: none;
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
	<li ><a href="giaycontroller">Trang chủ</a></li>
	<li><a href="giaycontroller">Tất cả sản phẩm</a></li>
	<li><a href="giogiaycontroller">Giỏ hàng
		
	<%if (session.getAttribute("ggiay")!=null) {
		giohangthibo g= null;
		g = (giohangthibo) session.getAttribute("ggiay");
		int sl = g.dsgiohang.size();
		 if (sl!= 0){%>
			 <span class="soHangTrongGio"><%=sl%></span>
		 <%} %>

	<%}%>
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
	<!-- PHẦN THANH TÌM KIẾM -->
	<nav class="navbar navbar-inverse" style="background: #fcf8e3e0; margin-top: -19px;border-top: none;">
		<div class="container">
			<div class="row">
			<div class="collapse navbar-collapse " id="myNavbar">
				<ul class="nav navbar-nav tieude">
			
				
				</ul>
				<form class="navbar-form navbar-right"  action="giaycontroller">
					<div class="form-group">
						<input type="text" name="txttim" class="form-control" placeholder="Tìm kiếm..." style="width: 100%;">
					</div>
					<input type="submit" class="btn btn-default" value="Tìm kiếm">
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Giỏ hàng</a></li>
				</ul>
			</div>
		</div>
		</div>
	</nav>
	
	<!-- PHẦN THÂN BÀI MÔ TẢ -->
	<div class="container" style="background: #80808017;padding-bottom: 15px">
		<div class="row"> 
		 <div class="col-md-6" style="position: relative;"> 
		 	<img src="<%=session.getAttribute("anhgiay") %>"style="width: 90%; height: 400px;">
		 	<div class="caption">
        		<div style="color:black">Chia sẻ
        		 <ul style="display:flex;margin-top:-20px;margin-left:35px;list-style: none">
        		 <li ><i class="fab fa-facebook"></i></li>
        		 <li><i class="fab fa-youtube"></i></li>
        		 <li><i class="fab fa-instagram"></i></li>
        		 </ul>
        		</div>
        		<p style="color:black;display:flex">
        		Yêu thích<div class="heart"></div>
        		</p>
    		</div>
		 </div>
		 
		 <div class="col-md-6">
		  <h1><%=session.getAttribute("tengiay") %></h1>
		  <div>
		  	<span class="glyphicon glyphicon-star" style="color:orange;"></span>
		  	<span class="glyphicon glyphicon-star" style="color:orange;"></span>
		  	<span class="glyphicon glyphicon-star" style="color:orange;"></span>
		  	<span class="glyphicon glyphicon-star" style="color:orange;"></span>
		  	<span class="glyphicon glyphicon-star-empty"></span>
		  </div>
		  <h1 style="color:orange"><%=(long)session.getAttribute("giagiay")%> VND</h1>
		  <table>
		   <tr style="height:70px">
		   	 <td><label style="font-size: 20px">Bảo hiểm</label></td> 
		   	 <td><span style="margin-left:20px;font-size:15px;font-weight: 300">Bảo hiểm giày</span></td>
		   </tr>
		   <tr style="height:70px">
		   	 <td><label style="font-size: 20px">Vận chuyển</label></td> 
		   	 <td><span style="margin-left:20px;font-size:15px;font-weight: 300">Miễn phí vận chuyển</span></td>
		   </tr>
		   <tr style="height:70px">
		   	 <td><label style="font-size: 20px">Màu sắc</label></td> 
		   	 <td><span style="margin-left:20px;font-size:15px;font-weight: 300">Vàng</span></td>
		   </tr>
		   <tr style="height:70px">
		   	 <td><label style="font-size: 20px">Kích thước</label></td> 
		   	 <td><span style="margin-left:20px;font-size:15px;font-weight: 300">43</span></td>
		   </tr>
		    <tr style="height:70px">
			   	 <td><label style="font-size: 20px">Số lượng</label></td> 
				 <td><span style="margin-left:20px;font-size:15px;font-weight: 300">1</span></td>
			   	 
		   </tr>
		   
		   <tr>
		   	 <td>
		   	  <a href="giogiaycontroller?mgiay=<%=session.getAttribute("magiay")%>&tgiay=<%=session.getAttribute("tengiay")%>
		   	  &gia=<%=session.getAttribute("giagiay")%>&anh=<%=session.getAttribute("anhgiay") %>" style="border:1px solid orange;padding:10px"><span class="glyphicon glyphicon-shopping-cart"></span>Thêm vào giỏ hàng</a>
		   	 
		   	 </td>
		   </tr>
		  </table>

		 </div>
		 
		</div>
	</div>
	<div class="container" style="margin-top:15px;background: #80808017">
		<h1>CHI TIẾT SẢN PHẨM</h1>
		 <table style="margin-top:10px ">
		 	<tr>
		 	 <td><label style="font-size: 17px">Danh mục</label></td> 
		   	 <td><span style="margin-left:20px;font-size:15px;font-weight: 300">Giày</span></td>
		 	</tr>
		 	<tr>
		 	 <td><label style="font-size: 17px">Chất lượng</label></td> 
		   	 <td><span style="margin-left:20px;font-size:15px;font-weight: 300">Da</span></td>
		 	</tr>
		 	<tr>
		 	 <td><label style="font-size: 17px">Mẫu</label></td> 
		   	 <td><span style="margin-left:20px;font-size:15px;font-weight: 300">In</span></td>
		 	</tr>
		 	<tr>
		 	 <td><label style="font-size: 17px">Sản xuất</label></td> 
		   	 <td><span style="margin-left:20px;font-size:15px;font-weight: 300">Đức</span></td>
		 	</tr>
		 	<tr>
		 	 <td><label style="font-size: 17px">Gửi từ</label></td> 
		   	 <td><span style="margin-left:20px;font-size:15px;font-weight: 300">Nước ngoài</span></td>
		 	</tr>
		 </table>
		 
		 <table border="2" width="100%" margin-top="10px">
			  <th>
			    <tr>
			      <th>Size</th>
			      <th>Chiều dài bàn chân (cm)</th>
			      <th>EU</th>
			      <th>US</th>
			      <th>UK</th>
			    </tr>
			  </th>
			  <tbody>
			    <tr>
			      <td>35</td>
			      <td>22.5</td>
			      <td>35</td>
			      <td>5</td>
			      <td>2.5</td>
			    </tr>
			    <tr>
			      <td>36</td>
			      <td>23</td>
			      <td>36</td>
			      <td>5.5</td>
			      <td>3</td>
			    </tr>
			   
				<tr>
			      <td>37</td>
			      <td>23.5</td>
			      <td>37</td>
			      <td>6</td>
			      <td>3.5</td>
			    </tr>
			    <tr>
			      <td>38</td>
			      <td>24</td>
			      <td>38</td>
			      <td>6.5</td>
			      <td>4</td>
			    </tr>
			    <tr>
			      <td>39</td>
			      <td>24.5</td>
			      <td>39</td>
			      <td>7</td>
			      <td>4.5</td>
			    </tr>
			  </tbody>
			</table> 
		 <div style="margin-top:30px"> 
		  <ul>
		   <li>Do màn hình hiển thị và hiệu ứng ánh sáng khác nhau , 
		   màu sắc thực tế của mặt hàng có thể hơi khác so với màu hiển thị trong hình ảnh . Cảm ơn bạn .</li>
		   <li>Nếu có vấn đề khi nhận được gói hàng , vui lòng liên hệ với chúng tôi để được hỗ trợ xử lý ,
		   chúng tôi sẽ giải đáp thỏa đáng cho bạn .</li>
		   <li>Tất cả các sản phẩm được gửi từ nước ngoài. chất lượng siêu tốt với giá rẻ , 
		   nếu bạn thích nó , đừng quên chia sẻ nó với bạn bè của bạn
		   </li>
		  </ul>
		 </div>	
	</div>
</body>
</html>
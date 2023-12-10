<%@page import="bean.giaybean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN QUẢN LÍ GIÀY</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">ADIDAS</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">

     	<li><a href="adminloaicontroller">Quản lí loại</a></li>
        <li><a href="admingiaycontroller">Quản lí giày</a></li>
        <li><a href="adminxacnhancontroller">Xác nhận hóa đơn </a></li>
        <li><a href="#">Khách hàng đã chuyển</a></li>
      </ul>
     
    </div>
  </div>
</nav>
  
  
  <!-- Phần thân -->
  <%
  String mgiay =(String) request.getAttribute("mg");
  String tgiay =(String) request.getAttribute("t");
  String sl =(String) request.getAttribute("sl");
  String gia =(String) request.getAttribute("gia");
  String anh = (String)request.getAttribute("anh");
  String maloai =(String) request.getAttribute("m");
  
  %>
<div class="container">
  <form  action="admingiaycontroller" method="post" >
 	 <div>
	    Mã giày:
	 	<input name="txtmagiay" type="text" value="<%=(mgiay==null)?"":mgiay%>" style="margin-top:10px" >  
 	</div>
 	<div>
 		Tên giày:
 		 <input name="txttenloai" type="text" value="<%=(tgiay==null)?"":tgiay%>" style="margin-top:10px" > 
 	</div>
 		Số lượng:
 		<input name="txtsoluong" type="number" value="<%=(sl==null)?"":sl%>" style="margin-top:10px" > 
 	<div>
 		Giá:
 		<input name="txtgia" type="number" value="<%=(gia==null)?"":gia%>" style="margin-top:10px" >
 	</div>
 	<div>
 		Mã loại:
 		<input name="txtmaloai" type="text" value="<%=(maloai==null)?"":maloai%>" style="margin-top:10px" >
 	</div>
 	<div>
 		Ảnh:
 		<input name="txtanh" type="text" value="<%=(anh==null)?"":anh%>" style="margin-top:10px" >
 	</div>

 	 <div style="display:flex;margin-top: 10px">
 	 <input name="them" type="submit" value="Thêm"> 
 	 <input name="capnhatgiay" type="submit" value="Cập nhật" style="margin-left:10px"> 
 	 </div>
 	</form>
 	
 	<h1 style="margin-top:20px;color: RED"> DANH SÁCH GIÀY </h1>
 	<br>
 	<table class="table table-hover">
 	<tr style="color:red;background-color: gray">
 	<td>Mã giày</td>
 	<td>Tên giày</td>
 	<td>Số lượng</td>
 	<td>Giá</td>
 	<td>Mã loại</td>
 	<td>Ảnh</td>
 	</tr>
 	<%
 	 ArrayList<giaybean> dsgiay =(ArrayList<giaybean>) request.getAttribute("dsgiay");
 	 	for (giaybean l :dsgiay){
 	%>
 	<tr>
 	<td><%=l.getMagiay()%></td>
 	<td><%=l.getTengiay() %></td>
 	<td><%=l.getSoluong()%></td>
 	<td><%=l.getGia()%></td>
 	<td><%=l.getMaloai() %></td>
 	<td><%=l.getAnh()%></td>
 	<td>
 	<form action="admingiaycontroller?mg=<%=l.getMagiay()%>&t=<%=l.getTengiay()%>&sl=<%=l.getSoluong()%>&gia=<%=l.getGia()%>&m=<%=l.getMaloai()%>&anh=<%=l.getAnh()%>" method="post">
 	<input  type="submit" name="btnchon" value="Chọn">
 	<input  type="submit" name="btnxoa" value="Xóa">
 	</form>
 	</td>
 	</tr>
 	<%} %>
 	</table>
</div>
</div>
</body>
</html>
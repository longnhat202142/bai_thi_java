
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaigiaybean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN QUẢN LÍ LOẠI</title>
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
        <li><a href="adminxacnhancontroller">Xác nhận hóa đơn</a></li>
        <li><a href="#">Khách hàng đã chuyển</a></li>
      </ul>
     
    </div>
  </div>
</nav>
  
<div class="container">
<%
	String ml = (String) request.getAttribute("ml");
	String tenloai= (String)  request.getAttribute("tenloai");
%>
 	<form  action="adminloaicontroller">
 	 Mã loại  : <input name="txtmaloai" value="<%=(ml==null)?"":ml%>" type="text" style="margin-top:10px">  <br>
 	 Tên loại :	<input name="txttenloai" value="<%=(tenloai==null)?"":tenloai%>" type="text" style="margin-top:10px"> <br>
 	 <div style="display:flex;margin-top: 10px">
 	 <input name="themloai" type="submit" value="Thêm"> 
 	 <input name="capnhatloai" type="submit" value="Cập nhật" style="margin-left:10px"> 
 	 </div>
 	</form>
 	
 	<h1 style="margin-top:20px;color: RED">DANH SÁCH CÁC LOẠI</h1>
 	<br>
 	<table class="table table-hover">
 	<tr style="color:red;background-color: gray">
 	<td>Mã loại</td>
 	<td>Tên loại</td>
 	</tr>
 	<%
 	 ArrayList<loaigiaybean> dsloaigiay = (ArrayList<loaigiaybean>)request.getAttribute("dsloaigiay");
 	 	for (loaigiaybean l :dsloaigiay){%>
 	<tr>
 	<td><%=l.getMaloai() %></td>
 	<td><%=l.getTenloai() %></td>
 	<td>
 	<form action="adminloaicontroller?ml=<%=l.getMaloai()%>" method="post">
 	<input  type="submit" name="btnchon" value="Chon">
 	<input  type="submit" name="btnxoa" value="Xóa">

 	</form>
 	</tr>
 	<%} %>
 	</table>
</div>

</body>
</html>
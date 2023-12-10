<%@page import="bean.xacnhanthibean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN XÁC NHẬN</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
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
<h1 style="margin-top:30px;color:red">DANH SÁCH HÓA ĐƠN CHƯA DUYỆT</h1>
<table class="table table-hover"> 
<% ArrayList<xacnhanthibean> dsxacnhan = (ArrayList<xacnhanthibean>) request.getAttribute("dshoadon");
	for (xacnhanthibean h :dsxacnhan){%>
		<tr>
		
		<td><%=h.getHoten() %></td>
		<td><%=h.getTengiay() %></td>
		<td><%=h.getGia() %></td>
		<td><%=h.getSoluongmua() %></td>
		<td><a href="adminxacnhancontroller?mact=<%=h.getMachitiethd()%>">Xác nhận</a></td>
		</tr>
	<%}%>
</table>
</div>

</body>
</html>
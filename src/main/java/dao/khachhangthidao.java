package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.khachhangthibean;

public class khachhangthidao {
	public khachhangthibean kiemtradangnhap(String tendn,String pass) 
			throws Exception {
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql= "select * from khachhang where tendangnhap=? and matkhau=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tendn);
		cmd.setString(2, pass);
		ResultSet rs = cmd.executeQuery();
		khachhangthibean kh=null;
		if (rs.next()) {
			long makh = rs.getLong("makh");
			String hoten =rs.getString("hoten");
			String diachi=rs.getString("diachi"); 
			String sodienthoai=rs.getString("sodienthoai"); 
			String email=rs.getString("email");
			String tendnkh=rs.getString("tendangnhap");
			String passkh =rs.getString("matkhau");
			kh= new khachhangthibean(makh, hoten, diachi, sodienthoai, email, tendnkh, passkh);
		}
		return kh;
	}
	
	public int kiemtradangki(String hoten, String diachi, String sodienthoai, String email, String tendangnhap,
			String matkhau) throws Exception {
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		
		String sql ="insert into [dbo].[khachhang]\r\n"
				+ "           ([hoten]\r\n"
				+ "           ,[diachi]\r\n"
				+ "           ,[sodienthoai]\r\n"
				+ "           ,[email]\r\n"
				+ "           ,[tendangnhap]\r\n"
				+ "           ,[matkhau])\r\n"
				+ "     VALUES \r\n"
				+ "	 (?,?,?,?,?,?)";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, hoten);
		cmd.setString(2, diachi);
		cmd.setString(3, sodienthoai);
		cmd.setString(4, email);
		cmd.setString(5,tendangnhap);
		cmd.setString(6,matkhau);
		
		int rs = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return rs;
	}
}

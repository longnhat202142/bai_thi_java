package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.giaybean;


public class giaydao {
	public ArrayList<giaybean> getgiay() throws Exception{
		ArrayList<giaybean> dsgiay = new ArrayList<giaybean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//b2: Tao cau lenh sql
		String sql="select * from giay";
		//b3: Tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//b4: Thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			String magiay = rs.getString("magiay");
			String tengiay=rs.getString("tengiay");
			long soluong=rs.getLong("soluong");
			long gia=rs.getLong("gia");
			String maloai=rs.getString("maloai");
			String anh = rs.getString("anh");
			dsgiay.add(new giaybean(magiay, tengiay, soluong, gia, maloai, anh));
		}
		kn.cn.close();
		cmd.close();
		return dsgiay;
	}
	
	public int themgiay(String magiay, String tengiay, long soluong, long gia, String maloai, String anh) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		
		String sql ="INSERT INTO [dbo].[giay]\r\n"
				+ "           ([magiay]\r\n"
				+ "           ,[tengiay]\r\n"
				+ "           ,[soluong]\r\n"
				+ "           ,[gia]\r\n"
				+ "           ,[maloai]\r\n"
				+ "           ,[anh])\r\n"
				+ "     VALUES (?,?,?,?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, magiay);
		cmd.setString(2, tengiay);
		cmd.setLong(3, soluong);
		cmd.setLong(4, gia);
		cmd.setString(5, maloai);
		cmd.setString(6, anh);
		int  kq =cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public int suagiay(String magiay, String tengiay) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql ="update giay set tengiay = ? where magiay = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		//b4: Thuc hien cau lenh
	
		cmd.setString(1, tengiay);
		cmd.setString(2, magiay);
		int kq= cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	public int xoagiay(String magiay) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql="delete  from giay where magiay=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setString(1, magiay);	
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
}


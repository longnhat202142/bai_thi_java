package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaigiaybean;

public class loaigiaydao {
	public ArrayList<loaigiaybean> getloaigiay() throws Exception {
		ArrayList<loaigiaybean> dsloai = new  ArrayList<loaigiaybean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//b2: Tao cau lenh sql
		String sql="select * from loai";
		//b3: Tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//b4: Thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		//b5: Duyet rs de luu vao ds
		while(rs.next()) {
			String maloai =rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			dsloai.add(new loaigiaybean(maloai,tenloai));
		}
		rs.close();
		kn.cn.close();
		return dsloai;
	}	
	
	public int themloai (String maloai,String tenloai)  throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		
		String sql = "insert into loai(maloai,tenloai) values (?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//b4: Thuc hien cau lenh
		
		//b5: Duyet rs de luu vao ds
		cmd.setString(1, maloai);
		cmd.setString(2, tenloai);
		
		int  kq =cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public int sualoai(String maloai,String tenloai) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql="update loai set tenloai=? where maloai=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//b4: Thuc hien cau lenh
		//ResultSet rs = cmd.executeQuery();
		//b5: Duyet rs de luu vao ds
		cmd.setString(1, tenloai);
		cmd.setString(2, maloai);
		int kq= cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public int xoaloai(String maloai) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql="delete  from loai where maloai=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//b4: Thuc hien cau lenh
		
		//b5: Duyet rs de luu vao ds
		cmd.setString(1, maloai);	
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
}

package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.xacnhanthibean;

public class chitietthidao {
	public int Themchitiet(String magiay,long soluongmua,long mahoadon)throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql ="insert into chitiethoadon (magiay,soluongmua,mahoadon,damua) values (?,?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, magiay);
		cmd.setInt(2, (int)soluongmua);
		cmd.setLong(3, mahoadon);
		cmd.setBoolean(4, false);
		int kq=cmd.executeUpdate();
		//b6 : Dong rs va ket noi
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	
	public int capnhatchitiet(long machitiethd) throws Exception {
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//b2: Tao cau lenh Sql
		String sql ="update chitiethoadon set damua = 1 where machitiethd = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		
		cmd.setLong(1,machitiethd);
		int kq=cmd.executeUpdate();
		//b6 : Dong rs va ket noi
		cmd.close();
		kn.cn.close();
		return kq;
	
	}
	
	public ArrayList<xacnhanthibean> gethoadonchuaxacnhan() throws Exception{
		ArrayList<xacnhanthibean> dsxacnhan = new ArrayList<xacnhanthibean>();
		ketnoidao kn=new ketnoidao();
		kn.ketnoi();
		String sql = "select * from xacnhanthi where damua = 0";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			long makh = rs.getLong("makh");
			String hoten = rs.getString("hoten");
			String tengiay=rs.getString("tengiay");
			long gia = rs.getLong("gia");
			Date ngaymua = rs.getDate("ngaymua");
			long soluongmua = rs.getLong("soluongmua");
			boolean damua = rs.getBoolean("damua");
			long thanhtien = rs.getLong("thanhtien");
			long machitiethd = rs.getLong("machitiethd");
	dsxacnhan.add(new xacnhanthibean(makh, hoten, tengiay, gia, ngaymua,soluongmua, damua, thanhtien, machitiethd));
		
			}
		kn.cn.close();
		cmd.close();
		return dsxacnhan;
		}
	
}

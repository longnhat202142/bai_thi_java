package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.xacnhanthibean;

public class lichsuthidao {
	public ArrayList<xacnhanthibean> lichsumuahang(long makh) throws Exception{
		ArrayList<xacnhanthibean> dslichsumua = new ArrayList<xacnhanthibean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from xacnhanthi where makh= ? and damua = 1 ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makh);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			
			String hoten = rs.getString("hoten");
			String tengiay=rs.getString("tengiay");
			long gia = rs.getLong("gia");
			Date ngaymua = rs.getDate("ngaymua");
			long soluongmua = rs.getLong("soluongmua");
			boolean damua = rs.getBoolean("damua");
			long thanhtien = rs.getLong("thanhtien");
			long machitiethd = rs.getLong("machitiethd");
	dslichsumua.add(new xacnhanthibean(makh, hoten, tengiay, gia, ngaymua,soluongmua, damua, thanhtien, machitiethd));
		}
		kn.cn.close();
		cmd.close();
		return dslichsumua;
		
	}
	
}

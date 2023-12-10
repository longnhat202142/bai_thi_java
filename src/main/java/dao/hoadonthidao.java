package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class hoadonthidao {
	public int Them (long makhachhang) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "INSERT INTO hoadon values (?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makhachhang);
		// Lay ngay hien tai
		Date n1 = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		//Doi ngay util theo dung dinh dang
		String tam=dd.format(n1); //"2023-07-27"
		Date n2 = dd.parse(tam);//Doi chuoi ra ngay util
		//Doi ngay util sang ngay sql va dua vào tham so
		cmd.setDate(2, new java.sql.Date(n2.getTime()));
		cmd.setBoolean(3, false);
		int kq = cmd.executeUpdate();
		//b6 : Dong rs va ket noi
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	
	
	public long getMaxhd() throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select max(MaHoaDon) from hoadon";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		long max = 0;
		if (rs.next()) {
			//Lay ve gia tri cua cot dau tien trong rs
			max = rs.getLong(1);
		}
		rs.close();kn.cn.close();
		return max;
	}
	
}

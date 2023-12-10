package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.thanhtoanthibean;

public class thanhtoanthidao {
	public ArrayList<thanhtoanthibean> getspthanhtoan(long makh) throws Exception{
		ArrayList<thanhtoanthibean> dsspthanhtoan = new ArrayList<thanhtoanthibean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql 
		="select magiay,tengiay,anh,gia,soluongmua,hoten,diachi,email,"
				+ "sodienthoai,thanhtien "
				+ "from Thanhtoan where makh= ? and damua = 0";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makh);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			String magiay = rs.getString("magiay");
			int soluongmua = rs.getInt("soluongmua");
			String hoten= rs.getString("hoten");
			String diachi = rs.getString("diachi");
			String sodienthoai =rs.getString("sodienthoai");
			String email = rs.getString("email");
			String tengiay = rs.getString("tengiay");

			long gia = rs.getLong("gia");
			String anh = rs.getString("anh");
			long thanhtien = rs.getLong("thanhtien");
			
			dsspthanhtoan.add(new thanhtoanthibean
		(magiay, tengiay, soluongmua, gia, 
				 anh, hoten, sodienthoai, email, diachi, thanhtien));
			

		
		}
		
		return dsspthanhtoan;
	
	}
}

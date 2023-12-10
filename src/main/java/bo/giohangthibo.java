package bo;

import java.util.ArrayList;

import bean.giohangthibean;

public class giohangthibo {
	public ArrayList<giohangthibean> dsgiohang = new ArrayList<giohangthibean>();
	
	public void ThemHangGiay(String magiay,String tengiay,long soluongmua, long gia,String anh){
		int n = dsgiohang.size();
		for (int i=0 ;  i < n ; i++) {
			if (dsgiohang.get(i).getMagiay().equals(magiay)) {
				long soluong = dsgiohang.get(i).getSoluongmua() + soluongmua;
				dsgiohang.get(i).setSoluongmua(soluong);
				long giagiay = dsgiohang.get(i).getGia();
				String mgiay= dsgiohang.get(i).getMagiay();
				String tgiay =dsgiohang.get(i).getTengiay();
				return;
			}
		}
		giohangthibean h = new giohangthibean(magiay, tengiay, soluongmua, gia, anh);
		dsgiohang.add(h);
	}
	
	public long TongTienGiay() {
		int n = dsgiohang.size();
		long Tong = 0;
		for (int  i=0 ;i<n;i++) {
			Tong = Tong + dsgiohang.get(i).getThanhtien();
		}
		return Tong;
	}
	
	public void XoaHangGiay(String magiay) {
		int n = dsgiohang.size();
 		for (int i=0  ;	i<n	 ;	i++) {
 			if (dsgiohang.get(i).getMagiay().equals(magiay)) 
 			{
 				dsgiohang.remove(i);
 				return;
 			}
 			
 	}
}
	public void XoaTatCaGiay() {
	 		dsgiohang.clear();
	}
	
	public void SuaHangGiay(String magiay,long soluong) {
		int n = dsgiohang.size();
		for (int i=0 ;  i < n ; i++) {
			if (dsgiohang.get(i).getMagiay().equals(magiay)) {
				dsgiohang.get(i).setSoluongmua(soluong);
				dsgiohang.set(i, dsgiohang.get(i));
				return;
			}
		}
	}	
}


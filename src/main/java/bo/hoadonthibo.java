package bo;

import dao.hoadonthidao;

public class hoadonthibo {
	hoadonthidao hdddao = new hoadonthidao();
	public int Them (long makhachhang) throws Exception{
		return hdddao.Them(makhachhang);
	}
	
	public long getMaxhd() throws Exception{
		return hdddao.getMaxhd();
	}
}	

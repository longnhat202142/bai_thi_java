package bo;

import bean.khachhangthibean;
import dao.khachhangthidao;

public class khachhangthibo {
	khachhangthidao khdao = new khachhangthidao();
	public khachhangthibean kiemtradangnhap(String tendn,String pass) 
			throws Exception {
		return khdao.kiemtradangnhap(tendn, pass);
	}
	public int kiemtradangki(String hoten, String diachi, String sodienthoai, String email, String tendangnhap,
			String matkhau) throws Exception {
		return khdao.kiemtradangki(hoten, diachi, sodienthoai, email, tendangnhap, matkhau);
	}
 }

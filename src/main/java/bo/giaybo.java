package bo;

import java.util.ArrayList;

import bean.giaybean;

import dao.giaydao;

public class giaybo {
   giaydao gdao = new giaydao();
   ArrayList<giaybean> dsgiay;
   public ArrayList<giaybean> getgiay() throws Exception {
		dsgiay =gdao.getgiay();
		return dsgiay;
	}
   
   // Tìm theo mã giày Timmagiay(String maloai)
   public ArrayList<giaybean> timmagiay(String maloai)throws Exception{
	   ArrayList<giaybean> tam = new  ArrayList<giaybean>();
	   for (giaybean s:dsgiay) {
		   if (s.getMaloai().equals(maloai)) 
			   tam.add(s);
	   }
	   return tam;  
   }
   
   // Nhập dữ liệu để tìm
   public ArrayList<giaybean> timtheoten(String maloai)throws Exception{
	   ArrayList<giaybean> tim= new  ArrayList<giaybean>();
	   for (giaybean s:dsgiay) {
		   if (s.getMaloai().toLowerCase().contains(maloai.toLowerCase())||
				 s.getTengiay().toLowerCase().contains(maloai.toLowerCase()))
			   tim.add(s);
	   }
	   return tim;
   }
   
   public int suagiay(String magiay, String tengiay) throws Exception{
	   return gdao.suagiay(magiay, tengiay);
   }
   public int xoagiay(String magiay) throws Exception{
	   return gdao.xoagiay(magiay);
   }
   public int themgiay(String magiay, String tengiay, long soluong, long gia, String maloai, String anh)
		   throws Exception{
	   return gdao.themgiay(magiay, tengiay, soluong, gia, maloai, anh);  
   }
 
}

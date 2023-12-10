package bo;

import java.util.ArrayList;

import bean.loaigiaybean;
import dao.loaigiaydao;

public class loaigiaybo {
	loaigiaydao lgdao = new loaigiaydao();
	ArrayList<loaigiaybean> dsloai ;
	public ArrayList<loaigiaybean> getloai() throws Exception{
		dsloai =lgdao.getloaigiay();
		return dsloai;
	}
	
	
	public String timloai (String maloai) throws Exception{
		for (loaigiaybean l : dsloai) 
			if (l.getMaloai().equals(maloai))
				return l.getTenloai();
		return null;
	}
	
	public int themloai (String maloai, String tenloai)  throws Exception{
		for (loaigiaybean l : dsloai) {
			if (l.getMaloai().equals(maloai))
				return 0;
		}
		return lgdao.themloai(maloai, tenloai);
	}	
	
	public int sualoai(String maloai,String tenloai) throws Exception{
		return lgdao.sualoai(maloai, tenloai);
	}
	public int xoaloai (String maloai) throws Exception{
		return lgdao.xoaloai(maloai);
	}
}

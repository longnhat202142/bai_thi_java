package bo;

import java.util.ArrayList;

import bean.xacnhanthibean;
import dao.chitietthidao;

public class chitietthibo {
  chitietthidao ctdao = new chitietthidao();
  public int Themchitiet(String magiay,long soluongmua,long mahoadon)throws Exception{
	  return ctdao.Themchitiet(magiay, soluongmua, mahoadon);
  }
  
  public int capnhatchitiet(long machitiethd) throws Exception{
	  return ctdao.capnhatchitiet(machitiethd);
  }
  
  
  public ArrayList<xacnhanthibean> gethoadonchuaxacnhan() throws Exception{
	  return ctdao.gethoadonchuaxacnhan();
  }
}

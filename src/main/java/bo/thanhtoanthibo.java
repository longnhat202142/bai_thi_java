package bo;

import java.util.ArrayList;

import bean.thanhtoanthibean;
import dao.thanhtoanthidao;

public class thanhtoanthibo {
	thanhtoanthidao ttdao = new thanhtoanthidao();
	public ArrayList<thanhtoanthibean> getspthanhtoan(long makh) throws Exception{
		return ttdao.getspthanhtoan(makh);
	}
}

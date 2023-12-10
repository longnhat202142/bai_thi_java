package bo;

import java.util.ArrayList;


import bean.xacnhanthibean;
import dao.lichsuthidao;

public class lichsuthibo {
	lichsuthidao lsdao = new lichsuthidao();
	public ArrayList<xacnhanthibean> lichsumuahang(long makh) throws Exception{
		return lsdao.lichsumuahang(makh);
	}
}

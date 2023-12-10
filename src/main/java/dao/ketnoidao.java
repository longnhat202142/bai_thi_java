package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ketnoidao {
	public Connection cn;
	public void ketnoi() throws Exception{
		//B1: Xac dinh hqtcsdl
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		System.out.print("Da xac dinh duoc heqtCSDL\n");
		String url="jdbc:sqlserver://NHAT\\SQLEXPRESS:1433;databaseName=Giay;user=sa;password=123";
		cn = DriverManager.getConnection(url);
		System.out.print("Da ket noi toi CSDL Giay\n\n");
	}
}
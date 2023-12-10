package bean;

import java.util.Date;

public class xacnhanthibean {
	private long makh;
	private String hoten;
	private String tengiay;
	private long gia;
	private Date ngaymua;
	private long soluongmua;
	private boolean damua;
	private long thanhtien;
	private long machitiethd;
	public long getMakh() {
		return makh;
	}
	public void setMakh(long makh) {
		this.makh = makh;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getTengiay() {
		return tengiay;
	}
	public void setTengiay(String tengiay) {
		this.tengiay = tengiay;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public Date getNgaymua() {
		return ngaymua;
	}
	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}
	public long getSoluongmua() {
		return soluongmua;
	}
	public void setSoluongmua(long soluongmua) {
		this.soluongmua = soluongmua;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public long getMachitiethd() {
		return machitiethd;
	}
	public void setMachitiethd(long machitiethd) {
		this.machitiethd = machitiethd;
	}
	public xacnhanthibean(long makh, String hoten, String tengiay, long gia, Date ngaymua, long soluongmua,
			boolean damua, long thanhtien, long machitiethd) {
		super();
		this.makh = makh;
		this.hoten = hoten;
		this.tengiay = tengiay;
		this.gia = gia;
		this.ngaymua = ngaymua;
		this.soluongmua = soluongmua;
		this.damua = damua;
		this.thanhtien = thanhtien;
		this.machitiethd = machitiethd;
	}
	public xacnhanthibean() {
		super();
	}
	
	
	
}

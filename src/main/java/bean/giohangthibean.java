package bean;

public class giohangthibean {
	private String magiay;
	private String tengiay;
	private long soluongmua;
	private long gia;
	private long thanhtien;
	private String anh;
	public String getTengiay() {
		return tengiay;
	}
	public void setTengiay(String tengiay) {
		this.tengiay = tengiay;
	}
	public String getMagiay() {
		return magiay;
	}
	public void setMagiay(String magiay) {
		this.magiay = magiay;
	}
	public long getSoluongmua() {
		return soluongmua;
	}
	public void setSoluongmua(long soluongmua) {
		this.soluongmua = soluongmua;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getThanhtien() {
		return soluongmua*gia;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public String getAnh() {
		return anh;
	}
	public giohangthibean(String magiay, String tengiay, long soluongmua, long gia, String anh) {
		super();
		this.magiay = magiay;
		this.tengiay = tengiay;
		this.soluongmua = soluongmua;
		this.gia = gia;
		this.anh = anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	
	
}

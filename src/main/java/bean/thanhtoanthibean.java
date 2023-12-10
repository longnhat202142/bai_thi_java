package bean;

public class thanhtoanthibean extends giohangthibean{
	private String hoten;
	private String sodienthoai;
	private String email;
	private String diachi;
	private String tendangnhap;
	private String matkhau;
	private long thanhtien;
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getSodienthoai() {
		return sodienthoai;
	}
	public void setSodienthoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getTendangnhap() {
		return tendangnhap;
	}
	public void setTendangnhap(String tendangnhap) {
		this.tendangnhap = tendangnhap;
	}
	public String getMatkhau() {
		return matkhau;
	}
	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public thanhtoanthibean(String magiay, String tengiay, long soluongmua, long gia,  String anh,
			String hoten, String sodienthoai, String email, String diachi, long thanhtien) {
		super(magiay, tengiay, soluongmua, gia, anh);
		this.hoten = hoten;
		this.sodienthoai = sodienthoai;
		this.email = email;
		this.diachi = diachi;
		this.thanhtien = thanhtien;
	}
	public thanhtoanthibean(String magiay, String tengiay, long soluongmua, long gia, String anh) {
		super(magiay, tengiay, soluongmua, gia, anh);
	}
	
	
	
	
}

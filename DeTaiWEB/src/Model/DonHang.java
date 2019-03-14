package Model;

public class DonHang {
String maDonHang;
String maHoaDon;
String ngayTao;
String trangThaiThanhToan;
long tongTien;
public DonHang(String maDonHang, String maHoaDon, String ngayTao, String trangThaiThanhToan, long tongTien) {
	
	this.maDonHang = maDonHang;
	this.maHoaDon = maHoaDon;
	this.ngayTao = ngayTao;
	this.trangThaiThanhToan = trangThaiThanhToan;
	this.tongTien = tongTien;
}
public String getMaDonHang() {
	return maDonHang;
}
public void setMaDonHang(String maDonHang) {
	this.maDonHang = maDonHang;
}
public String getMaHoaDon() {
	return maHoaDon;
}
public void setMaHoaDon(String maHoaDon) {
	this.maHoaDon = maHoaDon;
}
public String getNgayTao() {
	return ngayTao;
}
public void setNgayTao(String ngayTao) {
	this.ngayTao = ngayTao;
}
public String getTrangThaiThanhToan() {
	return trangThaiThanhToan;
}
public void setTrangThaiThanhToan(String trangThaiThanhToan) {
	this.trangThaiThanhToan = trangThaiThanhToan;
}
public long getTongTien() {
	return tongTien;
}
public void setTongTien(long tongTien) {
	this.tongTien = tongTien;
}

}

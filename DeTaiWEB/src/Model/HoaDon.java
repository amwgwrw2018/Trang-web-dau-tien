package Model;

import java.util.ArrayList;

public class HoaDon {
String MaHoaDon;
String MaKhachHang;

String HinhThucThanhToan;
String ghiChu;
double TongGiaTien;
String NgayCapNhatHoaDon;
String tenThaythe;
String diaChiThayThe;
String SoDienThoaiThayThe;
ArrayList<MatHang> orderedList;
int trangThaiXacNhan;
public HoaDon(){
	
}
public HoaDon(String maHoaDon, String maKhachHang, String hinhThucThanhToan,String ghichu, double tongGiaTien,
		String ngayCapNhatHoaDon, String tenThaythe, String diaChiThayThe, String soDienThoaiThayThe,
		ArrayList<MatHang> orderedList,int trangThaiXacNhan) {
	super();
	MaHoaDon = maHoaDon;
	MaKhachHang = maKhachHang;

	HinhThucThanhToan = hinhThucThanhToan;
	this.ghiChu=ghichu;
	TongGiaTien = tongGiaTien;
	NgayCapNhatHoaDon = ngayCapNhatHoaDon;
	this.tenThaythe = tenThaythe;
	this.diaChiThayThe = diaChiThayThe;
	SoDienThoaiThayThe = soDienThoaiThayThe;
	this.orderedList = orderedList;
	this.trangThaiXacNhan=trangThaiXacNhan;
}
public String getGhiChu() {
	return ghiChu;
}
public void setGhiChu(String ghiChu) {
	this.ghiChu = ghiChu;
}
public ArrayList<MatHang> getOrderedList() {
	return orderedList;
}

public int getTrangThaiXacNhan() {
	return trangThaiXacNhan;
}
public void setTrangThaiXacNhan(int trangThaiXacNhan) {
	this.trangThaiXacNhan = trangThaiXacNhan;
}
public void setOrderedList(ArrayList<MatHang> orderedList) {
	this.orderedList = orderedList;
}

public String getHinhThucThanhToan() {
	return HinhThucThanhToan;
}
public void setHinhThucThanhToan(String hinhThucThanhToan) {
	HinhThucThanhToan = hinhThucThanhToan;
}
public String getMaHoaDon() {
	return MaHoaDon;
}
public void setMaHoaDon(String maHoaDon) {
	MaHoaDon = maHoaDon;
}
public String getMaKhachHang() {
	return MaKhachHang;
}
public void setMaKhachHang(String maKhachHang) {
	MaKhachHang = maKhachHang;
}

public double getTongGiaTien() {
	return TongGiaTien;
}
public void setTongGiaTien(double tongGiaTien) {
	TongGiaTien = tongGiaTien;
}
public String getNgayCapNhatHoaDon() {
	return NgayCapNhatHoaDon;
}
public void setNgayCapNhatHoaDon(String ngayCapNhatHoaDon) {
	NgayCapNhatHoaDon = ngayCapNhatHoaDon;
}
public String getTenThaythe() {
	return tenThaythe;
}
public void setTenThaythe(String tenThaythe) {
	this.tenThaythe = tenThaythe;
}
public String getDiaChiThayThe() {
	return diaChiThayThe;
}
public void setDiaChiThayThe(String diaChiThayThe) {
	this.diaChiThayThe = diaChiThayThe;
}
public String getSoDienThoaiThayThe() {
	return SoDienThoaiThayThe;
}
public void setSoDienThoaiThayThe(String soDienThoaiThayThe) {
	SoDienThoaiThayThe = soDienThoaiThayThe;
}
@Override
public String toString() {
	return "HoaDon [MaHoaDon=" + MaHoaDon + ", MaKhachHang=" + MaKhachHang + ", MaDonHang=" 
			+ ", HinhThucThanhToan=" + HinhThucThanhToan + ", TongGiaTien=" + TongGiaTien + ", NgayCapNhatHoaDon="
			+ NgayCapNhatHoaDon + ", tenThaythe=" + tenThaythe + ", diaChiThayThe=" + diaChiThayThe
			+ ", SoDienThoaiThayThe=" + SoDienThoaiThayThe + ", orderedList=" + orderedList + "]";
}


}

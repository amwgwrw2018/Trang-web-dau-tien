package Model;

import java.io.Serializable;

public class MatHang implements Serializable{
String ten;

double gia;
String maLoaiMatHang;
String tenLoaiMatHang;
String duongDan;
String mota;
String maSanPham;
int soLuongConLai;
int soLuongDatHang=1;
int soLuongDaDatKhiThanhToan;
String nhaSanXuat;
String maNhaSanXuat;
int luotXem;
public int getSoLuongDatHang() {
	return soLuongDatHang;
}
public void setSoLuongDatHang(int soLuongDatHang) {
	this.soLuongDatHang = soLuongDatHang;
}
public MatHang(String ten, double gia, String duongDan,int soluongconlai,String maSanPham) {

	this.ten = ten;

	this.gia = gia;

this.duongDan=duongDan;
this.soLuongConLai=soluongconlai;
this.maSanPham=maSanPham;
}
public MatHang(String ten, double gia, String duongDan,String mota) {
	
	this.ten = ten;

	this.gia = gia;

this.duongDan=duongDan;
this.mota=mota;
}

public MatHang(String maSanPham, int soLuongDaDatKhiThanhToan) {
	
	this.maSanPham = maSanPham;
	this.soLuongDaDatKhiThanhToan = soLuongDaDatKhiThanhToan;
}
public MatHang(String maSanPham, String ten, double gia, String duongDan,String mota) {

	this.ten = ten;

	this.gia = gia;

this.duongDan=duongDan;
this.mota=mota;
this.maSanPham=maSanPham;

}

public MatHang(String ten, double gia, String duongDan,String maSanPham,String mota,int soLuongConLai,String nhaSanXuat,int luotXem) {
	
	this.ten = ten;

	this.gia = gia;
this.maSanPham=maSanPham;
this.duongDan=duongDan;
this.mota=mota;
this.soLuongConLai=soLuongConLai;
this.nhaSanXuat=nhaSanXuat;
this.luotXem=luotXem;
}

public int getLuotXem() {
	return luotXem;
}
public void setLuotXem(int luotXem) {
	this.luotXem = luotXem;
}
public String getNhaSanXuat() {
	return nhaSanXuat;
}
public void setNhaSanXuat(String nhaSanXuat) {
	this.nhaSanXuat = nhaSanXuat;
}
public MatHang(String ten, double gia, String maLoaiMatHang, String duongDan, String mota,
		String maSanPham,String nhaSanXuat, int soLuongConLai) {
	
	this.ten = ten;
	this.gia = gia;
	this.maLoaiMatHang = maLoaiMatHang;
	
	this.duongDan = duongDan;
	this.mota = mota;
	this.maSanPham = maSanPham;
	this.soLuongConLai = soLuongConLai;
	this.nhaSanXuat=nhaSanXuat;
}
public MatHang(String ten, double gia, String maLoaiMatHang,String tenLoaiMatHang, String duongDan, String mota,
		String maSanPham,String nhaSanXuat,String maNhaSanXuat, int soLuongConLai,int luotXem) {
	
	this.ten = ten;
	this.gia = gia;
	this.maLoaiMatHang = maLoaiMatHang;
	this.tenLoaiMatHang=tenLoaiMatHang;
	this.duongDan = duongDan;
	this.mota = mota;
	this.maSanPham = maSanPham;
	this.soLuongConLai = soLuongConLai;
	this.nhaSanXuat=nhaSanXuat;
	this.maNhaSanXuat=maNhaSanXuat;
	this.luotXem=luotXem;
}

public MatHang(String ten, double gia, String maLoaiMatHang, String duongDan, String mota, String maSanPham,
		int soLuongConLai, int soLuongDaDatKhiThanhToan, String maNhaSanXuat) {
	super();
	this.ten = ten;
	this.gia = gia;
	this.maLoaiMatHang = maLoaiMatHang;
	this.duongDan = duongDan;
	this.mota = mota;
	this.maSanPham = maSanPham;
	this.soLuongConLai = soLuongConLai;
	this.soLuongDaDatKhiThanhToan = soLuongDaDatKhiThanhToan;
	this.maNhaSanXuat = maNhaSanXuat;
}
public String getMaNhaSanXuat() {
	return maNhaSanXuat;
}

public void setMaNhaSanXuat(String maNhaSanXuat) {
	this.maNhaSanXuat = maNhaSanXuat;
}

public String getTenLoaiMatHang() {
	return tenLoaiMatHang;
}
public void setTenLoaiMatHang(String tenLoaiMatHang) {
	this.tenLoaiMatHang = tenLoaiMatHang;
}
public String getMaLoaiMatHang() {
	return maLoaiMatHang;
}
public void setMaLoaiMatHang(String maLoaiMatHang) {
	this.maLoaiMatHang = maLoaiMatHang;
}
public int getSoLuongConLai() {
	return soLuongConLai;
}
public void setSoLuongConLai(int soLuongConLai) {
	this.soLuongConLai = soLuongConLai;
}
public String getMaSanPham() {
	return maSanPham;
}
public void setMaSanPham(String maSanPham) {
	this.maSanPham = maSanPham;
}
public String getMota() {
	return mota;
}

public int getSoLuongDaDatKhiThanhToan() {
	return soLuongDaDatKhiThanhToan;
}
public void setSoLuongDaDatKhiThanhToan(int soLuongDaDatKhiThanhToan) {
	this.soLuongDaDatKhiThanhToan = soLuongDaDatKhiThanhToan;
}
public void setMota(String mota) {
	this.mota = mota;
}
public String getDuongDan() {
	return duongDan;
}
public void setDuongDan(String duongDan) {
	this.duongDan = duongDan;
}
public String getTen() {
	return ten;
}
public void setTen(String ten) {
	this.ten = ten;
}

public double getGia() {
	return gia;
}
public void setGia(double gia) {
	this.gia = gia;
}
@Override
public String toString() {
	return "MatHang [ten=" + ten + ", gia=" + gia + ", maLoaiMatHang=" + maLoaiMatHang + ", duongDan=" + duongDan
			+ ", mota=" + mota + ", maSanPham=" + maSanPham + ", soLuongConLai=" + soLuongConLai + ", soLuongDatHang="
			+ soLuongDatHang + ", soLuongDaDatKhiThanhToan=" + soLuongDaDatKhiThanhToan + ", nhaSanXuat=" + nhaSanXuat
			+ ", maNhaSanXuat=" + maNhaSanXuat + ", luotXem=" + luotXem + "]";
}




}

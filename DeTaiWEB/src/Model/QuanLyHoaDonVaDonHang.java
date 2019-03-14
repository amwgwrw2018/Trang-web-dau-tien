package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;



public class QuanLyHoaDonVaDonHang {
	PreparedStatement prepare, prepare2, prepare3, setSoluongConLai;

	ConnectDB connectdb;
	ResultSet rs, rs2, rs3;
	Calendar ca;

	public QuanLyHoaDonVaDonHang() {
		connectdb = new ConnectDB();
		ca = Calendar.getInstance();
	}
public ArrayList<DonHang> getAllOrder() throws SQLException{
	rs=connectdb.openConnect().createStatement().executeQuery("SELECT * FROM donhang");
	ArrayList<DonHang> list=new ArrayList<>();
	while(rs.next()){
		String maDonHang=rs.getString(1);
		String maHD=rs.getString(2);
		String ngayTao=rs.getString(3);
		String trangThaiTT=rs.getString(4);
		long tongTien=rs.getLong(5);
		DonHang dh=new DonHang(maDonHang, maHD, ngayTao, trangThaiTT, tongTien);
		list.add(dh);
	}
	return list;
}
public synchronized void xacNhanThanhToan(String MaDonHang) throws SQLException{
	prepare=connectdb.openConnect().prepareStatement("UPDATE donhang set TrangThaiThanhToan='Đã Thanh Toán' WHERE MaDonHang=?");
	prepare.setString(1, MaDonHang);
	prepare.executeUpdate();
}
	public synchronized boolean insertHoaDonVaDonHang(HoaDon hoaDon,String maKhachHang) throws SQLException {
		System.out.println(hoaDon.toString());

		ArrayList<MatHang> productsList = hoaDon.getOrderedList();

		String sql = "INSERT INTO hoadon(MaKhachHang, HinhThucThanhToan, NgayCapNhatHoaDon, GhiChu, tenNguoiNhanThayThe, diaChiThayThe, soDienThoaiThayThe,trangthaixacnhan) VALUES (?,?,CURRENT_TIMESTAMP,?,?,?,?,?)";
		prepare = connectdb.openConnect().prepareStatement(sql);

		prepare.setString(1, hoaDon.getMaKhachHang());
		prepare.setString(2, hoaDon.getHinhThucThanhToan());

		prepare.setString(3, hoaDon.getGhiChu());
		prepare.setString(4, hoaDon.getTenThaythe());
		prepare.setString(5, hoaDon.getDiaChiThayThe());
		prepare.setString(6, hoaDon.getSoDienThoaiThayThe());
		prepare.setInt(7, 0);
		prepare.executeUpdate();
	
		rs = connectdb.openConnect().createStatement().executeQuery("SELECT MAX(MaHoaDon) FROM hoadon WHERE MaKhachHang="+maKhachHang);
		rs.next();
		String sql2 = "INSERT INTO chitiethanghoatronghoadon VALUES ";
		for (int i = 0; i < productsList.size(); i++) {
			if (i == productsList.size() - 1) {
				sql2 += "(" + rs.getInt(1) + "," + productsList.get(i).getMaSanPham() + ","
						+ (productsList.get(i).getSoLuongDatHang()) + ")";
			} else {
				sql2 += "(" + rs.getInt(1) + "," + productsList.get(i).getMaSanPham() + ","
						+ (productsList.get(i).getSoLuongDatHang()) + "),";
			}
		}
	
	return 	connectdb.getStatement().executeUpdate(sql2)>0;
		
		

	}
	public ArrayList<HoaDon> getAllBill() throws SQLException{
		rs=connectdb.openConnect().createStatement().executeQuery("SELECT * FROM hoadon");
		HoaDon hd;
		String nameThayThe;
		String diachiThayThe;
		String sdtThayThe;
		ArrayList<HoaDon> listHD=new ArrayList<>();
		
		while(rs.next()){
			String maHoaDon = rs.getString(1);
			String maKH=rs.getString(2);
			String hinhThucThanhToan=rs.getString(3);
			String ngayCapNhatHoaDon=rs.getString(4);
			String ghichu=rs.getString(5);
			if(rs.getString(6)!=null&&rs.getString(7)!=null&&rs.getString(8)!=null){
			nameThayThe=rs.getString(6);
			diachiThayThe=rs.getString(7);
			sdtThayThe=rs.getString(8);
			}else{
				rs3=connectdb.openConnect().createStatement().executeQuery("SELECT ten,diachi,SoDienThoai FROM khachhang WHERE MaKhachHang="+maKH);
				rs3.next();
				nameThayThe=rs3.getString(1);
				 diachiThayThe=rs3.getString(2);
				sdtThayThe=rs3.getString(3);
			}
			int trangThaiXacNhan=rs.getInt(9);
			rs2=connectdb.openConnect().createStatement().executeQuery("SELECT mathang.MaMatHang, `tenmathang`, `img`, `mota`, `MaNhaSanXuat`, `MaLoaiMatHang`, `soluongconlai`,SoLuongDatMua,lichsugiamathang.dongia FROM `mathang` INNER JOIN chitiethanghoatronghoadon ON mathang.MaMatHang=chitiethanghoatronghoadon.MaMatHang AND chitiethanghoatronghoadon.MaHoaDon="+maHoaDon+" INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang)");
			
			ArrayList<MatHang> listMH=new ArrayList<>();
			while(rs2.next()){
				String maMH=rs2.getString(1);
				String tenMH=rs2.getString(2);
				String img=rs2.getString(3);
				String mota=rs2.getString(4);
				String maNhaSX=rs2.getString(5);
				String maLoaiMH=rs2.getString(6);
				int soLuongConLai=rs2.getInt(7);
				int soluongDaDat=rs2.getInt(8);
				double gia=rs2.getDouble(9);
				MatHang mh=new MatHang(tenMH, gia, maLoaiMH, img, mota, maMH, soLuongConLai, soluongDaDat, maNhaSX);
				listMH.add(mh);
			}
			
	hd=new HoaDon(maHoaDon, maKH, hinhThucThanhToan, ghichu, 0	, ngayCapNhatHoaDon, nameThayThe, diachiThayThe, sdtThayThe,listMH,trangThaiXacNhan);
listHD.add(hd);
	
			
		}
		return listHD;
	}
public synchronized void confirmBill(String maHD) throws SQLException{
	rs=connectdb.openConnect().createStatement().executeQuery("SELECT MaMatHang,SoLuongDatMua FROM chitiethanghoatronghoadon WHERE MaHoaDon="+maHD);
	ArrayList<MatHang> list=new ArrayList<>();
	long tong=0;
	while(rs.next()){
		String maMH=rs.getString(1);
		int soLuongDatMua=rs.getInt(2);
		MatHang mh=new MatHang(maMH, soLuongDatMua);
	list.add(mh);	
	String sql="SELECT dongia FROM lichsugiamathang WHERE MaMatHang="+maMH+" and lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE MaMatHang="+maMH+")";
	rs2=connectdb.openConnect().createStatement().executeQuery(sql);
	rs2.next();
	tong=tong+Long.parseLong(rs2.getString(1))*soLuongDatMua;
	}
	
	for (int i = 0; i < list.size(); i++) {
		prepare=connectdb.openConnect().prepareStatement("UPDATE mathang SET soluongconlai=soluongconlai-? WHERE MaMatHang=?");
		prepare.setInt(1, list.get(i).getSoLuongDaDatKhiThanhToan());
		prepare.setString(2, list.get(i).getMaSanPham());
		prepare.executeUpdate();
		
	}
	prepare2=connectdb.openConnect().prepareStatement("UPDATE hoadon SET trangthaixacnhan=1 WHERE MaHoaDon=?");
	prepare2.setString(1, maHD);
	prepare2.executeUpdate();
	prepare3=connectdb.openConnect().prepareStatement("INSERT INTO donhang(MaHoaDon,NgayTaoDonHang,tongTien,TrangThaiThanhToan) VALUES (?,CURRENT_TIMESTAMP,?,?) ");
	prepare3.setString(1, maHD);
	prepare3.setLong(2, tong);
	prepare3.setString(3, "Chưa Thanh Toán");
	prepare3.executeUpdate();
}
public static void main(String[] args) {
	try {
		new QuanLyHoaDonVaDonHang().confirmBill("19");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}

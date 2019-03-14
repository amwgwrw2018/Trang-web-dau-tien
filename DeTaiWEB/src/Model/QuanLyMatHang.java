package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

public class QuanLyMatHang {
	private PreparedStatement stmt = null;
	private PreparedStatement stmt2 = null;
	private ResultSet rs = null;
	private ConnectDB connectdb;
	private ResultSet countRs=null;
	Calendar ca;

	public QuanLyMatHang() {
		connectdb = new ConnectDB();
		ca = Calendar.getInstance();
	}

	public synchronized boolean  insert(MatHang mh) throws SQLException {
		String sql = "INSERT INTO mathang(tenmathang, img, mota, MaNhaSanXuat, MaLoaiMatHang, soluongconlai) VALUES (?,?,?,?,?,?)";
	
		String sql3 = "INSERT INTO lichsugiamathang(MaMatHang,dongia,ngaycapnhat) VALUES (?,?,?)";
	

		stmt = connectdb.openConnect().prepareStatement(sql);

		stmt.setString(1, mh.getTen());

		stmt.setString(2, mh.getDuongDan());
		stmt.setString(3, mh.getMota());

		stmt.setString(4, mh.getMaNhaSanXuat());

		stmt.setString(5, mh.getMaLoaiMatHang());
		stmt.setInt(6, mh.getSoLuongConLai());
		stmt.executeUpdate();
		String maxValueId="SELECT max(MaMatHang) FROM mathang";
		countRs=connectdb.getStatement().executeQuery(maxValueId);
		countRs.next();
		stmt2 = connectdb.openConnect().prepareStatement(sql3);
		stmt2.setInt(1, countRs.getInt(1));
		stmt2.setDouble(2, mh.getGia());
		stmt2.setString(3, ca.get(Calendar.YEAR) + "-" + (ca.get(Calendar.MONTH) + 1) + "-" + ca.get(Calendar.DATE)+ "-" + ca.get(Calendar.HOUR)+ "-" + ca.get(Calendar.MINUTE)+ "-" + ca.get(Calendar.SECOND));
		return stmt2.executeUpdate() > 0;// chạy câu truy vấn

	}

	public boolean themLuotXemSanPham(String mamh) throws SQLException {
		String sql = "UPDATE mathang SET luotXem=(luotXem+1) WHERE MaMatHang=?";
		stmt = connectdb.openConnect().prepareStatement(sql);
		stmt.setInt(1, Integer.parseInt(mamh));
		return stmt.executeUpdate() > 0;
	}

	public ArrayList<thongTinKemTheoSanPham> getAllMaMatHang() throws SQLException {
		String sql = "SELECT * FROM danhsachmamathang";
		rs = connectdb.getStatement().executeQuery(sql);
		ArrayList<thongTinKemTheoSanPham> list = new ArrayList<>();
		thongTinKemTheoSanPham tt;
		while (rs.next()) {
			String ma = rs.getString(1);
			String tenTheoMa = rs.getString(2);
			tt = new thongTinKemTheoSanPham(ma, tenTheoMa);
			list.add(tt);
		}
		return list;
	}

	public ArrayList<thongTinKemTheoSanPham> getAllMaNhaSanXuat() throws SQLException {
		String sql = "SELECT * FROM nhasanxuat";
		rs = connectdb.getStatement().executeQuery(sql);
		ArrayList<thongTinKemTheoSanPham> list = new ArrayList<>();
		thongTinKemTheoSanPham tt;
		while (rs.next()) {
			String ma = rs.getString(1);
			String tenTheoMa = rs.getString(2);
			tt = new thongTinKemTheoSanPham(ma, tenTheoMa);
			list.add(tt);
		}
		return list;
	}

	public int numberOfPage() throws SQLException {
		String sql2 = "SELECT COUNT(MaMatHang) FROM mathang";
		ResultSet set = connectdb.getStatement().executeQuery(sql2);
		set.next();
		return set.getInt(1);
	}

	public boolean update(MatHang mh,boolean wantToChangeImg) throws SQLException {
if(wantToChangeImg){
		String sql = "UPDATE mathang SET tenmathang=?,img=?,MaLoaiMatHang=?,soluongconlai=?,mota=?,MaNhaSanXuat=? WHERE MaMatHang=?";
		String sql2 = "INSERT INTO lichsugiamathang(dongia,ngaycapnhat,MaMatHang) VALUES (?,?,?)";
		stmt = connectdb.openConnect().prepareStatement(sql);
		stmt.setString(1, mh.getTen());
		stmt.setString(2, mh.getDuongDan());
		stmt.setString(3, mh.getMaLoaiMatHang());
		stmt.setInt(4, mh.getSoLuongConLai());
		stmt.setString(5, mh.getMota());
		stmt.setString(6, mh.getMaNhaSanXuat());
		stmt.setInt(7, Integer.parseInt(mh.getMaSanPham()));
		stmt2 = connectdb.openConnect().prepareStatement(sql2);
		stmt2.setDouble(1, mh.getGia());
		stmt2.setString(2, ca.get(Calendar.YEAR) + "-" + (ca.get(Calendar.MONTH) + 1) + "-" + ca.get(Calendar.DATE)
				+ " " + ca.get(Calendar.HOUR) + ":" + ca.get(Calendar.MINUTE) + ":" + ca.get(Calendar.SECOND));
		stmt2.setInt(3, Integer.parseInt(mh.getMaSanPham()));

		stmt2.executeUpdate();
		return stmt.executeUpdate() > 0;// chạy câu truy vấn
}else{
	String sql = "UPDATE mathang SET tenmathang=?,MaLoaiMatHang=?,soluongconlai=?,mota=?,MaNhaSanXuat=? WHERE MaMatHang=?";
	String sql2 = "INSERT INTO lichsugiamathang(dongia,ngaycapnhat,MaMatHang) VALUES (?,?,?)";
	stmt = connectdb.openConnect().prepareStatement(sql);
	stmt.setString(1, mh.getTen());

	stmt.setString(2, mh.getMaLoaiMatHang());
	stmt.setInt(3, mh.getSoLuongConLai());
	stmt.setString(4, mh.getMota());
	stmt.setString(5, mh.getMaNhaSanXuat());
	stmt.setInt(6, Integer.parseInt(mh.getMaSanPham()));
	stmt2 = connectdb.openConnect().prepareStatement(sql2);
	stmt2.setDouble(1, mh.getGia());
	stmt2.setString(2, ca.get(Calendar.YEAR) + "-" + (ca.get(Calendar.MONTH) + 1) + "-" + ca.get(Calendar.DATE)
			+ " " + ca.get(Calendar.HOUR) + ":" + ca.get(Calendar.MINUTE) + ":" + ca.get(Calendar.SECOND));
	stmt2.setInt(3, Integer.parseInt(mh.getMaSanPham()));

	stmt2.executeUpdate();
	return stmt.executeUpdate() > 0;// chạy câu truy vấn
}
	}

	public ArrayList<MatHang> getAllTree() throws Exception {
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) WHERE mathang.MaLoaiMatHang='08'";

		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhanSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhanSanxuat, luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public ArrayList<MatHang> getAllShrine() throws Exception {
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) WHERE mathang.MaLoaiMatHang='03'";

		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhanSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhanSanxuat, luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public ArrayList<MatHang> getAllEuropaStructure() throws Exception {
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) WHERE mathang.MaLoaiMatHang='04'";

		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhanSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhanSanxuat, luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public ArrayList<MatHang> getAllHouseForLiving() throws Exception {
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) WHERE mathang.MaLoaiMatHang='02'";

		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhanSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhanSanxuat, luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public ArrayList<MatHang> getAllAnimal() throws Exception {
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) WHERE mathang.MaLoaiMatHang='06'";

		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhanSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhanSanxuat, luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public ArrayList<MatHang> getAllCar() throws Exception {
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) WHERE mathang.MaLoaiMatHang='07'";

		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhanSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhanSanxuat, luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public ArrayList<MatHang> getAllCartoonCharacter() throws Exception {
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) WHERE mathang.MaLoaiMatHang='05'";

		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhanSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhanSanxuat, luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public ArrayList<MatHang> getProductWonderOfTheWorld() throws Exception {
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) WHERE MaLoaiMatHang='01'";

		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhanSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhanSanxuat, luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public ArrayList<MatHang> getAllHouse() throws Exception {
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) WHERE MaLoaiMatHang IN ('01','02','03','04')";
		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhanSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");

				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhanSanxuat, luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public ArrayList<MatHang> getAllMan() throws Exception {
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) WHERE MaLoaiMatHang='05'";
		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhaSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhaSanxuat, luotXem);
				list.add(mh);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public ArrayList<MatHang> findProductByName(String name) {
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) WHERE tenmathang LIKE '%"
				+ name + "%'";// chú
		// ý:giữa
		// between,and
		// và
		// các
		// tham
		// số
		// phải
		// có
		// dấu
		// cách

		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {

				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhanSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhanSanxuat, luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			System.out.println("that bai");
		}

		return list;
	}

	public ArrayList<MatHang> getAll() {
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "SELECT * FROM mathang INNER JOIN danhsachmamathang on mathang.MaLoaiMatHang=danhsachmamathang.MaLoaiMatHang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang)";// chú
	

		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maLoaiMatHang = rs.getString("MaLoaiMatHang");
				String tenLoaiMatHang=rs.getString("TenLoaiMatHang");
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhaSanxuat = rs.getString("TenNhaSanXuat");
				String maNhaSX = rs.getString("MaNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, maLoaiMatHang,tenLoaiMatHang, img, mota, maMH, nhaSanxuat, maNhaSX, soLuongConLai,luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			System.out.println("that bai");
		}

		return list;
	}

	public boolean deleteProduct(String index) throws SQLException {

		String sql = "DELETE FROM lichsugiamathang WHERE MaMatHang='" + index + "'";
		String sql2 = "DELETE FROM mathang WHERE MaMatHang='" + index + "'";
		try {
			stmt = connectdb.openConnect().prepareStatement(sql);
			stmt2 = connectdb.openConnect().prepareStatement(sql2);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		stmt.executeUpdate();
		return stmt2.executeUpdate() > 0;

	}

	public ArrayList<MatHang> getNewProduct() {
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) ORDER BY soluongconlai DESC LIMIT 6";// chú
		// ý:giữa
		// between,and
		// và
		// các
		// tham
		// số
		// phải
		// có
		// dấu
		// cách

		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhanSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhanSanxuat, luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			System.out.println("that bai");
		}

		return list;
	}

	public ArrayList<MatHang> getBestProduct() {
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) ORDER BY soluongconlai ASC LIMIT 5";// chú
		// ý:giữa
		// between,and
		// và
		// các
		// tham
		// số
		// phải
		// có
		// dấu
		// cách

		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhanSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhanSanxuat, luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			System.out.println("that bai");
		}

		return list;
	}

	public ArrayList<MatHang> getNewProductSortByName(String sql) {
		ArrayList<MatHang> list = new ArrayList<>();
		String cc = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) ORDER BY tenmathang"; // chú
		// ý:giữa
		// between,and
		// và
		// các
		// tham
		// số
		// phải
		// có
		// dấu
		// cách

		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhanSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhanSanxuat, luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			System.out.println("that bai");
		}

		return list;
	}

	public ArrayList<MatHang> getNewProductSortByPrice(String sql) {
		ArrayList<MatHang> list = new ArrayList<>();
		String cc = "SELECT * FROM mathang INNER JOIN nhasanxuat ON mathang.MaNhaSanXuat=nhasanxuat.MaNhaSanXuat INNER JOIN lichsugiamathang ON mathang.MaMatHang=lichsugiamathang.MaMatHang AND lichsugiamathang.ngaycapnhat=(SELECT MAX(ngaycapnhat) FROM lichsugiamathang WHERE mathang.MaMatHang=lichsugiamathang.MaMatHang) ORDER BY dongia"; // chú
		// ý:giữa
		// between,and
		// và
		// các
		// tham
		// số
		// phải
		// có
		// dấu
		// cách

		try {
			rs = connectdb.getStatement().executeQuery(sql);

			while (rs.next()) {
				String maMH = rs.getString("MaMatHang");
				String ten = rs.getString("tenmathang");
				String nhanSanxuat = rs.getString("TenNhaSanXuat");
				String img = rs.getString("img");
				double gia = rs.getDouble("dongia");
				String mota = rs.getString("mota");
				int soLuongConLai = rs.getInt("soluongconlai");
				int luotXem = rs.getInt("luotXem");
				MatHang mh = new MatHang(ten, gia, img, maMH, mota, soLuongConLai, nhanSanxuat, luotXem);
				list.add(mh);

			}
		} catch (Exception e) {
			System.out.println("that bai");
		}

		return list;
	}

}

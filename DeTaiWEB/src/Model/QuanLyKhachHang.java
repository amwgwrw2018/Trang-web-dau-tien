package Model;

import java.sql.SQLException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

import jdk.nashorn.internal.runtime.regexp.joni.constants.OPCode;

public class QuanLyKhachHang {
	
	PreparedStatement prepare;
	PreparedStatement prepare2;
	ConnectDB connectdb;
	ResultSet rs;
	Calendar ca;
	public QuanLyKhachHang(){
		connectdb=new ConnectDB();
		ca=Calendar.getInstance();
		
	}
	public synchronized boolean insertSoLuongKhachHangTruyCap() throws SQLException{
		
		String sql="UPDATE soluongkhachhangtruycap SET soluongkhachhangtruycapweb=soluongkhachhangtruycapweb+1";
		prepare=connectdb.openConnect().prepareStatement(sql);
		return prepare.executeUpdate()>0;
		
	}
	public int getSoLuongTruyCap() throws SQLException{
		rs=connectdb.openConnect().createStatement().executeQuery("SELECT * FROM soluongkhachhangtruycap");
		rs.next();
		return rs.getInt(1);
		
	}
	public synchronized boolean insertKhachHangByFacebookLogin(KhachHang kh) throws SQLException{
		String sql="INSERT INTO khachhang(facebookName,facebookID) VALUES(?,?)";
		prepare=connectdb.openConnect().prepareStatement(sql);
	
		prepare.setString(1, kh.getFacebookName());
		prepare.setString(2, kh.getFacebookID());
		
		return prepare.executeUpdate()>0;
	}
	public ArrayList<String> getAllEmail() throws SQLException{
		ArrayList<String> list=new ArrayList<>();
		rs=connectdb.openConnect().createStatement().executeQuery("SELECT Email FROM taikhoan");
		while(rs.next()){
			String email=rs.getString(1);
			list.add(email);
		}
		return list;
	}
	public synchronized boolean insertKhachHangByGoogleLogin(KhachHang kh) throws SQLException{
		String sql="INSERT INTO khachhang(GoogleId,GoogleName) VALUES(?,?)";
		prepare=connectdb.openConnect().prepareStatement(sql);
	
		prepare.setString(1, kh.getGoogleId());
		prepare.setString(2, kh.getGoogleName());
		
		return prepare.executeUpdate()>0;
	}

	public KhachHang getKHByFaceBookID(String faceID) throws SQLException{
		String sql="SELECT * FROM khachhang WHERE facebookID='"+faceID+"'";
		rs=connectdb.getStatement().executeQuery(sql);
		rs.next();
		KhachHang kh=new KhachHang(rs.getString("MaKhachHang"), rs.getString("facebookName"), rs.getString("facebookID"),rs.getString("gioitinh"));
		return kh;
	}
	public KhachHang getKHByGoogleID(String googleID) throws SQLException{
		String sql="SELECT * FROM khachhang WHERE GoogleId='"+googleID+"'";
		rs=connectdb.getStatement().executeQuery(sql);
		rs.next();
		KhachHang kh=new KhachHang(rs.getString("MaKhachHang"),rs.getString("GoogleId"),rs.getString("GoogleName"));
		return kh;
	}
	public boolean isFacebookAcountExist(KhachHang kh) throws SQLException{
		String sql="SELECT MaKhachHang,facebookName,facebookID FROM khachhang WHERE facebookID='"+kh.getFacebookID()+"'";
		rs=connectdb.getStatement().executeQuery(sql);
		int size=0;
		while(rs.next()){
			size++;
		}
	if(size==0){
		return false;
	}else{
		return true;
	}
		
	}
	public boolean isGoogleAcountExist(KhachHang kh) throws SQLException{
		String sql="SELECT MaKhachHang,GoogleName,GoogleId FROM khachhang WHERE GoogleId='"+kh.getGoogleId()+"'";
		rs=connectdb.getStatement().executeQuery(sql);
		int size=0;
		while(rs.next()){
			size++;
		}
	if(size==0){
		return false;
	}else{
		return true;
	}
		
	}
	public synchronized boolean changePassword(String newPass,String maTaiKhoan) throws SQLException{
		String sql="UPDATE taikhoan set pass=?,NgayPassWordDuocThayDoi=? WHERE MaTaiKhoan=?";
		prepare=connectdb.openConnect().prepareStatement(sql);
		prepare.setString(1, newPass);
		prepare.setString(2, ca.get(Calendar.YEAR) + "-" + (ca.get(Calendar.MONTH) + 1) + "-" + ca.get(Calendar.DATE)+" "+ca.get(Calendar.HOUR)+":"+ca.get(Calendar.MINUTE)+":"+ca.get(Calendar.SECOND));
	prepare.setString(3, maTaiKhoan);
	return prepare.executeUpdate()>0;
	}
	public synchronized boolean changePasswordByEmail(String newPass,String email) throws SQLException{
		String sql="UPDATE taikhoan set pass=?,NgayPassWordDuocThayDoi=? WHERE Email=?";
		prepare=connectdb.openConnect().prepareStatement(sql);
		prepare.setString(1, newPass);
		prepare.setString(2, ca.get(Calendar.YEAR) + "-" + (ca.get(Calendar.MONTH) + 1) + "-" + ca.get(Calendar.DATE)+" "+ca.get(Calendar.HOUR)+":"+ca.get(Calendar.MINUTE)+":"+ca.get(Calendar.SECOND));
	prepare.setString(3, email);
	return prepare.executeUpdate()>0;
	}
	public synchronized boolean insertKhachHang(KhachHang kh) throws SQLException{
		
		
		String sql="INSERT INTO khachhang(ten,gioitinh,birthday,diachi,SoDienThoai,MaTaiKhoan) VALUES(?,?,?,?,?,?)";
		String sql2="INSERT INTO taikhoan( Username, pass, ngaydangkytaikhoan, NgayPassWordDuocThayDoi,Email,quyenHan) VALUES (?,?,?,?,?,?)";
		rs=connectdb.openConnect().createStatement().executeQuery("SELECT COUNT(MaKhachHang) FROM khachhang");
		rs.next();
		
		
		
		
		prepare2=connectdb.openConnect().prepareStatement(sql2);
	
		prepare2.setString(1, kh.getUsername());
		prepare2.setString(2, kh.getPassword());
		prepare2.setString(3, ca.get(Calendar.YEAR) + "-" + (ca.get(Calendar.MONTH) + 1) + "-" + ca.get(Calendar.DATE)+" "+ca.get(Calendar.HOUR)+":"+ca.get(Calendar.MINUTE)+":"+ca.get(Calendar.SECOND));
		prepare2.setString(4, ca.get(Calendar.YEAR) + "-" + (ca.get(Calendar.MONTH) + 1) + "-" + ca.get(Calendar.DATE)+" "+ca.get(Calendar.HOUR)+":"+ca.get(Calendar.MINUTE)+":"+ca.get(Calendar.SECOND));
		prepare2.setString(5, kh.getEmail());
		prepare2.setInt(6, 0);
		prepare2.executeUpdate();
		ResultSet set=connectdb.openConnect().createStatement().executeQuery("SELECT MAX(MaTaiKhoan) FROM taikhoan");
		set.next();
		prepare=connectdb.openConnect().prepareStatement(sql);
		prepare.setString(1, kh.getName());
	
	
		prepare.setString(2, kh.getGioitinh());
		prepare.setString(3, kh.getBirthday());
		prepare.setString(4, kh.getAddress());
		prepare.setString(5, kh.getPhone());
prepare.setInt(6, set.getInt(1));
		return prepare.executeUpdate()>0;
	}
	public ArrayList<KhachHang> getAllKH(){
		ArrayList<KhachHang> list =new ArrayList<>();
		String sql="SELECT * FROM khachhang INNER JOIN taikhoan ON taikhoan.quyenHan=0 AND khachhang.MaTaiKhoan=taikhoan.MaTaiKhoan";
		try {
			rs=connectdb.getStatement().executeQuery(sql);//createStatement dùng cho các câu sql tĩnh không tham số 
			
	    	while(rs.next()){
	    		String ten=rs.getString("ten");
	    	String maKH=rs.getString("MaKhachHang");
	    	String maTK=rs.getString("MaTaiKhoan");
	    		String username=rs.getString("Username");
	    		String password=rs.getString("pass");
	    		String gioitinh=rs.getString("gioitinh");
	    		String birthday=rs.getString("birthday");
	    		String address=rs.getString("diachi");
	    		String phone=rs.getString("SoDienThoai");
	    		String email=rs.getString("Email");
	   KhachHang kh=new KhachHang(maKH,ten, username, password, gioitinh, birthday, address, phone, email,maTK);
	    	list.add(kh);
	    		
	    	}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}
	public boolean deleteKH(String maKH) throws SQLException{
		
		String sql="DELETE FROM taikhoan WHERE MaTaiKhoan=?";
		String sql2="DELETE FROM khachhang WHERE MaKhachHang=?";
		String matksql="SELECT MaTaiKhoan FROM khachhang WHERE MaKhachHang="+maKH;
		rs=connectdb.openConnect().createStatement().executeQuery(matksql);
		rs.next();
		String matk=rs.getString(1);
		try {
			prepare=connectdb.openConnect().prepareStatement(sql);
			
			prepare.setString(1, matk);
			prepare2=connectdb.openConnect().prepareStatement(sql2);
	   prepare2.setString(1, maKH);
		} catch (Exception e) {
			// TODO: handle exception
		}
		prepare2.executeUpdate();
	return prepare.executeUpdate()>0;
	}
	public ArrayList<KhachHang> getAllNguoiDung(){
		ArrayList<KhachHang> list =new ArrayList<>();
		String sql="SELECT * FROM khachhang INNER JOIN taikhoan ON khachhang.MaTaiKhoan=taikhoan.MaTaiKhoan";
		try {
			rs=connectdb.getStatement().executeQuery(sql);//createStatement dùng cho các câu sql tĩnh không tham số 
			
	    	while(rs.next()){
	    		
	    		String ten=rs.getString("ten");
	    	String maKH=rs.getString("MaKhachHang");
	    	String maTK=rs.getString("MaTaiKhoan");
	    String username=rs.getString("Username");
	    		String gioitinh=rs.getString("gioitinh");
	    		String birthday=rs.getString("birthday");
	    		String address=rs.getString("diachi");
	    		String phone=rs.getString("SoDienThoai");
	    		String email=rs.getString("Email");
	    		String password=rs.getString("pass");
	   KhachHang kh=new KhachHang(maKH,ten, username, password, gioitinh, birthday, address, phone,email,maTK);
	   
	    	list.add(kh);
	    		
	    	}
		} catch (Exception e) {
			// TODO: handle exception
		}
System.out.println(list);
		return list;
	}
	public ArrayList<KhachHang> getAllAdmin(){
		ArrayList<KhachHang> list =new ArrayList<>();
		String sql="SELECT * FROM khachhang INNER JOIN taikhoan ON taikhoan.quyenHan=1 AND khachhang.MaTaiKhoan=taikhoan.MaTaiKhoan";
		try {
			rs=connectdb.getStatement().executeQuery(sql);//createStatement dùng cho các câu sql tĩnh không tham số 
			
	    	while(rs.next()){
	    		String ten=rs.getString("ten");
	    		String maKH=rs.getString("MaKhachHang");
	    		String username=rs.getString("Username");
	    		String maTK=rs.getString("MaTaiKhoan");
	    		String password=rs.getString("pass");
	    		String gioitinh=rs.getString("gioitinh");
	    		String birthday=rs.getString("birthday");
	    		String address=rs.getString("diachi");
	    		String phone=rs.getString("SoDienThoai");
	    		String email=rs.getString("Email");
	   KhachHang kh=new KhachHang(maKH,ten, username, password, gioitinh, birthday, address, phone, email,maTK);
	    	list.add(kh);
	    		
	    	}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}


}

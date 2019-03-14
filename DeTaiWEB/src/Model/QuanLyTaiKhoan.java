package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

public class QuanLyTaiKhoan {
	PreparedStatement prepare;
	PreparedStatement prepare2;
	ConnectDB connectdb;
	ResultSet rs;
	Calendar calendar;
	public QuanLyTaiKhoan() {
		connectdb=new ConnectDB();
		calendar=Calendar.getInstance();
	}
	public ArrayList<Account> getAllAccount() throws SQLException{
		ArrayList<Account> list=new ArrayList<>();
		String sql="SELECT * FROM taikhoan";
		rs=connectdb.openConnect().createStatement().executeQuery(sql);
		while (rs.next()) {
			String MaTaiKhoan=rs.getString(1);
			String Username=rs.getString(2);
			String Password=rs.getString(3);
			String ngayDangKyTaiKhoan=rs.getString(4);
			String ngayPassWordDuocDoi=rs.getString(5);
			String Email=rs.getString(6);
			Account a=new Account(MaTaiKhoan, Username, Password, ngayDangKyTaiKhoan, ngayPassWordDuocDoi, Email);
			list.add(a);
			
		}
		return list;
	}
}

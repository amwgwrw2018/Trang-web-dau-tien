package Model;

public class Account {
String MaTaiKhoan;
String Username;
String Password;
String NgayDangKy;
String ngayPassDuocThayDoi;
String Email;
public Account(String maTaiKhoan, String username, String password, String ngayDangKy, String ngayPassDuocThayDoi,
		String email) {

	MaTaiKhoan = maTaiKhoan;
	Username = username;
	Password = password;
	NgayDangKy = ngayDangKy;
	this.ngayPassDuocThayDoi = ngayPassDuocThayDoi;
	Email = email;
}
public String getMaTaiKhoan() {
	return MaTaiKhoan;
}
public void setMaTaiKhoan(String maTaiKhoan) {
	MaTaiKhoan = maTaiKhoan;
}
public String getUsername() {
	return Username;
}
public void setUsername(String username) {
	Username = username;
}
public String getPassword() {
	return Password;
}
public void setPassword(String password) {
	Password = password;
}
public String getNgayDangKy() {
	return NgayDangKy;
}
public void setNgayDangKy(String ngayDangKy) {
	NgayDangKy = ngayDangKy;
}
public String getNgayPassDuocThayDoi() {
	return ngayPassDuocThayDoi;
}
public void setNgayPassDuocThayDoi(String ngayPassDuocThayDoi) {
	this.ngayPassDuocThayDoi = ngayPassDuocThayDoi;
}
public String getEmail() {
	return Email;
}
public void setEmail(String email) {
	Email = email;
}

}

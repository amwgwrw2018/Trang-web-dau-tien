package Model;

public class KhachHang {
	String maKhachHang;
	String name;
	String username;
	String password;
	String gioitinh;
	String birthday;
	String address;
	String phone;
	String email;
	String MaTaiKhoan;
	String facebookName;
	String facebookID;
String googleId;
String googleName;
	public KhachHang(String name, String password) {

		this.name = name;
		this.password = password;
	}

	public KhachHang(String maKhachHang, String facebookName, String facebookID,String gioitinh) {

		this.maKhachHang = maKhachHang;
		this.facebookName = facebookName;
		this.facebookID = facebookID;
		this.gioitinh=gioitinh;
	}

	public KhachHang(String maKhachHang, String googleId, String googleName) {
		super();
		this.maKhachHang = maKhachHang;
		this.googleId = googleId;
		this.googleName = googleName;
	}

	public String getGoogleId() {
		return googleId;
	}

	public void setGoogleId(String googleId) {
		this.googleId = googleId;
	}

	public String getGoogleName() {
		return googleName;
	}

	public void setGoogleName(String googleName) {
		this.googleName = googleName;
	}

	public String getFacebookName() {
		return facebookName;
	}

	public void setFacebookName(String facebookName) {
		this.facebookName = facebookName;
	}

	public String getFacebookID() {
		return facebookID;
	}

	public void setFacebookID(String facebookID) {
		this.facebookID = facebookID;
	}

	public KhachHang(String maKhachHang, String name, String username, String password, String gioitinh,
			String birthday, String address, String phone, String email, String MaTaiKhoan) {

		this.maKhachHang = maKhachHang;
		this.name = name;
		this.username = username;
		this.password = password;
		this.gioitinh = gioitinh;
		this.birthday = birthday;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.MaTaiKhoan = MaTaiKhoan;
	}

	public String getMaTaiKhoan() {
		return MaTaiKhoan;
	}

	public void setMaTaiKhoan(String maTaiKhoan) {
		MaTaiKhoan = maTaiKhoan;
	}

	public String getMaKhachHang() {
		return maKhachHang;
	}

	public void setMaKhachHang(String maKhachHang) {
		this.maKhachHang = maKhachHang;
	}

	public String getGioitinh() {
		return gioitinh;
	}

	public void setGioitinh(String gioitinh) {
		this.gioitinh = gioitinh;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "KhachHang [maKhachHang=" + maKhachHang + ", name=" + name + ", username=" + username + ", password="
				+ password + ", gioitinh=" + gioitinh + ", birthday=" + birthday + ", address=" + address + ", phone="
				+ phone + ", email=" + email + ", MaTaiKhoan=" + MaTaiKhoan + "]";
	}

}

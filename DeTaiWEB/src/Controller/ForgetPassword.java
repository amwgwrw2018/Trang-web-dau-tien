package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.Authenticator;



import Model.QuanLyKhachHang;



/**
 * Servlet implementation class ForgetPassword
 */
@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Random rd=new Random();
		QuanLyKhachHang qlkh=new QuanLyKhachHang();
		boolean isEmailExist=false;
		
String Originalemail=request.getParameter("ForgetPassSendToEmail");
String email=Originalemail.trim();
try {
	ArrayList<String> listEmail=qlkh.getAllEmail();
	for (int i = 0; i < listEmail.size(); i++) {
		if(listEmail.get(i).equals(email)){
			isEmailExist=true;
		}
	}
} catch (SQLException e2) {
	// TODO Auto-generated catch block
	e2.printStackTrace();
}
if(isEmailExist){
Properties properties=System.getProperties();
properties.put("mail.smtp.host", "smtp.gmail.com");
properties.put("mail.smtp.port", "587");
properties.put("mail.smtp.auth", "true");
properties.put("mail.smtp.starttls.enable", "true");

String newPassword="";
for (int i = 0; i < 10; i++) {
if(i%2==0){
newPassword+=(char)(65+rd.nextInt(25));
}else{
	newPassword+=rd.nextInt(9);
}
}
try {
	qlkh.changePasswordByEmail(newPassword.hashCode()+"", email);
} catch (SQLException e1) {
	// TODO Auto-generated catch block
	e1.printStackTrace();
}

// creates a new session with an authenticator
Authenticator auth=new Authenticator() {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("tannhut1391997@gmail.com","nhut1997");
	}
};
Session session=Session.getInstance(properties, auth);
MimeMessage message=new MimeMessage(session);
request.setAttribute("sendEmailSuccess", "Mật khẩu mới đã được gửi tới email của bạn,vui lòng kiểm tra email để lấy lại mật khẩu");
try {


	message.setFrom(new InternetAddress("tannhut1391997@gmail.com"));
	message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
	message.setSubject("Receive New Password");
	message.setContent("<h4>Your New Password: "+newPassword+"</h4>", "text/html; charset=utf-8");
	
	Transport.send(message);
	System.out.println("done");
} catch (AddressException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (MessagingException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
}else{
	request.setAttribute("EmailNotExist","Email chưa được sử dụng để đăng ký tài khoản,vui lòng đăng ký");
}
request.getRequestDispatcher("ForgetPassword.jsp").forward(request, response);
	}

}

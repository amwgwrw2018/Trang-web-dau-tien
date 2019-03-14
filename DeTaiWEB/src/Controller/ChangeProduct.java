package Controller;

import java.io.IOException;

import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import Model.MatHang;
import Model.QuanLyMatHang;

/**
 * Servlet implementation class ChangeProduct
 */
@WebServlet("/ChangeProduct")
public class ChangeProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeProduct() {
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
		response.setContentType("text/html;charset=UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		//MultipartRequest m =new MultipartRequest(request,"E:/DeTaiWEB3-6/DeTaiWEB/WebContent/image","UTF-8");//quan trong
		MultipartRequest m =new MultipartRequest(request,getServletContext().getRealPath("/image"),"UTF-8");
		m.getContentType("text/html;charset=UTF-8");
String s=m.getParameter("dontWantToChangeImg");
MatHang mh=new MatHang(m.getParameter("tenSPchange"),Double.parseDouble( m.getParameter("giaSPchange")), m.getParameter("maLoaiSPchange"),"", "image/"+m.getOriginalFileName("imageSPchange"),m.getParameter("motaSPchange"),m.getParameter("maSoSP"),"",m.getParameter("maNSXSPchange"),Integer.parseInt(m.getParameter("soLuongSPchange")),0);
QuanLyMatHang qlmh=new QuanLyMatHang();
if(s==null){
try {
	qlmh.update(mh,true);
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
}else{
	try {
		qlmh.update(mh,false);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	
}
response.sendRedirect("AdminControlProduct.jsp");
}
	
	

}

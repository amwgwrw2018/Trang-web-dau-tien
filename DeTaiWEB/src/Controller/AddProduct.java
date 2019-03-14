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
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")

public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
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
		MultipartRequest m =new MultipartRequest(request,getServletContext().getRealPath("/image"),"UTF-8");
		//MultipartRequest m =new MultipartRequest(request,"E:/DeTaiWEB3-6/DeTaiWEB/WebContent/image","UTF-8");//getServletContext().getRealPath("/image") when deploy to server
	QuanLyMatHang qlmh=new QuanLyMatHang();
	
	
		String maloaiSP=m.getParameter("maloaiSP");
		String tenSP=m.getParameter("tenSP");
		String giaSP=m.getParameter("giaSP");
		String motaSP=m.getParameter("motaSP");
	
		String soluongSP=m.getParameter("soluongSP");
	   String imageSP=m.getOriginalFileName("imageSP");
	   String maNSX=m.getParameter("maNSXSP");
	   

	   try {
		qlmh.insert(new MatHang(tenSP, Double.parseDouble(giaSP), maloaiSP,"", "image/"+imageSP, motaSP, "", "", maNSX, Integer.parseInt(soluongSP),0));
	} catch (NumberFormatException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  request.getRequestDispatcher("AdminControlProduct.jsp").forward(request, response);
	}

}

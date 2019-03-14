package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MatHang;

/**
 * Servlet implementation class XuLyKhachHangMuaHang
 */
@WebServlet("/XuLyKhachHangMuaHang")
public class XuLyKhachHangMuaHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XuLyKhachHangMuaHang() {
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
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
String currentURL=request.getParameter("currentURL");
System.out.println("dia chi"+currentURL);
	HttpSession session=request.getSession();
boolean productExist=false;
ArrayList<MatHang> list=((ArrayList<MatHang>)session.getAttribute("listProductOrder"));
	MatHang mh;
	if(session.getAttribute("customer")!=null&&session.getAttribute("listProductOrder")!=null){
		String ProductName=request.getParameter("TenSanPhamDuocDatHang");
		String ProductPrice=request.getParameter("GiaSanPhamDuocDatHang");
		String ProductUrl=request.getParameter("DuongDanSanPhamDuocDatHang");
		String RemainingProduct=request.getParameter("SoLuongConLaiSanPhamDuocDatHang");
		String MaSanPham=request.getParameter("MaSanPhamDatHang");
		mh=new MatHang(ProductName, Double.parseDouble(ProductPrice),  ProductUrl,Integer.parseInt(RemainingProduct),MaSanPham);
		for (int i = 0; i < list.size(); i++) {
			
			System.out.println(list.get(i).getDuongDan());
			if(list.get(i).getTen().equals(ProductName)){//phải là equals
				list.get(i).setSoLuongDatHang(list.get(i).getSoLuongDatHang()+1);
				productExist=true;
				
			}
			
		}
		if(productExist==false){
		
		list.add(mh);
		}
		response.sendRedirect(currentURL);
	
	}else{
		
	response.sendRedirect("login.jsp");
	}
	}

}

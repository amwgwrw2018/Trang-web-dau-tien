package Controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.AbstractDocument.Content;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Color;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;

import com.sun.rowset.internal.Row;

import Model.DuLieuKhachHangExcel;
import Model.KhachHang;
import Model.MatHang;

/**
 * Servlet implementation class XuatExcel
 */
@WebServlet("/XuatExcel")
public class XuatExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XuatExcel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		byte requestBytes[] = new byte[4096];
//		ByteArrayInputStream bis = new ByteArrayInputStream(requestBytes);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		DuLieuKhachHangExcel dlkh;
		HttpSession session = request.getSession();
		ArrayList<MatHang> list=((ArrayList<MatHang>)session.getAttribute("listProductOrder"));
		String name=(String)	session.getAttribute("name");
		String dienThoai=(String)session.getAttribute("phone");
		String diaChi=(String)session.getAttribute("diachi");
		KhachHang kh = (KhachHang) session.getAttribute("KhachHangDangNhap");
		response.setContentType("application/xls");
		response.setHeader("Content-disposition","attachment; filename=" +"hoaDonThanhToan.xls");
		HSSFWorkbook workbook=new HSSFWorkbook();
		HSSFSheet sheet=workbook.createSheet("hoadon");
		sheet.addMergedRegion(new CellRangeAddress(0	, 1, 0, 3));
		sheet.addMergedRegion(new CellRangeAddress(2	, 2, 0, 1));
		HSSFRow row=sheet.createRow(0);
	HSSFCell cell=row.createCell(0, CellType.STRING);
		
		cell.setCellValue("THÔNG TIN HÓA ĐƠN MUA HÀNG");
		HSSFRow row2=sheet.createRow(2);
		
		HSSFCell cellB1=row2.createCell(0, CellType.STRING);
	cellB1.setCellValue("THÔNG TIN KHÁCH HÀNG");
	String label[]={"Mã Khách Hàng Đặt Mua:","Tên Khách Hàng:","Địa Chỉ:","Số Điện Thoại:"};
	String data[]={kh.getMaKhachHang(),name	,diaChi,dienThoai};
	
	for (int i = 0; i < 4; i++) {
		dlkh=new DuLieuKhachHangExcel(label[i], data[i]);
		HSSFRow rowValue=sheet.createRow(i+3);
		HSSFCell cellValue=rowValue.createCell(0);
		cellValue.setCellValue(dlkh.getLabel());
		HSSFCell cellValue2=rowValue.createCell(1);
		cellValue2.setCellValue(dlkh.getData());
	}
	HSSFRow row3=sheet.createRow(7);
	sheet.addMergedRegion(new CellRangeAddress(7, 7, 0, 3));

	HSSFCell cellA8=row3.createCell(0);
	cellA8.setCellValue("THÔNG TIN MẶT HÀNG ĐẶT MUA");
	String tableHeadProduct[]={"Mã Sản Phẩm","Tên Sản Phẩm","Số Lượng Mua","Đơn Giá"};
	HSSFRow row4=sheet.createRow(8);
for (int i = 0; i < tableHeadProduct.length; i++) {//tua de mat hang
	HSSFCell cellProduct=row4.createCell(i);
	cellProduct.setCellValue(tableHeadProduct[i]);
}
for (int i = 0; i < list.size(); i++) {
	HSSFRow rowProduct=sheet.createRow(i+9);
	HSSFCell cell1=rowProduct.createCell(0);
	HSSFCell cell2=rowProduct.createCell(1);
	HSSFCell cell3=rowProduct.createCell(2);
	HSSFCell cell4=rowProduct.createCell(3);
	cell1.setCellValue(list.get(i).getMaSanPham());
	cell2.setCellValue(list.get(i).getTen());
	cell3.setCellValue((list.get(i).getSoLuongDatHang()+1));
	cell4.setCellValue(list.get(i).getGia()+" VND");
}
HSSFRow tongTienHangHoa=sheet.createRow(8+list.size()+1);
HSSFCell labelTongTien=tongTienHangHoa.createCell(0);
labelTongTien.setCellValue("TỔNG SỐ TIỀN:");
HSSFCell tongTien=tongTienHangHoa.createCell(1);
tongTien.setCellValue((String)session.getAttribute("tongTien")+" VND");
	HSSFRow hinhThucThanhToan=sheet.createRow(8+list.size()+2);
	HSSFCell labelHT=hinhThucThanhToan.createCell(0);
labelHT.setCellValue("HÌNH THỨC THANH TOÁN:");
HSSFCell hinhThuc=hinhThucThanhToan.createCell(1);
hinhThuc.setCellValue((String)session.getAttribute("hinhThucThanhToan"));
HSSFRow ngayXuatHD=sheet.createRow(8+list.size()+3);
HSSFCell labelngayXuat=ngayXuatHD.createCell(0);
labelngayXuat.setCellValue("NGÀY XUẤT HÓA ĐƠN");
HSSFCell ngayXuat=ngayXuatHD.createCell(1);
ngayXuat.setCellValue((String)session.getAttribute("ThoiGianXuatHoaDon"));




for (int i = 0; i < 4; i++) {
		sheet.autoSizeColumn(i);
	}
	File file=new File("C:/hoadon.xls");
		ServletOutputStream output=response.getOutputStream();
		workbook.write(output);
		output.flush();
		workbook.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	
	}

}

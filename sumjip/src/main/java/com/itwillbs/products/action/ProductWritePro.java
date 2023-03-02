package com.itwillbs.products.action;

import java.sql.Timestamp;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import products.ProductDAO;
import products.ProductDTO;

public class ProductWritePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductWritePro execute()");
		//products/productwritePro.jsp
		String uploadPath=request.getRealPath("/upload");
		System.out.println(uploadPath);

		int maxSize=10*1024*1024;

		// 업로드 파일이름 동일할때 => 파일이름변경(DefaultFileRenamePolicy)
		MultipartRequest multi=new MultipartRequest
		(request, uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

		// [all 컬럼] 변수에 저장
		int no = Integer.parseInt(multi.getParameter("no"));
		String pname= multi.getParameter("pname");
		String paddress= multi.getParameter("paddress");
		int ppostnum= Integer.parseInt(multi.getParameter("ppostnum"));
		String paddress2= multi.getParameter("paddress2");
		String ptel= multi.getParameter("ptel");
		String checkin=multi.getParameter("checkin");
		String checkout=multi.getParameter("checkout");
		int pprice= Integer.parseInt(multi.getParameter("pprice"));
		int max_men= Integer.parseInt(multi.getParameter("max_men"));
		Timestamp reser_date=new Timestamp(System.currentTimeMillis());
		String ppic1= multi.getFilesystemName("ppic1");
		String ppic2= multi.getFilesystemName("ppic2");
		String ppic3= multi.getFilesystemName("ppic3");
		String caution= multi.getParameter("caution");
		String pexplain= multi.getParameter("pexplain");

		ProductDTO dto=new ProductDTO();

		// 값 저장
		// dto.setPno(pno);
		dto.setNo(no);
		dto.setPname(pname);
		dto.setPaddress(paddress);
		dto.setPpostnum(ppostnum);
		dto.setPaddress2(paddress2);
		dto.setPtel(ptel);
		dto.setCheckin(checkin);
		dto.setCheckout(checkout);
		dto.setPprice(pprice);
		dto.setMax_men(max_men);
		dto.setReser_date(reser_date);
		dto.setPpic1(ppic1);
		dto.setPpic2(ppic2);
		dto.setPpic3(ppic3);
		dto.setCaution(caution);
		dto.setPexplain(pexplain);

		ProductDAO dao=new ProductDAO();

		dao.insertProduct(dto);

		// 글목록 이동
		ActionForward forward=new ActionForward();
		forward.setPath("ProductList.pr");
		forward.setRedirect(true);
		return forward;
	}

}

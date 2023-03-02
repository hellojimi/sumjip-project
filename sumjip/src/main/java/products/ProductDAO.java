package products;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




//DB연결
public class ProductDAO {
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
   
	// 펜션 등록
    public void insertProduct(ProductDTO dto) {
    	System.out.println("ProudctDAO insertProduct()");
    	Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	try {
		con=getConnection();
		int pno=1;
		String sql="select max(pno) from products";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			pno=rs.getInt("max(pno)")+1;
		}
		sql="insert into products(pno,no,pname,paddress,ppostnum,paddress2,ptel,checkin,checkout,pprice,max_men,reser_date,ppic1,ppic2,ppic3,caution,pexplain) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, pno);
		pstmt.setInt(2, dto.getNo());
		pstmt.setString(3, dto.getPname());
		pstmt.setString(4, dto.getPaddress());
		pstmt.setInt(5, dto.getPpostnum());
		pstmt.setString(6, dto.getPaddress2());
		pstmt.setString(7, dto.getPtel());
		pstmt.setString(8, dto.getCheckin());
		pstmt.setString(9, dto.getCheckout());
		pstmt.setInt(10, dto.getPprice());
		pstmt.setInt(11, dto.getMax_men());
		pstmt.setTimestamp(12, dto.getReser_date());
		pstmt.setString(13, dto.getPpic1());
		pstmt.setString(14, dto.getPpic2());
		pstmt.setString(15, dto.getPpic3());
		pstmt.setString(16, dto.getCaution());
		pstmt.setString(17, dto.getPexplain());
		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if(rs!=null) try { rs.close();} catch (Exception e2) {}
		if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
		if(con!=null) try { con.close();} catch (Exception e2) {}
	 }
	return;
	}// insertProduct()
	
	// 펜션 리스트(mypage)
	public ArrayList<ProductDTO> getProductList(int startRow, int pageSize){
		System.out.println("ProductDAO getProductList()");
		ArrayList<ProductDTO> productList=new ArrayList<ProductDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from products order by pno desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto=new ProductDTO();
				System.out.println("상품정보저장 주소 : "+dto);
				dto.setPno(rs.getInt("pno"));
				dto.setNo(rs.getInt("no"));
				dto.setPname(rs.getString("pname"));
				dto.setPaddress(rs.getString("paddress"));
				dto.setPpostnum(rs.getInt("ppostnum"));
				dto.setPaddress2(rs.getString("paddress2"));
				dto.setPtel(rs.getString("ptel"));		
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setPprice(rs.getInt("pprice"));
				dto.setMax_men(rs.getInt("max_men"));
				dto.setReser_date(rs.getTimestamp("reser_date"));		
				dto.setPpic1(rs.getString("ppic1"));
				dto.setPpic2(rs.getString("ppic2"));
				dto.setPpic3(rs.getString("ppic3"));
				dto.setCaution(rs.getString("caution"));
				dto.setPexplain(rs.getString("pexplain"));
				productList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return productList;
	}// getProductList()
	
	public ArrayList<ProductDTO> getProductList(int startRow, int pageSize, String id){
		System.out.println("ProductDAO getProductList()");
		ArrayList<ProductDTO> productList1=new ArrayList<ProductDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		System.out.println(id);
		try {
			con=getConnection();
			String sql="select * from products where no=(select no from users where id = ?) order by pno desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto=new ProductDTO();
				System.out.println("상품정보저장 주소 : "+dto);
				dto.setPno(rs.getInt("pno"));
				dto.setNo(rs.getInt("no"));
				dto.setPname(rs.getString("pname"));
				dto.setPaddress(rs.getString("paddress"));
				dto.setPpostnum(rs.getInt("ppostnum"));
				dto.setPaddress2(rs.getString("paddress2"));
				dto.setPtel(rs.getString("ptel"));		
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setPprice(rs.getInt("pprice"));
				dto.setMax_men(rs.getInt("max_men"));
				dto.setReser_date(rs.getTimestamp("reser_date"));		
				dto.setPpic1(rs.getString("ppic1"));
				dto.setPpic2(rs.getString("ppic2"));
				dto.setPpic3(rs.getString("ppic3"));
				dto.setCaution(rs.getString("caution"));
				dto.setPexplain(rs.getString("pexplain"));
				productList1.add(dto);
				
			}
			System.out.println(productList1.size());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return productList1;
	}// getProductList()
	
	// 펜션 검색
	public ArrayList<ProductDTO> getSearchProductList(String indate, String outdate, int guest, String region, int startRow, int pageSize) {
		ArrayList<ProductDTO> productList=new ArrayList<ProductDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from products where max_men>=? && paddress like ? && pno not in (select pno from sales where (indate >= ? && indate < ?)|| (outdate > ? && outdate <= ?)) order by pno desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, guest);
			pstmt.setString(2, "%"+region+"%");
			pstmt.setString(3, indate);
			pstmt.setString(4, outdate);
			pstmt.setString(5, indate);
			pstmt.setString(6, outdate);
			pstmt.setInt(7, startRow-1);
			pstmt.setInt(8, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto=new ProductDTO();
				dto.setPno(rs.getInt("pno"));
				dto.setPname(rs.getString("pname"));
				dto.setPaddress(rs.getString("paddress"));
				dto.setPaddress2(rs.getString("paddress2"));
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setPprice(rs.getInt("pprice"));
				dto.setPpic1(rs.getString("ppic1"));
				dto.setPexplain(rs.getString("pexplain"));
				productList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return productList;
	}// getSearchProductList()
	
	// 펜션 검색
	public ArrayList<ProductDTO> getRegion1ProductList(int startRow, int pageSize) {
		ArrayList<ProductDTO> productList=new ArrayList<ProductDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from products where paddress like ? order by pno desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%제주시%");
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto=new ProductDTO();
				dto.setPno(rs.getInt("pno"));
				dto.setPname(rs.getString("pname"));
				dto.setPaddress(rs.getString("paddress"));
				dto.setPaddress2(rs.getString("paddress2"));
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setPprice(rs.getInt("pprice"));
				dto.setPpic1(rs.getString("ppic1"));
				dto.setPexplain(rs.getString("pexplain"));
				productList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return productList;
	}// getRegion1ProductList()
	
	// 펜션 검색
	public ArrayList<ProductDTO> getRegion2ProductList(int startRow, int pageSize) {
		ArrayList<ProductDTO> productList=new ArrayList<ProductDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from products where paddress like ? order by pno desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%서귀포시%");
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto=new ProductDTO();
				dto.setPno(rs.getInt("pno"));
				dto.setPname(rs.getString("pname"));
				dto.setPaddress(rs.getString("paddress"));
				dto.setPaddress2(rs.getString("paddress2"));
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setPprice(rs.getInt("pprice"));
				dto.setPpic1(rs.getString("ppic1"));
				dto.setPexplain(rs.getString("pexplain"));
				productList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return productList;
	}// getRegion2ProductList()
	
	// 펜션 검색
	public ArrayList<ProductDTO> getRecommendProductList(int startRow, int pageSize) {
		ArrayList<ProductDTO> productList=new ArrayList<ProductDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select pno, pname, paddress, paddress2, checkin, checkout, pprice, ppic1, pexplain from(select p.pno, pname, paddress, paddress2, checkin, checkout, pprice, ppic1, pexplain from sales s join products p on s.pno = p.pno group by pno order by count(sno) desc) a union select pno, pname, paddress, paddress2, checkin, checkout, pprice, ppic1, pexplain from products limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto=new ProductDTO();
				dto.setPno(rs.getInt("pno"));
				dto.setPname(rs.getString("pname"));
				dto.setPaddress(rs.getString("paddress"));
				dto.setPaddress2(rs.getString("paddress2"));
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setPprice(rs.getInt("pprice"));
				dto.setPpic1(rs.getString("ppic1"));
				dto.setPexplain(rs.getString("pexplain"));
				productList.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return productList;
	}// getRecommendProductList()
	
	// pno로 펜션 조회
	public ProductDTO getProduct(int pno) {
		System.out.println("ProductDAO getProduct()");
		ProductDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from products where pno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto = new ProductDTO();
				dto.setPno(rs.getInt("pno"));
				dto.setNo(rs.getInt("no"));
				dto.setPname(rs.getString("pname"));
				dto.setPaddress(rs.getString("paddress"));
				dto.setPpostnum(rs.getInt("ppostnum"));
				dto.setPaddress2(rs.getString("paddress2"));
				dto.setPtel(rs.getString("ptel"));
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setPprice(rs.getInt("pprice"));
				dto.setMax_men(rs.getInt("max_men"));
				dto.setReser_date(rs.getTimestamp("reser_date"));
				dto.setPpic1(rs.getString("ppic1"));
				dto.setPpic2(rs.getString("ppic2"));
				dto.setPpic3(rs.getString("ppic3"));
				dto.setCaution(rs.getString("caution"));
				dto.setPexplain(rs.getString("pexplain"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getProduct()
	
	// 펜션 갯수 계산
	public int getProductCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from products";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return count;
	}//getProductCount()
	
	// 펜션 갯수 계산
	public int getRegion1ProductCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from products where paddress like ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%제주시%");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return count;
	}//getRegion1ProductCount()
		
		// 펜션 갯수 계산
	public int getRegion2ProductCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from products where paddress like ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%서귀포시%");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return count;
	}//getRegion2ProductCount()
	
	// 펜션 갯수 계산
	public int getRecommendProductCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		ResultSet rs2=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from(select p.pno from sales s join products p on s.pno = p.pno group by pno) a";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			String sql2="select count(*) from(select pno, pname, paddress, paddress2, checkin, checkout, pprice, ppic1, pexplain from products where pno not in (select p.pno from sales s join products p on s.pno = p.pno group by pno)) a";
			pstmt2=con.prepareStatement(sql2);
			rs2=pstmt2.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
			if(rs2.next()) {
				count+=rs2.getInt("count(*)");
			}
			System.out.println(count);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(rs2!=null) try { rs2.close();} catch (Exception e2) {}
				if(pstmt2!=null) try { pstmt2.close();} catch (Exception e2) {}
				
				if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return count;
	}//getCommendProductCount()
	
	// 검색 후 펜션 갯수 계산
	public int getSearchProductCount(String indate, String outdate, int guest, String region) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from(select * from products where max_men>=? && paddress like ? && pno not in (select pno from sales where (indate >= ? && indate < ?)|| (outdate > ? && outdate <= ?))) a;";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, guest);
			pstmt.setString(2, "%"+region+"%");
			pstmt.setString(3, indate);
			pstmt.setString(4, outdate);
			pstmt.setString(5, indate);
			pstmt.setString(6, outdate);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return count;
	}//getSearchProductCount()
			
	// 펜션 삭제
	public void deleteProduct(int pno) {
		System.out.println("ProductDAO deleteProduct()");
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="delete from products where pno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pno);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	}//deleteProduct()
	
	// 펜션 수정
	public void updateProduct(ProductDTO dto) {
		System.out.println("ProductDAO updateProduct()");
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="update products set pname=?, checkin=?, checkout=?,pprice=?, max_men=?, ppic1=?, ppic2=?, ppic3=?,caution=?, pexplain=? where pno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getPname());
			pstmt.setString(2, dto.getCheckin());
			pstmt.setString(3, dto.getCheckout());
			pstmt.setInt(4, dto.getPprice());
			pstmt.setInt(5, dto.getMax_men());
			pstmt.setString(6, dto.getPpic1());
			pstmt.setString(7, dto.getPpic2());
			pstmt.setString(8, dto.getPpic3());
			pstmt.setString(9, dto.getCaution());
			pstmt.setString(10, dto.getPexplain());
			pstmt.setInt(11, dto.getPno());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	}//updateProduct()
	
	
}//class
	   

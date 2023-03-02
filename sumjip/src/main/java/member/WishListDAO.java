package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import products.ProductDTO;

public class WishListDAO {
	public Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
public void insertWish(int no,int pno) {
	System.out.println("insertWish()");
	System.out.println("no : "+no);
	System.out.println("pno : "+pno);
	Connection con = null;
	PreparedStatement pstmt = null;
	try {
		con = getConnection();
		
		String sql = "insert into Wish_List values(?,?)";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, no);
		pstmt.setInt(2, pno);
		
		pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null)try {pstmt.close();} catch (Exception e2) {}
		if (con != null)try {con.close();} catch (Exception e2) {}
	}
	return;
	}	

public void deleteWish(int no,int pno) {
	System.out.println("deletewish");
	Connection con = null;
	PreparedStatement pstmt = null;
	try {
		con = getConnection();
		
		String sql = "delete from Wish_List where no=? and pno=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.setInt(2, pno);
		pstmt.executeUpdate();
		

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null)try {pstmt.close();} catch (Exception e2) {}
		if (con != null)try {con.close();} catch (Exception e2) {}
	}
	return;
	}	

public boolean WishCheck(int no,int pno) {
	Connection con = null;
	PreparedStatement pstmt = null;
	boolean result=true;
	ResultSet rs=null;
	try {
		
		con = getConnection();
		
		String sql = "select * from Wish_List where no=? and pno=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,no);
		pstmt.setInt(2,pno);
		
		rs = pstmt.executeQuery();
		result=rs.next();
		System.out.println("rs.next()="+result);
	
		return result;
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null)try {pstmt.close();} catch (Exception e2) {}
		if (con != null)try {con.close();} catch (Exception e2) {}
		if (rs != null) try {rs.close();} catch (Exception e2) {}
	}
	return result;
	}	



public ArrayList<ProductDTO> getWishArrayList(int no) {
	System.out.println("no="+no);
	ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ProductDTO dto=null;
	try {
		con = getConnection();
		String sql="select * from Products where pno in (select pno from Wish_List where no=?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		rs = pstmt.executeQuery();
		

		while (rs.next()) {
			dto=new ProductDTO();
			dto.setNo(rs.getInt("no"));
            dto.setPname(rs.getString("pname"));
            dto.setPprice(rs.getInt("pprice"));
            dto.setPaddress(rs.getString("paddress"));
            dto.setPno(rs.getInt("pno"));

			list.add(dto);
		}System.out.println("list.size="+list.size());
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
		if (con != null) try {con.close();} catch (Exception e2) {}
		if (rs != null) try {rs.close();} catch (Exception e2) {}
	}
	return list;
}
}
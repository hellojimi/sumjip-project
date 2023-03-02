package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.utility.MyAuthenticator;


public class UserDAO {
		public Connection getConnection() throws Exception{			
			Context init=new InitialContext();
			DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
			Connection con=ds.getConnection();
			return con;
			
		}
		// 유저 체크
		public UserDTO userCheck(String id, String pass) {
			UserDTO dto=null;
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con = getConnection();
				String sql="select * from users where id=? and pass=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pass);
				rs=pstmt.executeQuery();
				if(rs.next()){
					dto=new UserDTO();
					dto.setNo(rs.getInt("no"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setUname(rs.getString("uname"));
					dto.setJoindate(rs.getTimestamp("joindate"));
					dto.setUtype(rs.getInt("utype"));
				}else{
					
				}	
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return dto;
		}// userCheck
		
		// 회원가입
		public void insertUser(UserDTO dto) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs=null;
			try {
				con = getConnection();
				int no=1;
				String sql = "select max(no) from users";
				pstmt = con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					no=rs.getInt("max(no)")+1;
				}
				sql = "insert into users(no,id,pass,uname,birth,email,address1,address2,postnum,tel,joindate,utype) values(?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.setString(2, dto.getId());
				pstmt.setString(3, dto.getPass());
				pstmt.setString(4, dto.getUname());
				pstmt.setString(5, dto.getBirth());
				pstmt.setString(6, dto.getEmail());
				pstmt.setString(7, dto.getAddress1());
				pstmt.setString(8, dto.getAddress2());
				pstmt.setInt(9, dto.getPostnum());
				pstmt.setString(10, dto.getTel());
				pstmt.setTimestamp(11, dto.getJoindate());
				pstmt.setInt(12, dto.getUtype());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs != null)try {rs.close();} catch(Exception e2) {}
				if (pstmt != null)try {pstmt.close();} catch (Exception e2) {}
				if (con != null)try {con.close();} catch (Exception e2) {}
				
			}
		}//insertUser
		
		// id로 유저 검색
		public UserDTO getUser(String id) {
			UserDTO dto=null;
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=getConnection();
				String sql="select * from users where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next()){
					dto=new UserDTO();
					dto.setNo(rs.getInt("no"));
					dto.setUname(rs.getString("uname"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setBirth(rs.getString("birth"));
					dto.setTel(rs.getString("tel"));
					dto.setAddress1(rs.getString("address1"));
					dto.setAddress2(rs.getString("address2"));
					dto.setPostnum(rs.getInt("postnum"));
					dto.setEmail(rs.getString("email"));
					dto.setJoindate(rs.getTimestamp("joindate"));
					dto.setUtype(rs.getInt("utype"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return dto;
		}//getUser()
		
		//no로 회원정보 찾기
		public UserDTO getUserNo(int no) {
			UserDTO dto=null;
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=getConnection();
				String sql="select * from users where no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs=pstmt.executeQuery();
				if(rs.next()){
					dto=new UserDTO();
					dto.setNo(rs.getInt("no"));
					dto.setUname(rs.getString("uname"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setBirth(rs.getString("birth"));
					dto.setTel(rs.getString("tel"));
					dto.setAddress1(rs.getString("address1"));
					dto.setAddress2(rs.getString("address2"));
					dto.setPostnum(rs.getInt("postnum"));
					dto.setEmail(rs.getString("email"));
					dto.setJoindate(rs.getTimestamp("joindate"));
					dto.setUtype(rs.getInt("utype"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return dto;
		}//getUserNo()
		
		// id 찾기
		public UserDTO findId(String uname, String email) {
			UserDTO dto=null;
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=getConnection();
				String sql="select * from users where uname=? and email=? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, uname);
				pstmt.setString(2, email);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					dto=new UserDTO();
					dto.setUname(rs.getString("uname"));
					dto.setEmail(rs.getString("email"));
					dto.setId(rs.getString("Id"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return dto;
		}// findId
		
		// 회원 탈퇴
		public void deleteUser(String id) {
			Connection con = null;
			PreparedStatement pstmt2 = null;
			try {
				con = getConnection();
				String sql2 = "delete from users where id=?";
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setString(1, id);
				pstmt2.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt2 != null) try {pstmt2.close();} catch (Exception e2) {}
				if (con != null) try {con.close();} catch (Exception e2) {}
			}
		} // deleteUser()
		
		// 회원정보 수정
		public void updateUser(UserDTO updateDto) {
			Connection con = null;
			PreparedStatement pstmt2 = null;
			try {
				con = getConnection();
				String sql2 = "update users set pass=?, uname=?, email=?, address1=?, address2=?, postnum=?, tel=? where id=?";
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setString(1, updateDto.getPass());
				pstmt2.setString(2, updateDto.getUname());
				pstmt2.setString(3, updateDto.getEmail());
				pstmt2.setString(4, updateDto.getAddress1());
				pstmt2.setString(5, updateDto.getAddress2());
				pstmt2.setInt(6, updateDto.getPostnum());
				pstmt2.setString(7, updateDto.getTel());
				pstmt2.setString(8, updateDto.getId());
				pstmt2.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt2 != null) try {pstmt2.close();} catch (Exception e2) {}
				if (con != null)try {con.close();} catch (Exception e2) {}
			}
		}// updateUser()
		
		public void mypageUser(UserDTO mypageDto) {
			Connection con =null;
			PreparedStatement pstmt2=null;
			try {
				con=getConnection();
				String sql2="mypage users set uname=?, pass=?, tel=?, email=?, address1=?, address2=? where id =?";
				pstmt2=con.prepareStatement(sql2);
				pstmt2.setString(1, mypageDto.getUname());
				pstmt2.setString(2, mypageDto.getPass());
				pstmt2.setString(3, mypageDto.getTel());
				pstmt2.setString(4, mypageDto.getEmail());
				pstmt2.setString(5, mypageDto.getAddress1());
				pstmt2.setString(5, mypageDto.getAddress2());
				pstmt2.setString(6, mypageDto.getId());  
				pstmt2.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt2!=null) try { pstmt2.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
		}//mypageUser()
		
		// 유저 리스트 조회
		public ArrayList<UserDTO> getUserList(int startRow, int pageSize){
			ArrayList<UserDTO> userList=new ArrayList<UserDTO>();
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=getConnection();
				String sql="select * from users order by uname desc limit ?, ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				rs=pstmt.executeQuery();	
				while(rs.next()) {
					// UserDTO 객체생성
					UserDTO dto=new UserDTO();
					System.out.println("회원정보저장 주소 : "+dto);
					// set메서드 호출 <= 열접근
					dto=new UserDTO();
					dto.setNo(rs.getInt("no"));
					dto.setUname(rs.getString("uname"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setBirth(rs.getString("birth"));
					dto.setTel(rs.getString("tel"));
					dto.setAddress1(rs.getString("address1"));
					dto.setAddress2(rs.getString("address2"));
					dto.setPostnum(rs.getInt("postnum"));
					dto.setEmail(rs.getString("email"));
					dto.setJoindate(rs.getTimestamp("joindate"));
					dto.setUtype(rs.getInt("utype"));
					userList.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return userList;
		}//getMUserList()
		
		// 비밀번호 변경
		public void modifyPass(UserDTO modifyPassDto) {
			Connection con =null;
			PreparedStatement pstmt2=null;
			try {
				con=getConnection();
				String sql2="update users set pass=? where id =?";
				pstmt2=con.prepareStatement(sql2);
				pstmt2.setString(1, modifyPassDto.getPass()); 
				pstmt2.setString(2, modifyPassDto.getId());  
				pstmt2.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt2!=null) try { pstmt2.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
		}//modifyPass()
		
		// id 체크
		public UserDTO idCheck(String id) {
			UserDTO dto=null;
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con = getConnection();
				String sql="select * from users where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next()){
					dto=new UserDTO();
					dto.setNo(rs.getInt("no"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setUname(rs.getString("uname"));
					dto.setEmail(rs.getString("email"));
					dto.setTel(rs.getString("tel"));
					dto.setJoindate(rs.getTimestamp("joindate"));
					dto.setUtype(rs.getInt("utype"));
				}else{
					
				}	
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return dto;
		}//idCheck()
		
		// 유저리스트에서 회원 탈퇴
		public void delUserlist(String id){
			Connection con =null;
			PreparedStatement pstmt=null;
		    try{//실행
		    	con = getConnection();
		    	String sql="delete from users where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();      
		    }catch(Exception e){           
		    	e.printStackTrace();         
		    }finally{          
		    	if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
		    }      
		 }// delUserlist 
		
		// 유저 수 세기
		public int getUserCount() {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				con=getConnection();
				String sql="select count(*) from users";
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
		}//getUserCount()
		
		// 이메일 찾기
		public String findEmail(String id) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
		    String email = null;
		    try {
		    	con=getConnection();
		    	String sql="select email from users where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
		        if (rs.next()) {
		            email = rs.getString("email");
		        }//if end
		    } catch (Exception e) {
		        System.out.println("아이디 찾기 실패 : " + e);
		    } finally {
		    	if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
		    }//end
		    return email;
		}//findEmail() end
		
		// 임시 비밀번호 암호화
		public String tmpPasswd(UserDTO dto) {
			Connection con=null;
			PreparedStatement pstmt=null;
		    char[] upp = new char[26];
		    char[] low = new char[26];
		    int[] numInt = new int[10];
		    //대,소문자 배열에 넣기
		    char num = 65;
		    for (int i=0; i<26; i++) {
		        upp[i] = num;
		        low[i] = (char)(num+32);
		        num++;
		    }//for end
		    for (int k=0; k<10; k++) {
		        numInt[k] = k;			
		    }//for end
		    //임시 비밀번호에 사용되는 대문자, 소문자, 숫자 각 개수 설정
		    int a = (int)Math.floor(Math.random()*10); //대문자 개수
		    int b = (int)Math.floor(Math.random()*(10-a)); //소문자 개수
		    int c = 10 - a - b; //숫자 개수
		    //임시 비밀번호 저장. (대문자, 소문자, 숫자가 나오는 자릿수를 임의로 지정하기 위해 set 사용)
		    Set set = new HashSet();
		    StringBuilder pw = new StringBuilder();
		    //임시 비밀번호 생성
		    while (true) { //set은 중복을 허용하지 않기 때문에 중복값이 들어가면 10자리가 안나온다. 따라서 10자리 나올때까지 반복
		        if(set.size()==10) { 
		            Iterator iter = set.iterator();
		            while (iter.hasNext()) {  //다음 cursor가 있는지?
		                //cursor가 가리키는 요소 가져오기
		                Object obj = iter.next();
		                pw.append(obj);
		            }//while end
		            break;
		        } else {
		            set.clear();
		            //대문자
		            for (int i=0; i<a; i++) {
		                int idx = (int)Math.floor(Math.random()*26); //배열에서 랜덤하게 값을 가져오기 위해
		                set.add(upp[idx]);
		            }
		            //소문자
		            for (int j=0; j<b; j++) {
		                int idx = (int)Math.floor(Math.random()*26);
		                set.add(low[idx]);
		            }
		            //숫자
		            for (int k=0; k<c; k++) {
		                int idx = (int)Math.floor(Math.random()*10);
		                set.add(numInt[idx]);
		            }
		        }//if end
		    }//while end
		    //임시 비밀번호로 수정
		    try {
		    	con=getConnection();
		    	String sql="update users set Pass=? where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, pw.toString());
				pstmt.setString(2, dto.getId());
				pstmt.executeUpdate();
		    } catch (Exception e) {
		        System.out.println("임시 비밀번호로 수정 실패 : " + e );
		    } finally {
		    	if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
		    }//end
		    return pw.toString();
		}//tmpPasswd() end
		
		// 메일 전송
		public void sendTmpPw(String tmpPasswd, UserDTO dto) {
		    try {
		        String content = "* 임시 비밀번호로 로그인 한 후, 비밀번호를 변경하시기 바랍니다.";
		        content += "<hr>";
		        content += "<table border='1'>";
		        content += "<tr>";
		        content += "	<th>임시 비밀번호</th>";
		        content += "</tr>";
		        content += "<tr>";
		        content += "	<td>"+ tmpPasswd +"</td>";
		        content += "</tr>";
		        content += "</table>";
		        String mailServer = "smtp.gmail.com"; // 메일서버
		        Properties props = new Properties();
		        props.put("mail.smtp.host", mailServer);
		        props.put("mail.smtp.auth", true);
		        props.put("mail.smtp.port", 465);
		        props.put("mail.smtp.auth", "true");
		        props.put("mail.smtp.ssl.enable", "true");
		        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		        Authenticator myAuth = new MyAuthenticator(); //다형성
		        Session sess = Session.getInstance(props, myAuth);
		        InternetAddress[] address = {new InternetAddress(dto.getEmail())};
		        Message msg = new MimeMessage(sess);
		        msg.setRecipients(Message.RecipientType.TO, address);
		        msg.setFrom(new InternetAddress("webmaster@itwill.co.kr"));
		        msg.setSubject("섬집 임시 비밀번호 입니다");
		        msg.setContent(content, "text/html; charset=UTF-8");
		        msg.setSentDate(new Date());
		        Transport.send(msg);
		    } catch (Exception e) {
		        System.out.println("메일 전송 실패 : " + e);
		    }//end
		}//sendTmpPw() end
}

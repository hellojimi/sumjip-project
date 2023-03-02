package products;

import java.sql.Timestamp;

public class ProductDTO {

   private int pno; // 상품번호
   private int no; // 유저번호
   private String pname; // 펜션이름
   private int ppostnum; // 우편번호
   private String paddress; // 펜션주소
   private String paddress2; // 상세주소
   private String ptel; // 전화번호
   private String checkin; // 체크인시간
   private String checkout; // 체크아웃시간
   private int pprice; // 가격
   private int max_men; // 최대숙박인원
   private Timestamp reser_date; // 숙소등록일
   private String ppic1; // 펜션사진1
   private String ppic2; // 펜션사진2
   private String ppic3; // 펜션사진3
   private String caution; // 주의사항
   private String pexplain; // 펜션설명
   
   public int getPno() {
      return pno;
   }
   public void setPno(int pno) {
      this.pno = pno;
   }
   public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
   public String getPname() {
      return pname;
   }
   public void setPname(String pname) {
      this.pname = pname;
   }
   public int getPpostnum() {
      return ppostnum;
   }
   public void setPpostnum(int ppostnum) {
      this.ppostnum = ppostnum;
   }
   public String getPaddress() {
      return paddress;
   }
   public void setPaddress(String paddress) {
      this.paddress = paddress;
   }
   public String getPaddress2() {
      return paddress2;
   }
   public void setPaddress2(String paddress2) {
      this.paddress2 = paddress2;
   }
   public String getPtel() {
      return ptel;
   }
   public void setPtel(String ptel) {
      this.ptel = ptel;
   }
   public String getCheckin() {
      return checkin;
   }
   public void setCheckin(String checkin) {
      this.checkin = checkin;
   }
   public String getCheckout() {
      return checkout;
   }
   public void setCheckout(String checkout) {
      this.checkout = checkout;
   }
   public int getPprice() {
      return pprice;
   }
   public void setPprice(int pprice) {
      this.pprice = pprice;
   }
   public int getMax_men() {
      return max_men;
   }
   public void setMax_men(int max_men) {
      this.max_men = max_men;
   }
   public Timestamp getReser_date() {
      return reser_date;
   }
   public void setReser_date(Timestamp reser_date) {
      this.reser_date = reser_date;
   }
   public String getPpic1() {
      return ppic1;
   }
   public void setPpic1(String ppic1) {
      this.ppic1 = ppic1;
   }
   public String getPpic2() {
      return ppic2;
   }
   public void setPpic2(String ppic2) {
      this.ppic2 = ppic2;
   }
   public String getPpic3() {
      return ppic3;
   }
   public void setPpic3(String ppic3) {
      this.ppic3 = ppic3;
   }
   public String getCaution() {
      return caution;
   }
   public void setCaution(String caution) {
      this.caution = caution;
   }
   public String getPexplain() {
      return pexplain;
   }
   public void setPexplain(String pexplain) {
      this.pexplain = pexplain;
   }
   
   
}
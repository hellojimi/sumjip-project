<%@page import="products.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>섬집</title>

<style type="text/css">
.container div .ri-text{
	width: 360px;
	height: 345px;
}
.container div .tableDetail {
	width: 306px;
	height: 150px;
}
</style>
</head>
<body>
<%
ArrayList<ProductDTO> productlist = (ArrayList<ProductDTO>)request.getAttribute("productlist");
int currentPage = (Integer)request.getAttribute("currentPage");
int pageBlock = (Integer)request.getAttribute("pageBlock");
int startPage = (Integer)request.getAttribute("startPage");
int endPage = (Integer)request.getAttribute("endPage");
int pageCount = (Integer)request.getAttribute("pageCount");

%>
<!--     <div class="breadcrumb-section"> -->
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                     <div class="breadcrumb-text"> -->
<!--                         <h2>Our pension</h2> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->

<!-- 펜션 정보 -->
  <section class="rooms-section spad">
        <div class="container">
            <div class="row">
<%
for(int i = 0;i<productlist.size();i++){
ProductDTO dto = productlist.get(i);
%>

                <div class="col-lg-4 col-md-6">
                    <div class="room-item">
						<!--  펜션 사진들어 가는 곳 -->
						<!-- 사진없으면 샘플사진 뜨게 설정 -->
						<%if(dto.getPpic1()==null){%>
                        <a href="ProductContent.pr?pno=<%=dto.getPno()%>"><img src="upload/noimg.jpg" width="370px" height="240px"></a> 
                        <%}else{%>
                        	  <a href="ProductContent.pr?pno=<%=dto.getPno()%>"><img src="upload/<%=dto.getPpic1()%>" width="370px" height="240px"></a> 
                      <% }%>
                        <div class="ri-text">
                             <a href="ProductContent.pr?pno=<%=dto.getPno()%>"><h4><%=dto.getPname() %></h4></a>
                            <a href="ProductContent.pr?pno=<%=dto.getPno()%>"><h3>
                            <script type="text/javascript">
                            var num = <%=dto.getPprice()%>;
                            document.write(num.toLocaleString()+"원");
                            </script>
                            <span>/1박</span></h3></a>
                            <table class="tableDetail">
                                <tbody>
                                    <tr>
                                        <td class="r-o">주소 :</td>
                                        <td><%=dto.getPaddress() %></td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">체크인 :</td>
                                        <td><%=dto.getCheckin().substring(0, 2) %>시 <%=dto.getCheckin().substring(3) %>분</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">체크아웃:</td>
                                        <td><%=dto.getCheckout().substring(0, 2) %>시 <%=dto.getCheckout().substring(3) %>분</td>
                                    </tr>
                                   
                                </tbody>
                            </table>
					<!-- 	펜션 상세 정보 페이지로 이동   -->
                            <a href="ProductContent.pr?pno=<%=dto.getPno()%>" class="primary-btn">More Details</a>
                        </div>
                    </div>
                </div>
                
              
<%} %>


<!-- 페이징 -->
 <div class="col-lg-12">
                    <div class="room-pagination">
<%
if(startPage > pageBlock){
	%>
<a href="Main.me?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]<i class="fa fa-long-arrow-right"></i></a>
	<%
}                   
                    
	for(int i=startPage;i<=endPage;i++){
	%>
	<a href="Main.me?pageNum=<%=i%>"><%=i %></a> 
	<%
}
if(endPage < pageCount){
	%>
<a href="Main.me?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]
 <i class="fa fa-long-arrow-right"></i></a>	<%
}
%>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
   

</body>
</html>
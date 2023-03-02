
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="chart.RegionDTO"%>
<%@page import="chart.CountRegion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/admain.css" type="text/css" >
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<title>섬집 관리자 페이지</title>
<%
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");

CountRegion c = new CountRegion();
RegionDTO dto = c.getsalesproduct();

String id=(String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("AdminLogin.ad");
}else if(id.equals("admin")){

}else{
	%>
<script type="text/javascript">
alert("접근 권한이 없습니다.");
history.back();
</script>
<%
}
%>
</head>
<body>

<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/ad_header.jsp" />
<!-- 헤더들어가는 곳 -->
<!-- Backgrounds -->
	<div class="container">
	   	<div class="row">
	       	<div class="col-lg-5">
				<h1 class="kokuchi_title">공지사항</h1>
				<div id="news_notice">
					<table class="table table-striped kokuchi">
							<%
							BoardDAO dao=new BoardDAO();
							ArrayList<BoardDTO> boardList=dao.getBoardList(1, 10);
							for(int i=0;i<boardList.size();i++){
								BoardDTO dto1=boardList.get(i);
								
								
								%>
								<tr>
									<td style="width:50px"><%=dto1.getBno() %></td>
									<td>
										<a href="AdminBoardContent.ad?bno=<%=dto1.getBno() %>"><%=dto1.getBtitle()%></a>
									</td> 
								    <td><%=dateFormat.format(dto1.getBdate()) %></td>
							    </tr>			
								<%
							}
							%>
					</table>
				</div>
				
				
				
			</div>
		
			<div class="col-lg-5">
				<div class="content-main" style="width:1000; height:1000;">	
				<div id="chart_div" ></div> 	
					<!--Load the AJAX API-->
					<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
					<script type="text/javascript">
					
					// Load the Visualization API and the corechart package.
					google.charts.load('current', {'packages':['corechart']});
					
					// Set a callback to run when the Google Visualization API is loaded.
					google.charts.setOnLoadCallback(drawChart);
					
					// Callback that creates and populates a data table,
					// instantiates the pie chart, passes in the data and
					// draws it.
					function drawChart() {
					
					  // Create the data table.
					  var data = new google.visualization.DataTable();
					  data.addColumn('string', 'Topping');
					  data.addColumn('number', 'Slices');
					  data.addRows([
					    ['애월읍', <%=dto.get애월읍()%>],
						['성산읍', <%=dto.get성산읍()%>],
						['중문', <%=dto.get중문()%>],
						['우도', <%=dto.get우도()%>],
						['그외', <%=dto.get그외()%>]
					  ]);
					
					  // Set chart options
					  var options = {'title':'섬집 지역별 예약현황',
					               'titleTextStyle' : {
					                  fontSize: 30
					                  },
					                 'width':900,
					                 'height':700};
					
					  // Instantiate and draw our chart, passing in some options.
					  var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
					  chart.draw(data, options);
					}
					</script>
				</div>		
			</div>
		</div>
	</div>
    
    <div class="container">
	   	<div class="row">
	       	<div class="col-lg-3">
    		</div>
    		<div class="col-lg-3">
    		</div>
    		<div class="col-lg-3">
    		</div>
    		<div class="col-lg-3">
    		</div>
    	</div>
    </div>
    
    
    
    
    
</head>
<body>
    <!--Div that will hold the pie chart-->
    
 
         
      
   
</body>
</html>
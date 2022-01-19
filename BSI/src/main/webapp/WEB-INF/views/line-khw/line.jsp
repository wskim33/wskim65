<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BSI</title>

   <jsp:include page="/WEB-INF/views/modules/css.jsp" />

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

		<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
		
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

				<jsp:include page="/WEB-INF/views/modules/topbar.jsp"/>
				
                <!-- Begin Page Content -->
                <div class="container-fluid">
                
                <h1 class="h3 mb-0 text-gray-800" 
                        	style="font-weight: bold; margin-left:20px">
                        	호선별 승하차 인원
                </h1>
                
                

                     <!-- Donut Chart -->
                        <div class="col-xl-12 col-lg-12" style="margin-top: 30px; height: 500px">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3" style="height:70px">
                                    <h6 class="m-0 font-weight-bold text-primary" style="display:inline-block">하루 평균 이용 객수</h6>
                                    <div class="dropdown mb-4 show" style="float:right">
                    
                </div><!-- 승하차버튼 dropdown mb-4 show -->
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-7">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <hr>
                                    
                                    <div class="mt-6 text-center large">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-danger"></i> 1호선
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> 2호선
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-warning"></i> 3호선
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> 4호선
                                        </span>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                <!-- /.container-fluid -->
       
       <div class="con" style="width:100%">
               
               <div class="col-xl-9 col-lg-7" style="margin-left:20px; float: left">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">날짜별 평균 승하차 인원</h6>
                                    
                                    <form action="line" method="get" id="date">
                                    <select id="month" name="month" style="border:1px solid blue; background-color:blue;color:#fff;font-weight:bold;border-radius:5px">
                                    	<option value="" selected disabled>월선택</option>
                        				<c:forEach var="i" begin="1" end="8">
                        				<option value="${ i }">${ i } 월</option>
                        				</c:forEach>
                    				</select>
                    				</form>
                    			
                    				
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                    <canvas id="myChart" class="chart" style="display: block; height: 320px; width: 917px;" ></canvas>
                                    	<div class="chartjs-size-monitor">
                                    		<div class="chartjs-size-monitor-expand">
                                    			<div class="chartjs-size-monitor-shrink">
                                    				
                                    			</div>
                                    		</div>
                                    	</div>
                                    </div>
                                </div>
                            </div>
                </div><!-- 2번차트 -->
               
       </div><!-- con -->        

            </div>
            <!-- End of Main Content -->

           <jsp:include page="/WEB-INF/views/modules/footer.jsp" />

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/modules/js.jsp"/>
    <!-- Page level plugins -->
    <script src="/bsi/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/bsi/resources/js/demo/chart-area-demo.js"></script>
    <script type="text/javascript">
    
    var data1 =[];
    var data2 =[];
    var data3 =[];
    var data4 =[];
    var labels = [];
    
	$(function(){
    
    $('#month').on('change',function(e){
    	e.preventDefault();	
		e.stopPropagation();
		
    	var month = $("#month option:selected").val();
    	
    	$.ajax({
    		type:"post",
    		url:"./line",
    		data : {month : month}
    	})
    	.done(madeChart)
    	.fail(function(resp,textStatus, error){
			alert("code:"+resp.status+"\n"+"message:"+resp.responseText+"\n"+"error:"+error);
			console.log('error');
		})
    	
    })
    
 // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#858796';

    // Pie Chart Example
    var ctx = document.getElementById("myPieChart");
    var myPieChart = new Chart(ctx, {
      type: 'horizontalBar',
      data: {
        labels: ["1호선 승차", "1호선 하차", "2호선 승차", "2호선 하차", "3호선 승차", "3호선 하차", "4호선 승차", "4호선 하차" ],
        datasets: [{
          data: [ ${lines.get(0).getAvgNumber()},${lines.get(1).getAvgNumber()},${lines.get(2).getAvgNumber()},${lines.get(3).getAvgNumber()},${lines.get(4).getAvgNumber()},${lines.get(5).getAvgNumber()},${lines.get(6).getAvgNumber()},${lines.get(7).getAvgNumber()}],
          backgroundColor: ['#e74a3b', '#e74a3b', '#1cc88a', '#1cc88a', '#f6c23e', '#f6c23e', '#4e73df', '#4e73df'],
          hoverBackgroundColor: ['#e74a3b', '#e74a3b', '#1cc88a', '#1cc88a', '#f6c23e', '#f6c23e', '#4e73df', '#4e73df'],
          hoverBorderColor: "rgba(234, 236, 244, 1)",
        }],
      },
      options: {
        maintainAspectRatio: false,
        tooltips: {
          backgroundColor: "rgb(1,1,1)",
          bodyFontColor: "#858796",
          borderColor: '#dddfeb',
          borderWidth: 1,
          xPadding: 15,
          yPadding: 15,
          displayColors: true,
          caretPadding: 10,
        },
        legend: {
          	display: false
        },
        title: {
	        display: true,
	        text: 'Busan Subway'
	      },
      },
    });
    
    function madeChart(resp){
    	
    	data1.length = 0;
    	data2.length = 0;
    	data3.length = 0;
    	data4.length = 0;
    	labels.length = 0;
    	var i;
    	
    	$("#myChart").remove();
    	
    	$('.chart-area').append("<canvas id='myChart' class='chart' style='display: block; height: 320px; width: 917px;'></canvas>");
    	
		for(i =0; i < ((resp.length)/4); i++ ){
			data1.push(resp[i].avgNumber);
		}
		for(i =((resp.length)/4); i < 2*((resp.length)/4); i++ ){
			data2.push(resp[i].avgNumber);
		}
		for(i =2*((resp.length)/4); i < 3*((resp.length)/4); i++ ){
			data3.push(resp[i].avgNumber);
		}
		for(i =3*((resp.length)/4); i < (resp.length); i++ ){
			data4.push(resp[i].avgNumber);
		}
		for(i = 1; i < ((resp.length)/4)+1; i++){
			labels.push(i);
		}
		
		const data = {
		  		  labels: labels,
		  		  datasets: [
		  		    {
		  		      label: ' 1 호선 ',
		  		      data: data1,
		  		      borderColor: 'red'
		  		    },
		  		    {
		  		      label: ' 2 호선 ',
		  		      data: data2,
		  		      borderColor: 'blue'
		  		    },
		  		    {
	    		      label: ' 3 호선 ',
	    		      data: data3,
	    		  	  borderColor: 'yellow'
	    		    },
	    		 	{
	    		      label: ' 4 호선 ',
	    		      data: data4,
	    		      borderColor: 'green'
	    		    }
		  		  ]
		  		};
		  
		  
			// Area Chart Example
			  var ctx2 = document.getElementById("myChart");
			  var myLineChart = new Chart(ctx2, {
			  	  type: 'line',
			  	  data: data,
			  	  options: {
			  	    responsive: false,
			  	    plugins: {
			  	      legend: {
			  	        position: 'top',
			  	      },
			  	      title: {
			  	        display: true,
			  	        text: 'Chart.js Line Chart'
			  	      }
			  	    }
			  	  },
			  	});
			  
	}
    
	});
    </script>

</body>

</html>
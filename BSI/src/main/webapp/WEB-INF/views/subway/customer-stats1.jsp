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

                    <!-- Page Heading -->
                    
                    
                    
                    
                    
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">역별 시간별 이용객수 </h1>
                       
                    </div>

                    <!-- DataTales Example -->
                   <div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
                    <div class="card mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">역 및 기준값 설정</h6>
                    </div>                    
                    <div style="padding-top:25px;text-align:center">
					<form action="customer-stats1" method="post">
					<table class="table-light" style="width:350px; text-align: center; margin :0 auto">
						<tr>
							<th width="80px">역명 :</th>
							<th >								
								<select name="snumber" class="custom-select custom-select-sm form-control form-control-sm">
									<c:forEach var="subwayName" items="${ subwayNames }">
									<option value="${ subwayName.snumber }" ${ subwayName.snumber == selectedSnumber ? "selected" : "" }>${ subwayName.sname }</option>
									</c:forEach>
								</select>															
							</th>
							<th rowspan="2" width="100px"><button class="btn btn-primary btn-xl" input type="submit" value="조회">조회</button>
								
							</th>
						</tr>
						<tr>
	                        <th>  시간 :</th>
                            <th width="120px">
                            
                                <select name = "hour" class="custom-select custom-select-sm form-control form-control-sm">
									<c:forEach begin="1" end="24" var='idx'>
											<option value= '${ idx }시' ${ selectedHour == idx ? "selected" : "" }>${ idx }시</option>
									</c:forEach>
								</select>								
							</th>							
						</tr>
					</table>
			</form>
			</div>
			<br><br>
			</div>
					</div>
					</div>
					<div class="row">
					<div class="col-lg-12">
						<div class="card shadow mb-4">
						<div class="card-header py-3">
						<span class="m-0 font-weight-bold text-primary">데이터 조회</span>
                            <div style="clear:both"></div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>역명</th>
                                            <th>날짜</th>
                                            <th>시간</th>
                                            <th>승,하차</th>
                                            <th>이용객</th>                                         
                                            <th>하루 평균 이용객</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <c:forEach var ="vo" items="${ vo }" varStatus="status">
                                    	<tr> 
                                    		<th>${ vo.sname }</th>
                                        	<th>${ vo.date }</th>
                                            <th>${ vo.hour }</th>
                                            <th>${ vo.division }</th>
                                            <th>${ vo.unumber }</th>
                                            <th>${ avg[status.index].avgnumber }</th>
                                        </tr>
                                     </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
				</div>	
                </div>
                </div>
                <!-- /.container-fluid -->

            
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
    <script src="/bsi/resources/js/demo/chart-pie-demo.js"></script>

</body>

</html>
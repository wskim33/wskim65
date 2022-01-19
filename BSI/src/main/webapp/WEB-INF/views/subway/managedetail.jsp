<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Demoweb Board</title>

    <jsp:include page="/WEB-INF/views/modules/css.jsp"></jsp:include>

</head>


<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

		<jsp:include page="/WEB-INF/views/modules/sidebar.jsp"></jsp:include>		

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

			<jsp:include page="/WEB-INF/views/modules/topbar.jsp"></jsp:include>
		
                <!-- Begin Page Content -->
                <div class="container-fluid">

                   <!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">관리페이지</h1>
					<br>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<span class="m-0 font-weight-bold text-primary">회원 상세 보기</span>
						</div>
						<div class="card-body">

							<div class="form-group">
								<label>회원아이디</label> 
								<input class="form-control" id='title' name='title' value="${ member.memberId }">
							</div>

							<div class="form-group">
								<label>이메일</label> 
								<input class="form-control" id='writer'	name='writer' value ="${ member.email }">
							</div>

							<div class="form-group">
								<label>회원유형</label> 
								<input class="form-control" id='readCount' value="${ member.userType }">
							</div>
			
							<div class="form-group">
								<label>회원가입일자</label> 
								<fmt:formatDate var="formattedRegDate" value="${ member.regDate }" pattern="yyyy-MM-dd hh:mm:ss"/>
								<input class="form-control" id='regDate' value="${ formattedRegDate }">
							</div>

							<button id="edit-button" type="button" class="btn btn-success">관리</button>
							<button id="tolist-button" type="button" class="btn btn-success">목록</button>

						</div>
					</div>


                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            
            <%@include file="/WEB-INF/views/modules/footer.jsp" %>
			
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

    <jsp:include page="/WEB-INF/views/modules/js.jsp"></jsp:include>
    
    <!-- Page level plugins -->
    <script src="/bsi/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/bsi/resources/js/demo/chart-area-demo.js"></script>
    <script src="/bsi/resources/js/demo/chart-pie-demo.js"></script>
    <script type="text/javascript">
    
    
    $(function() {
    	$(".form-group input").attr('readonly', true);
    	
    	$('#edit-button').on('click',function(event){
    		location.href="manageedit?memberId=${ member.memberId }"
    	});
		
		$('#tolist-button').on('click',function(event){
    		location.href="manage";
    	});
    	
    });
    
    
    
    </script>

</body>

</html>
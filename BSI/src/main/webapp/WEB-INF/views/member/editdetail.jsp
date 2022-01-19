<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>

<style type="text/css">
.in {
	background-color: white;
}
</style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>My Page</title>

   <jsp:include page="/WEB-INF/views/modules/css.jsp" />

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

		<jsp:include page="/WEB-INF/views/modules/sidebar2.jsp" />
		
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

				<jsp:include page="/WEB-INF/views/modules/topbar.jsp"/>
				
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">My Information</h1>
                    </div>
                    </div>
						<div align="center">
							<form action="update" id="update" method="post" >
								<input type="hidden" name="id" value="${dto.id }" />
								<div class="card shadow mb-4">
		                        <div class="card-header py-3">
		                            <span class="m-0 font-weight-bold text-primary">내 정보</span>
		                            <div style="clear:both"></div>
		                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
									 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"
						                    style="text-align:center">
											<tr>
												<th>아이디</th>
												<td><input class="form-control" id='memberId' name='memberId' value="${ sessionScope.loginuser.memberId }" ></td>
											</tr>
											<tr>
												<th>이메일</th>
												<td><input class="form-control" id='email'	name='email' value ="${ sessionScope.loginuser.email }"></td>
											</tr>
											<tr>
												<th>유저등급</th>
												<td><input class="form-control" id='userType' name='userType' value="${ sessionScope.loginuser.userType }"></td>
											</tr>
											<tr>
												<th>가입일자</th>
												<td><input class="form-control" id='regdate' name='regdate' value="${ sessionScope.loginuser.regDate }"></td>
											</tr>
											<tr>
												<th>비밀번호</th>
												<td><input type="password" class="form-control" id='passwd' name='passwd' value=""></td>
											</tr>
											<tr>
												<th>비밀번호확인</th>
												<td><input type="password" class="form-control" id='confirm' name='confirm' value=""></td>
											</tr>
									
									<tr align="center">
										<td colspan="2">
											<input type="button" id="edit" value="수정하기"  class="btn btn-primary btn-sm"/>
											<input type="button" id="return" value="돌아가기"class="btn btn-info btn-sm" />
											<input type="reset" value="초기화하기"class="btn btn-info btn-sm" />				
										</td>
									</tr>
								</table>
							</form>
						</div>
				</div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

           <jsp:include page="/WEB-INF/views/modules/footer.jsp" />

         </div>
        <!-- End of Content Wrapper -->

   
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
    <script src="/bsi/resources/js/demo/chart-pie-demo2.js"></script>
	<script type="text/javascript">
	$(function() {
    	$("#regdate").attr('readonly', true);
    	$("#userType").attr('readonly', true);
    	$("#memberId").attr('readonly', true);
    	
    	$('#edit').click(function(){
    		
    		var pwd = $('#passwd').val();
    		var pwdconfirm = $('#confirm').val()
    		if(pwd == pwdconfirm){
    			if(pwd == "" && pwdconfirm == ""){
    				alert("비밀번호를 입력해주세요");
        			return;	
    			}	
    		}else{
    			alert("비밀번호 불일치");
    			return;
    		}	alert("수정하였습니다.")
    		$('#update').submit();
    	})
    	$('#return').click(function(){
    		location.href="5";
    	})
    	
    });
	</script>
</body>

</html>

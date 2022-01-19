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

    <title>BSI</title>

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
                        <h1 class="h3 mb-0 text-gray-800">나의 찜목록 보기</h1>
                    </div>
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
                    <div class="card mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">역 선택</h6>
                    </div>
                    <div class="card-body">
                        <table class="table-light" style="width:350px; text-align: center; margin :0 auto">
						<tr>
							<th width="80px">호선 :</th>
							<th >
								
								<select name="lname" id="lname" class="custom-select custom-select-sm form-control form-control-sm">
									<option value="" selected disabled>호선 선택</option>
									<c:forEach var="line" items="${ line }">
									<option value="${ line }">${ line }호선</option>
									</c:forEach>
								</select>
								</form>
								
							</th>
							<th rowspan="2" width="100px"><button class="btn btn-primary btn-xl" name='jjim'>찜하기</button></th>
						</tr>
						<tr>
	                        <th>역명 :</th>
                            <th width="120px">
                            	<form action="like" method="post" id="like">
                                <select name="sname"id="sname"class="custom-select custom-select-sm form-control form-control-sm">
                               		<option value="null" selected disabled>역명</option>
								</select>
								</form>
							</th>
						</tr>
					</table>
                 </div>
             </div>
		</div>
		<div class="col-lg-3"></div>
		</div>
		<div class="row">

			<div class="col-xl-12">
					
					<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <span class="m-0 font-weight-bold text-primary">찜 목록</span>
                            <div style="clear:both"></div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"
                                	   style="text-align:center">
                                    <thead>
                                        <tr>
                                            <th>역명</th>
                                            <th>등록일자</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                             
                                    <tbody>
                                    <c:forEach var = "jjim" items="${ jjim }">
                                        <tr>
                                            <td>
                                            <a href="javascript:call()" class="ss" data-jjim="${ jjim.sname }">
                                            ${ jjim.sname }</a>
                                            </td>
                                            <td>
                                            	<fmt:formatDate value="${ jjim.regDate }" pattern="yyyy-MM-dd HH:mm:ss"/>		
                                            </td>
                                            <td>
                                            <form action="delete" method="post" id="delete-form">
                                            <button id='deletebtn' name="deletebtn" class="btn btn-primary btn-sm" data-sname='${ jjim.sname }'>삭제</button>
                                            <input type="hidden" name="delete"value="${ jjim.sname }">
                                            </form>
                                            </td>
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
	<input type="hidden" value="${sessionScope.loginuser.memberId}" class="session">
    <jsp:include page="/WEB-INF/views/modules/js.jsp"/>

    <!-- Page level plugins -->
    <script src="/bsi/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/bsi/resources/js/demo/chart-area-demo.js"></script>
    <script src="/bsi/resources/js/demo/chart-pie-demo.js"></script>
	<script type="text/javascript">
	$(function(){
		
		$('#lname').off('change');
		$('#lname').on('change',function(e){
			e.preventDefault();	
			e.stopPropagation();
			
			$('#sname').children('option').remove();
			
			var lname = $("#lname option:selected").val();
			
			$.ajax({
					type:'post',
					url:'./lname3',
					data : {lname : lname},//json형식
			})
			.done(function(data){
					$('#sname').append("<option value='null' selected disabled>역명</option>")
				$(data).each(function(){
					$('#sname').append("<option value='"+ this +"'>" + this + "</option>")
				})
			})
			.fail(function(data, textStatus, error){
				alert("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+error);
				console.log('error');
			})
			.always(function(){
			})
		
		}) ;
		$("button[name='jjim']").click(function(e){
			e.preventDefault();	
			e.stopPropagation();
			var memberId = $('.session').val();
			var sname =$("#sname option:selected").val();
			if(sname == 'null'){
				alert('역명을 선택해주세요');
				return;
			}
			$.ajax({
				type:'post',
				url:'./nchk',
				data:{sname : sname, memberId : memberId}
			})
			.done(function(data){
				if(data == 1){
					alert("이미 목록에 있습니다.");
					return;
				}
				$('#like').submit();
			})
			.fail(function(data,textStatus,error){
				alert("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+error);
				console.log('error');
			})
			
			
			
		});
		$("button[name='deletebtn']").click(function(e){
			e.preventDefault();
			var sname = $(this).attr("data-sname");
			var msg = sname + " 역을 삭제하시겠습니까?";
			var memberId = $('.session').val();
			var yes = confirm(msg);
			if (yes) {
				/* $('#delete-form').submit(); */
				$.ajax({
					type:'post',
					url:'./delete',
					data:{sname : sname, memberId : memberId}
				})
				.done(function(data){
					alert("삭제되었습니다.")
					setTimeout(
			                  function() 
			                  {
			                     location.reload();
			                  }, 0001);   
				})
				.fail(function(data,textStatus,error){
				alert("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+error);
				console.log('error');
				})

			}
			
		});
		$('.ss').click(function call(){
			var jjim = $(this).attr('data-jjim');
			 var abc =jjim;
			if(jjim =='1서면'){
				abc = "1호선 서면"
			}else if(jjim =='1연산'){
				abc = "1호선 연산"
			}else if(jjim =='1동래'){
				abc = "1호선 동래"
			}else if(jjim =='2서면'){
				abc = "2호선 서면"
			}else if(jjim =='2덕천'){
				abc = "2호선 덕천"
			}else if(jjim =='3덕천'){
				abc = "3호선 덕천"
			}else if(jjim =='3연산'){
				abc = "3호선 연산"
			}else if(jjim =='4동래'){
				abc = "4호선 연산"
			}else if(jjim =='반여농산물'){
				abc = "반여농산물시장"
			} 	
			location.href ="https://m.search.naver.com/search.naver?query="+abc+"  지하철 시간표"; 
		});
		
		
		
	});
	
	
	
	
	</script>
</body>

</html>
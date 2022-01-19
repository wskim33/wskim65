<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
   
   <style type="text/css">
   #subpic{width: 1000px}
   </style>



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
                        <h1 class="h3 mb-0 text-gray-800">부산 지하철</h1>
                        <a href="https://www.humetro.busan.kr/homepage/default/stationtime/page/list.do?menu_no=1001010301"
                        	 class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                        	 <iclass="fas fa-download fa-sm text-white-50"></i>지하철시간표 검색</a>
                    </div>
                    
                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-1">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-s font-weight-bold text-primary text-uppercase mb-1">
                                                부산교통공사 대표전화
                                            </div>
                                        </div>
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">1544-5005</div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-1">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-s font-weight-bold text-success text-uppercase mb-1">    
		                                        지하철 하루평균 이용객</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
	                                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
		  											<path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
		  											<path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
												</svg>
												<fmt:formatNumber value="${ vo.unumber }" pattern="#,###"/> 명
                                        	</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-1">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-6">
                                            <div class="text-s font-weight-bold text-info text-uppercase mb-2">
                                          	<div class="col-xs">
                                            <i class="fas fa-clipboard-list fa-1x text-gray-300"></i>
                                        	시간표조회</div>
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
												<select name="lname" id="lname" class="custom-select custom-select-sm form-control form-control-sm">
													<option selected disabled>호선 선택</option>
													<c:forEach var="line" items="${ line }">
													<option value="${ line }">${ line }호선</option>
													</c:forEach>
												</select>
												</div>
												&nbsp;
												<div class="col-xl-4">
                                                <select name="sname" id='sname' class="custom-select custom-select-sm form-control form-control-sm">
                                                	<option selected disabled>역명</option>
												</select>
												</div>
												&nbsp;&nbsp;
												<div class="col-auto">
			                                        <button name='search'class="btn btn-primary">조회</button>
												</div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>
					


                    </div>
                    
					
					<!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-5 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-1">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                             <div class="text-md font-weight-bold text-primary text-uppercase mb-1">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-map" viewBox="0 0 16 16">
 											<path fill-rule="evenodd" d="M15.817.113A.5.5 0 0 1 16 .5v14a.5.5 0 0 1-.402.49l-5 1a.502.502 0 0 1-.196 0L5.5 15.01l-4.902.98A.5.5 0 0 1 0 15.5v-14a.5.5 0 0 1 .402-.49l5-1a.5.5 0 0 1 .196 0L10.5.99l4.902-.98a.5.5 0 0 1 .415.103zM10 1.91l-4-.8v12.98l4 .8V1.91zm1 12.98 4-.8V1.11l-4 .8v12.98zm-6-.8V1.11l-4 .8v12.98l4-.8z"/>
											</svg>&nbsp;지하철 노선도</div>
                                            <div ><a target="_blank" href="https://ssl.pstatic.net/sstatic/keypage/outside/subway/img/210319/smap_bs_all.png"><img class="col md-2" id="subpic" src="https://ssl.pstatic.net/sstatic/keypage/outside/subway/img/210319/smap_bs_all.png"></a></div>
                                        </div>  
                                    </div>
                                </div>
                            </div>
                        </div>
                    	<!-- Pending Requests Card Example -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-left-dark shadow h-100 py-1">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-md font-weight-bold text-dark text-uppercase mb-0">
                                                일평균 이용객 순위</div>
                                                <div>&nbsp;</div>
                                            <c:forEach var="rank" items="${ list }">
                                            <marquee direction="up" scrolldelay="400">   
                                            <div class="h6 mb-0 font-weight-bold text-gray-800" style="text-align: center">${ rank.ranking }위&nbsp;&nbsp;${ rank.sname }&nbsp;-&nbsp;${ rank.division }&nbsp;-&nbsp;${ rank.unumber }명<hr width="200px"></div>
                                        	</marquee>
                                        	</c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Pending Requests Card Example -->
                        <c:if test="${ sessionScope.loginuser !=null }">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-1">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-6">
                                        	
                                            <div class="text-md font-weight-bold text-warning text-uppercase mb-0">
                                              MY JJIM LIST &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/bsi/member/like">목록가기</a>
                                            </div>
                                            <div>&nbsp;</div>
                                            <c:if test="${ s.memberId == sessionScope.loginuser.memberId }">
                                            <c:forEach var="jjim" items="${ jjim }">
                                            <div class="h6 mb-0 font-weight-bold text-gray-800" style="text-align: center">
                                            <a href="javascript:call()" class="ss" data-jjim="${ jjim.sname }">${ jjim.sname }</a><hr></div>
                                        	</c:forEach>
                                        	</c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:if>
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
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
	<script type="text/javascript">
	$(function(){
		$('.carousel').carousel({
			  interval: 100
			});
	});
	$('#lname').on('change',function(e){
		e.preventDefault();	
		e.stopPropagation();

		$('#sname').children('option').remove();
		
		var lname = $("#lname option:selected").val();
		
		$.ajax({
				type:'post',
				url:'./lname',
				data : {lname : lname},//json형식
		})
		.done(function(data){
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
	$(document).ready(function(){
		$("button[name='search']").click(function(e){
			e.preventDefault();	
			e.stopPropagation();
			if($("#sname option:selected").val()=='역명'){
				alert("선택해주세요")
				return;
			}
			var abc =$('#sname').prop('value');
			if($("#sname option:selected").val()=='1서면'){
				abc = "1호선 서면"
			}else if($("#sname option:selected").val()=='1연산'){
				abc = "1호선 연산"
			}else if($("#sname option:selected").val()=='1동래'){
				abc = "1호선 동래"
			}else if($("#sname option:selected").val()=='2서면'){
				abc = "2호선 서면"
			}else if($("#sname option:selected").val()=='2덕천'){
				abc = "2호선 덕천"
			}else if($("#sname option:selected").val()=='3덕천'){
				abc = "3호선 덕천"
			}else if($("#sname option:selected").val()=='3연산'){
				abc = "3호선 연산"
			}else if($("#sname option:selected").val()=='4동래'){
				abc = "4호선 동래"
			}else if($("#sname option:selected").val()=='반여농산물'){
				abc = "반여농산물시장"
			}	
			location.href ="https://m.search.naver.com/search.naver?query="+abc+"  지하철 시간표";
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
				abc = "4호선 동래"
			}else if(jjim =='반여농산물'){
				abc = "반여농산물시장"
			} 	
			location.href ="https://m.search.naver.com/search.naver?query="+abc+"  지하철 시간표"; 
		});
	});
	
	</script>
</body>

</html>

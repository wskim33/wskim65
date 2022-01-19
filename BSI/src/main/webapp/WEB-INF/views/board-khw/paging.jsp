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
                        <h1 class="h3 mb-0 text-gray-800" 
                        	style="font-weight: bold; margin-left:20px">
                        	건의사항
                        </h1>
                    </div>
                    
                     <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <span class="m-0 font-weight-bold text-primary">글 목록</span>
                            <c:if test="${sessionScope.loginuser != null }">
                            <a href="write" class="btn btn-primary btn-sm" style="float:right">글쓰기</a>
                            </c:if>
                            <div style="clear:both"></div>
                        </div>
                        <div class="row">
                        <div class="col-xl-11"></div>
                        <div class="col-xl-1">
                        <div style="float:middle;">
							<select id="cntPerPage" name="sel" onchange="selChange()"class="custom-select custom-select-sm form-control form-control-sm">
								<option value="5"
									<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
								<option value="10"
									<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
								<option value="15"
									<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
								<option value="20"
									<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
							</select>
						</div> <!-- 옵션선택 끝 -->
						</div>
						</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"
                                	   style="text-align:center">
                                    <thead>
                                        <tr>
                                            <th style="width:80px;">번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일자</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                             
                                    <tbody>
                                    <c:forEach var = "board" items="${ viewAll }">
                                        <tr>
                                            <td>
                                            <a href="detail?boardNo=${ board.boardNo }">
                                            ${ board.boardNo }
                                            </a>	
                                            </td>
                                            <td>
                                           		<c:choose>
                                           		<c:when test="${ not board.deleted }">
                                           		<a href="detail?boardNo=${ board.boardNo }">${ board.title }</a>
                                           		</c:when>
                                           		<c:otherwise>
                                           		<span style="color:lightgray">${ board.title } [삭제된 글]</span>
                                           		</c:otherwise>	
                                           		</c:choose>
                                            </td>
                                            <td>${ board.memberId }</td>
                                            <td>
											<fmt:formatDate value="${ board.regDate }" pattern="yyyy-MM-dd HH:mm:ss"/>		
											</td>
                                            <td>${ board.readCount }</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div style="display: block; text-align: center;" >		
								<c:if test="${paging.startPage != 1 }">
									<a href="list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}" >&lt;</a>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<b >${p }</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a href="list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a href="list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</c:if>
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
    <script src="/bsi3/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/bsi3/resources/js/demo/chart-area-demo.js"></script>
    <script src="/bsi3/resources/js/demo/chart-pie-demo.js"></script>
    <script type="text/javascript">
	    function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href="list?nowPage=${paging.nowPage}&cntPerPage="+sel;
		}
    </script>

</body>

</html>
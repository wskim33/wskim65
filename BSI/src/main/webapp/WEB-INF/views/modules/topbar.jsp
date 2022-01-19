<%@ page language="java"
		 contentType="text/html; charset=UTF-8"
   		 pageEncoding="UTF-8"%>
   		 
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

				<!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                	
                	<p style="font-size:12px;font-style:italic;margin-top:20px"> Busan Subway Information with team4</p>

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>


                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
					

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - User Information -->
                        <c:choose>
                        <c:when test="${ empty loginuser }">
                        </li>
							<li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="/bsi/account/login">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Login</span>
                            </a>
                        </li>
                        </li>
							<li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="/bsi/account/register">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Register</span>
                            </a>
                        </li>
                        </c:when>
                        <c:otherwise>
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#">
                                 <span class="mr-2 d-none d-lg-inline text-gray-600 small">${ sessionScope.loginuser.memberId } 님 </span>
                                <img class="img-profile rounded-circle"
                                    src="/bsi/resources/img/undraw_profile.svg">
                            </a>
                        </li>
							<li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="/bsi/account/logout.action">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Logout</span>
                            </a>
                        </li>
                        </c:otherwise>
                        </c:choose>
                    </ul>

                </nav>
                <!-- End of Topbar -->
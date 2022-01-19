<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/bsi">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">부산 지하철 </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/bsi">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>부산 지하철</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                메 뉴
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/bsi/subway/customer-stats1" >
                    <i class="fas fa-fw fa-cog"></i>
                    <span>역별 시간별 이용객수</span>
                </a>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/bsi/subway/2">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>역별 승하차 인원</span>
                </a>
            </li>

			<!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/bsi/line-khw/line">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>호선별 승하차 인원</span>
                </a>
            </li>
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/bsi/board-khw/list">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>건의 사항 게시판</span>
                </a>
            </li>
			
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/bsi/member/5" >
                    <i class="fas fa-fw fa-folder"></i>
                    <span>마이페이지</span>
                </a>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/bsi/subway/manage" >
                    <i class="fas fa-fw fa-folder"></i>
                    <span>관리페이지</span>
                </a>
            </li>
            
             <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/bsi/subway/init-data.action" >
                    <i class="fas fa-fw fa-folder"></i>
                    <span>데이터초기화</span>
                </a>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>


        </ul>
        <!-- End of Sidebar -->
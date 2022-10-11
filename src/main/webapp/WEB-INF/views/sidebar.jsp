<%--
  Created by IntelliJ IDEA.
  User: skawn
  Date: 2022-07-27
  Time: ì¤í 5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>
<c:if test="${empty mem}">
  <script>
    location.href = "login.do";
  </script>
</c:if>
<c:set var="spid" value="${param.pid}"></c:set>
<c:if test="${empty param.pid}">
  <c:set var="spid" value="0"></c:set>
</c:if>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Brand Logo -->
  <a href="dashboard.do?pid=${spid}" class="brand-link">
    <!--
    <img src="${path}/pms/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
    -->
    <span class="brand-text font-weight-light">Effective Porject Management</span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user panel (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="info">
        <a class="d-block">   ${mem.name} (${mem.empno})</a>
      </div>
      <div class="col-5">
          	<a href="${path}/logout.do" class="btn btn-block btn-danger">Logout</a>
      </div>
    </div>

    <!-- SidebarSearch Form -->
    <div class="form-inline">
      <div class="input-group" data-widget="sidebar-search">
        <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-sidebar">
            <i class="fas fa-search fa-fw"></i>
          </button>
        </div>
      </div>
    </div>

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <!-- Add icons to the links using the .nav-icon class
             with font-awesome or any other icon font library -->
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-tachometer-alt"></i>
            <p>
              Dashboard
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <c:if test="${mem.auth eq 'ADMIN' || mem.auth eq 'CEO' || mem.auth eq 'HR'}">
            <li class="nav-item">
              <a href="adminDashboard.do?tab=1&pid=${spid}" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Admin Dashboard</p>
              </a>
            </li>
            </c:if>
            <li class="nav-item">
              <a href="dashboard.do?pid=${spid}" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Dashboard</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-book"></i>
            <p>
              사원정보
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <c:if test="${mem.auth == 'CEO' || mem.auth == 'ADMIN' || mem.auth == 'HR'}">
            <li class="nav-item">
              <a href="memberlist.do?pid=${spid}" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>사원 관리</p>
              </a>
            </li>
            </c:if>
            <li class="nav-item">
              <a onclick="func();" class="nav-link" style="cursor:pointer">
                <i class="far fa-circle nav-icon"></i>
                <p>내 사원정보</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a href="WorkPageList.do?pid=${spid}" class="nav-link">
            <i class="nav-icon fas fa-book"></i>
            <p>
              개인업무페이지

            </p>
          </a>
        </li>
        <li class="nav-item">
          <a href="calendar.do?pid=${spid}" class="nav-link">
            <i class="nav-icon fas fa-book"></i>
            <p>
              개인 일정관리(캘린더)
            </p>
          </a>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-book"></i>
            <p>
              프로젝트
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <c:if test="${mem.auth == 'CEO' || mem.auth == 'ADMIN' || mem.auth == 'HR'}">
            <li class="nav-item">
              <a href="adminProjectList.do?pid=${spid}" class="nav-link">
                 <i class="nav-icon fas fa-book"></i>
                <p>프로젝트 목록</p>
              </a>
            </li>
            </c:if>
	        <li class="nav-item">
	          <a href="projectList.do?pid=${spid}" class="nav-link">
	            <i class="nav-icon fas fa-book"></i>
	            <p>
	              개인 프로젝트 목록
	            </p>
	          </a>
	        </li>
          </ul>
        </li>
        <li class="nav-item">
          <a href="chattingFrm.do?pid=${spid}" class="nav-link">
            <i class="nav-icon fas fa-book"></i>
            <p>
              채팅
            </p>
          </a>
        </li>
        
        <li class="nav-item">
          <a href="manage.do?pid=${spid}" class="nav-link">
            <i class="nav-icon fas fa-book"></i>
            <p>
              PM업무
            </p>
          </a>
        </li>
       
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>
<script>
function func(){	
	var mid = ${mem.mid}
	window.location.href = "mypage.do?mid=" + mid + "&pid=${spid}";
}
</script>
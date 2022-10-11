<%--
  Created by IntelliJ IDEA.
  User: skawn
  Date: 2022-07-27
  Time: ì¤í 5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Brand Logo -->
  <a href="${path}/pms/index3.html" class="brand-link">
    <img src="${path}/pms/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
    <span class="brand-text font-weight-light">AdminLTE 3</span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user panel (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="info">
        <a class="d-block">${mem.name} (${mem.empno})</a>
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
          <a id="noticeList" href="#" class="nav-link">
            <i class="nav-icon fas fa-th"></i>
            <p>
              공지사항
            </p>
          </a>
        </li>
        <li class="nav-item">
          <a id="manage" href="#" class="nav-link active">
            <i class="nav-icon fas fa-th"></i>
            <p>
              업무관리
            </p>
          </a>
        </li>
        <li class="nav-item">
          <a id="jobcheck" href="#" class="nav-link">
            <i class="nav-icon fas fa-th"></i>
            <p>
              산출물확인
            </p>
          </a>
        </li>
        <li class="nav-item">
          <a id="edit_pp" href="#" class="nav-link">
            <i class="nav-icon fas fa-th"></i>
            <p>
              멤버관리
            </p>
          </a>
        </li>
        <li class="nav-item">
          <a id="dashboard" href="#" class="nav-link">
            <i class="nav-icon fas fa-th"></i>
            <p>
              대시보드
            </p>
          </a>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>
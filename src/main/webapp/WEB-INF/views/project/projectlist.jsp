<%--
  Created by IntelliJ IDEA.
  User: skawn
  Date: 2022-07-28
  Time: 오후 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path}/pms/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="${path}/pms/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="${path}/pms/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="${path}/pms/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path}/pms/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="${path}/pms/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="${path}/pms/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="${path}/pms/plugins/summernote/summernote-bs4.min.css">
    <!-- jQuery -->
    <script src="${path}/pms/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">

	function goInsert(){
		location.href="${path}/projectInsertForm.do"
	}
	function goDetail(pid){
		location.href="${path}/projectDetail.do?pid="+pid;
	}	
	function goDash(pid){
		location.href="${path}/dashboard.do?pid="+pid;	
	}


</script>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="${path}/pms/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- topbar -->
  <jsp:include page="../topbar.jsp"/>
  <!-- /.topbar -->

  <!-- Main Sidebar Container -->
  <jsp:include page="../sidebar.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Project</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="dashboard.do?pid=${param.pid}">Home</a></li>
              <li class="breadcrumb-item active">개인 프로젝트 목록</li>
            </ol>
          </div><!-- /.col --> 
          
          

        </div><!-- /.row -->
                  <form id="frm01" class="form" method="post">
         	<div class="input-group">
         		
              <input type="search" name="pname" value="${projectSch.pname}" class="form-control form-control-lg" placeholder="제목">
                   <div class="input-group-append">
                        <button type="submit" class="btn btn-lg btn-default">
                                <i class="fa fa-search"></i>
                         </button>
                    </div>
            	      
            </div>
            </form> 
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
      	<form id="frm01" class="form" method="post">
      		<input type="hidden" name="curPage" value="0"> <!-- 하단 js에 의해서 현재페이지 번호를 전송  -->

        <div class="card-header">
          <h3 class="card-title">Projects</h3>
            

       
          <div class="card-tools">
	          <div class="input-group-append">
	          <span class="text-center input-group-text">총 : ${projectSch.count }건</span>
				<span class="text-center input-group-text">페이지 크기</span>
				<select name="pageSize" class="form-control">
					<option>3</option>
					<option>5</option>
					<option>10</option>
					<option>20</option>
					<option>30</option>
				</select>
			</div>
			<script type="text/javascript">
				// 선택된 페이지 크기 설정.. 
				$("[name=pageSize]").val("${projectSch.pageSize}");
				// 페이지 크기 변경시 마다, controller 단호출..
				$("[name=pageSize]").change(function(){
					$("[name=curPage]").val("1");
					$("form").submit();
				});		
			</script>
	
		</div>
        </div>
        <div class="card-body p-0">
          <table class="table table-striped projects">
              <thead>
                  <tr>
                      <th style="width: 1%">
                          #
                      </th>
                      <th style="width: 20%">
                          Project Name
                      </th>
                      <th style="width: 30%">
                          Project Period
                      </th>
                      <th>
                          Project 
                      </th>
                      <th class="text-center">
                          Status
                      </th>     
                                
                  </tr>
              </thead>
                   <c:forEach var="project" items="${prjList}" varStatus="sts">
              <tbody>  
            
                  <tr ondblclick="goDetail(${project.pid})">
                      <td>
                          ${sts.index+1}
                      </td>
                      <td>
                          <a>
                            ${project.pname}  
                          </a>
                          <br/>
                          <small>
                          	등록일: ${project.pregdate}                           
                          </small>
                      </td>
                      <td>
                          <a>
                          ${project.pstart}
                          
                          </a>
                          <br/>
                          <a>
                          ~ ${project.pend}
                         
                          </a>
                      </td>                     
                      <td class="project_progress">
                          <div class="progress progress-sm">
                              <div class="progress-bar bg-green" role="progressbar" aria-valuenow="${project.progress}" aria-valuemin="0" aria-valuemax="100" style="width: ${project.progress}%">
                              </div>
                          </div>
                          <small>
                              ${project.progress} Complete
                          </small>
                      </td>
                      <td class="project-state">                         
 		              		<a>
 		              			${project.pstatus}
 		              		</a>        
                     
                      </td>
                 	
                      <td class="project-actions text-right">
                      	<button type="button" onclick="goDetail(${project.pid})" class="btn btn-warning btn-sm">상세보기</button>
                      	<button type="button" onclick="goDash(${project.pid})" class="btn btn-info btn-sm">대시보드</button> 
                      </td>
                  
                  </tr>
                       
              </tbody>
              </c:forEach>
          </table>
          
        </div>
        <div class="row">
          <div class="col">
          <ul class="pagination justify-content-center m-0">
            <li class="page-item"><a class="page-link" href="javascript:goPage(${projectSch.startBlock-1})">&laquo;</a></li>
            <c:forEach var="cnt" begin="${projectSch.startBlock}" end="${projectSch.endBlock}">
              <li class="page-item ${projectSch.curPage==cnt?'active':''}">
                <a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="javascript:goPage(${projectSch.endBlock+1})">&raquo;</a></li>
          </ul>
          </div>
        </div>
        
        <!-- /.card-body -->
        </form>
        
        
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="../footer.jsp"/>

  <!-- Control Sidebar -->
  <jsp:include page="../ctrlsidebar.jsp"/>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery UI 1.11.4 -->
<script src="${path}/pms/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="${path}/pms/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="${path}/pms/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="${path}/pms/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="${path}/pms/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="${path}/pms/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="${path}/pms/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="${path}/pms/plugins/moment/moment.min.js"></script>
<script src="${path}/pms/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="${path}/pms/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="${path}/pms/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="${path}/pms/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/pms/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${path}/pms/dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${path}/pms/dist/js/pages/dashboard.js"></script>

<script type="text/javascript">
	function goPage(cnt){
		// 요청값으로 현재 클릭한 페이지를 설정하고, 서버에 전달
		$("[name=curPage]").val(cnt);
		$("form").submit();
			
	}
	
	// 값 받아와서 db에 저장하기
	
</script>
</body>
</html>
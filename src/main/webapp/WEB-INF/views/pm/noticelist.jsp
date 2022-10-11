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
 <!-- Bootstrap4 Duallistbox -->
  <link rel="stylesheet" href="${path}/pms/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
  <!-- summernote -->
  <link rel="stylesheet" href="${path}/pms/plugins/summernote/summernote-bs4.min.css">
  <script src="${path}/frappe-gantt/dist/frappe-gantt.min.js"></script>
	<link rel="stylesheet" href="${path}/frappe-gantt/dist/frappe-gantt.min.css">
	<style>
	.chart-controls {
    text-align: center;
	}
	</style>
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
  <jsp:include page="pmsidebar.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"></h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Start v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- 페이지 구성 시작!! -->
<div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h2 class="card-title">공지사항</h2>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              <form class="form"  method="post">
					<input type="hidden" name="curPage" value="0">
					<span class="form-control" style="border:none"> </span>	
					<div class="input-group-append float-right">
						<span class="text-center input-group-text">페이지 크기</span>
						<select name="pageSize" class="form-select">
							<option value="3">3</option>
							<option value="5">5</option>
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
						</select>
					</div>
					</form>
					</div>
              		<table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th style="text-align:center;">제목</th>
                    <th style="text-align:center;">등록일</th>
                    <th style="text-align:center;">수정일</th>
                  </tr>
                  </thead>
                  <tbody class="nlist">
					<c:forEach var="n" items="${nlist}">
                  <tr style="cursor:center;" ondblclick="goDetail(${n.nid}, ${param.pid})">
                    <td style="text-align:center;">${n.ntitle}</td>
                    <td style="text-align:center;">
                    <fmt:formatDate value="${n.nregdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                    <td style="text-align:center;">
                    <fmt:formatDate value="${n.nuptdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                  </tr>
                  </c:forEach>
                  </tbody>
                </table>
                 <div class="card-footer">
              		<ul class="pagination justify-content-center">
				  <li class="page-item"><a class="page-link" href="javascript:goPage(${sch.startBlock-1})">이전</a></li>
				  <c:forEach var="cnt" begin="${sch.startBlock}" end="${sch.endBlock}">
				  	<li class="page-item ${sch.curPage==cnt?'active':''}">
				  			<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
				  </c:forEach>
				  <li class="page-item"><a class="page-link" href="javascript:goPage(${sch.endBlock+1})">다음</a></li>
				</ul>
					<button class="float-right btn btn-primary" onclick="insertNotice()">공지등록</button>
              	</div>
              	</div>
              	
              	</div>
              	
              <!-- /.card-body -->
              
            </div>
                          	
            </div>
        <!-- 페이지 구성 끝!! -->
<!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="footer.jsp"/>

  <!-- Control Sidebar -->
  <jsp:include page="ctrlsidebar.jsp"/>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${path}/pms/plugins/jquery/jquery.min.js"></script>
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
  <!-- Bootstrap4 Duallistbox -->
<script src="${path}/pms/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<script >
$(document).ready(function(){
	$(".nav-link").click(function(){
		var id = $(this).attr("id");
		if(id != undefined){
			location.href="${path}/" + id + ".do?pid=" + ${param.pid};
		}
	});
	$(".nav-link").removeClass("active");
	$("#noticeList").addClass("active");
	$("[name=pageSize]").val("${sch.pageSize}");
	// 페이지 크기 변경시 마다, controller 단 호출..
	$("[name=pageSize]").change(function(){
		$("[name=curPage]").val("1");
		$("form").submit();
	});
});

function goDetail(nid, pid) {
	location.href="${path}/noticeDetail.do?pid="+pid+"&nid="+nid;
}

function goPage(cnt){
	// 요청값으로 현재 클릭한 페이지를 설정하고, 서버에 전달..
	$("[name=curPage]").val(cnt);
	$("form").submit();
}
function insertNotice(){
	location.href="${path}/insertNoticeForm.do?pid=" + ${param.pid};
}
  </script>
</body>
</html>

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
            <h1 class="m-0">멤버관리</h1>
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
          <div class="col-6">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">참여중인 멤버</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              		<table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>이름</th>
                    <th>이메일</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody class="pplist">

                  </tbody>
                </table>
              	</div>
              	</div>
              <!-- /.card-body -->
              <form id="reqForm">
              	<input name="mid" type="hidden" value="0"/>
              	<input name="pid"  type="hidden" value="${pid}"/>
              	<input name="ppid" type="hidden" value="0"/>
              </form>
              
            </div>
                          		
			          <div class="col-6">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">참여가능한 멤버</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
<table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>이름</th>
                    <th>이메일</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody class="mlist">

                  </tbody>
                </table>
              	</div>
              	</div>
              <!-- /.card-body -->
            </div>
            </div>
        <!-- 페이지 구성 끝!! -->
      </div><!-- /.container-fluid -->
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
	ajaxlist("pplist");
	$(".nav-link").click(function(){
		var id = $(this).attr("id");
		if(id != undefined){
			location.href="${path}/" + id + ".do?pid=" + ${pid};
		}
	});
	$(".nav-link").removeClass("active");
	$("#edit_pp").addClass("active");
});

function removePP(){
	if(confirm("선택한 멤버를 프로젝트에서 제외하시겠습니까?")){
		var ppid = $(this).parent().parent().children()[0].innerText;
		$("input[name=ppid]").val(ppid);		
		ajaxlist("removepp");
	}
}

function addPP(){
	if(confirm("선택한 멤버를 프로젝트에 참여시키겠습니까?")){
		var mid = $(this).parent().parent().children()[0].innerText;
		$("input[name=mid]").val(mid);
		ajaxlist("addpp");
	}
}

function ajaxlist(url){
	$.ajax({
		url: "${path}/" + url + ".do",
		data: $("form").serialize(),
		dataType: "json",
		success: function(data){
			var pp = data.pplist;
			var m = data.mlist;
			var html1 = "";
			var html2 = "";
			for(var i = 0; i < pp.length; i++){
				if(${sessionScope.mem.mid} != pp[i].mid){
					html1 += "<tr><td style='display:none;'>" + pp[i].ppid + "</td><td>" + pp[i].name + "</td><td>" + pp[i].email
					+ "</td><td><button name='remove' type='button' class='btn btn-primary'> - </button></td></tr>";
				}
			}
			for(var i = 0; i < m.length; i++){
				html2 += "<tr><td style='display:none;'>" + m[i].mid + "</td><td>" + m[i].name + "</td><td>" + m[i].email
					+ "</td><td><button name='add' type='button' class='btn btn-primary'> + </button></td></tr>";
			}
			$("tbody.pplist").html(html1);
			$("tbody.mlist").html(html2);
			$("[name=remove]").click(removePP);
			$("[name=add]").click(addPP);
		}
	});
}
  </script>
</body>
</html>

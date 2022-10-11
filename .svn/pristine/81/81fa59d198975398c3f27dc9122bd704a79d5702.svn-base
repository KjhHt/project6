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
  <jsp:include page="topbar.jsp"/>
  <!-- /.topbar -->

  <!-- Main Sidebar Container -->
  <jsp:include page="sidebar.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">업무관리</h1>
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
        <form>
        <input type="hidden" name="pid" value="1"/>
        <div class="card card-primary">
        <div class="card-body">
        	<div class="row">
        		<div class="col-6">
                <div class="form-group">
                  <label>시작일:</label>
                    <div class="input-group date" id="startdate" data-target-input="nearest">
                        <input name="start" type="text" class="form-control datetimepicker-input" data-target="#startdate"/>
                        <div class="input-group-append" data-target="#startdate" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                </div>
                </div>
                <div class="col-6">
                <div class="form-group">
                  <label>마감일:</label>
                    <div class="input-group date" id="enddate" data-target-input="nearest">
                        <input name="end" type="text" class="form-control datetimepicker-input" data-target="#enddate"/>
                        <div class="input-group-append" data-target="#enddate" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                </div>
                </div>
             </div>
             <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label>담당자:</label>
                  <select name="ppids" class="duallistbox" multiple="multiple">
                    <c:forEach var="pp" items="${pplist}">
                    	<option value="${pp.ppid}">${pp.name}(${pp.email})</option>
                    </c:forEach>
                  </select>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
                <div class="form-group">
                        <label>업무이름:</label>
                        <input id="job" name="name" type="text" class="form-control" placeholder="Enter ...">
                      </div>
                      <div class="form-group">
                        <label>업무내용:</label>
                        <textarea id="content" name="content" class="form-control" rows="3" placeholder="Enter ..."></textarea>
                      </div>
                </div>
                <div class="card-footer">
             <button id="addjob" type="button" class="btn btn-primary float-right">업무 등록</button>
             </div>
             </div>
   		</form>
        <div>
        	<svg id="gantt"></svg>
        </div>
        <div class="chart-controls">
    <div class="button-cont">
        <button id="day-btn">
            Day
        </button>

        <button id="week-btn">
            Week
        </button>

        <button id="month-btn">
            Month
        </button>
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
	var gantt;
	var tasks;
	$(document).ready(function(){
		$('.duallistbox').bootstrapDualListbox();
		$.ajax({
			url:"${path}/joblist.do",
			data:{pid:1},
			dataType:"json",
			success:function(data){
				tasks = data.joblist
				gantt = new Gantt("#gantt", tasks);
			}
		});
		$('#addjob').click(function(){
			console.log($("form").serialize());
			job = $('#job').val();
			if(job == ''){
				alert("업무 이름을 입력하세요");
				$('#job').focus();
				return;
			}
			$.ajax({
				url:"${path}/addjob.do",
				data: $("form").serialize(),
				dataType:"json",
				success: function(){
					$.ajax({
						url:"${path}/joblist.do",
						data:{pid:1},
						dataType:"json",
						success:function(data){
							tasks = data.joblist
							gantt = new Gantt("#gantt", tasks);
						}
					});
				}
			});

			$('#job').val('');
			$('#content').val('');
			$('.duallistbox option').prop('selected', false);
			$('.duallistbox').bootstrapDualListbox('refresh', true);
		});
		/* tasks = [
			  {
				id: 'Task 1',
				name: '업무11',
				start: '2022-08-02',
				end: '2022-08-10',
				progress: 20,
				dependencies: ''
			  },
			  {
					id: 'Task 4',
					name: '444업무44444',
					start: '2022-08-09',
					end: '2022-08-15',
					progress: 20,
					dependencies: 'Task 1'
				  },
			  	{
					id: 'Task 2',
					name: '업무22222',
					start: '2022-08-05',
					end: '2022-08-11',
					progress: 20,
					dependencies: ''
				},
				{
					id: 'Task 3',
					name: '업무3333',
					start: '2022-08-04',
					end: '2022-08-07',
					progress: 20,
					dependencies: ''
				  }
				  
			]
			gantt = new Gantt("#gantt", tasks); */
	  document.querySelector(".chart-controls #day-btn").addEventListener("click", () => {
		    gantt.change_view_mode("Day");
		})
		document.querySelector(".chart-controls #week-btn").addEventListener("click", () => {
		    gantt.change_view_mode("Week");
		})
		document.querySelector(".chart-controls #month-btn").addEventListener("click", () => {
		    gantt.change_view_mode("Month");
		})
		$('#startdate').datetimepicker({
	        format: 'L'
	    });
	  $('#enddate').datetimepicker({
	        format: 'L'
	    });
	  $(".nav-link").removeClass("active");
		$("#manage").addClass("active");
});

  </script>
</body>
</html>

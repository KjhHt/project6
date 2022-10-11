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
  <title>EPM Dashboard</title>

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
  <!-- fullcalendar -->
  <link href='${path}/fullcalendar/lib/main.css' rel='stylesheet' />
  <script src='${path}/fullcalendar/lib/main.js'></script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<script>

</script>

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
            <h1 class="m-0">Admin Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Admin Dashboard</li>
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
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">프로젝트 일정 캘린더</h3>

                <div class="card-tools">
                  <button id="pcalextend" type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                  </button>
                </div>
                <!-- /.card-tools -->
              </div>
              <!-- /.card-header -->
              <div class="card-body" style="max-height: 500px; overflow-y:scroll"> <!-- style="max-height: 600px; overflow-y:scroll" -->
                <div id="pcalendar"></div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>

        <div class="row mb-3">
          <div class="col-md-8 offset-md-2">
            <form action="adminDashboard.do">
              <div class="input-group">
                <input type="hidden" name="tab" value="${param.tab}">
                <input name="pname" value="${param.pname}"
                       type="search" class="form-control form-control-lg" placeholder="검색할 프로젝트명 입력">
                <div class="input-group-append">
                  <button type="submit" class="btn btn-lg btn-default">
                    <i class="fa fa-search"></i>
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>

        <div class="row">
          <c:forEach var="prj" items="${prjList}">
            <div class="col-lg-12">
              <div class="card card-primary collapsed-card">
                <div class="card-header">
                  <h3 class="card-title">${prj.pname}</h3>

                  <div class="card-tools">
                    <button id="plist${prj.pid}" onclick="loaddash2(${prj.pid});" type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                    </button>
                  </div>
                  <!-- /.card-tools -->
                </div>
                <!-- /.card-header -->
                <div class="card-body p-0" style="max-height: 600px">
                  <!--<div id="pp${prj.pid}" class="embed-responsive embed-responsive-16by9">-->
                  <div id="pp${prj.pid}" <c:if test="${param.tab != 1}">class="iframe-mode" data-widget="iframe" data-loading-screen="600"</c:if>>
                    </div>
                  <!--</div>-->
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
          </c:forEach>
        </div>
        <div class="row">
          <div class="col">
          <ul class="pagination justify-content-center m-0">
            <li class="page-item"><a class="page-link" href="javascript:goPageP(${projectSch.startBlock-1})">&laquo;</a></li>
            <c:forEach var="cnt" begin="${projectSch.startBlock}" end="${projectSch.endBlock}">
              <li class="page-item ${projectSch.curPage==cnt?'active':''}">
                <a class="page-link" href="javascript:goPageP(${cnt})">${cnt}</a></li>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="javascript:goPageP(${projectSch.endBlock+1})">&raquo;</a></li>
          </ul>
          </div>
        </div>
        <!-- 페이지 구성 끝!! -->
      </div><!-- /.container-fluid -->
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
<script>
  $(document).ready(function(){
    <%--
    --%>
    <c:forEach var="prj" items="${prjList}">
    //$("#plist${prj.pid}").click();
    </c:forEach>

    var toDay = new Date()
    var date = toDay.toISOString().split("T")[0]
    console.log(date)

    var calendarEl = document.getElementById('pcalendar');

    calendar = new FullCalendar.Calendar(calendarEl, {
      height: 900,
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,listMonth'
      },
      initialDate: date,
      initialView: 'listMonth',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,

      editable: false,
      dayMaxEvents: true, // allow "more" link when too many events
      events: function(info, successCallback, failureCallback){
        // http://localhost:7080/springweb/calList.do callist
        $.ajax({
          type:"post",
          url:"${path}/calPrjList.do",
          //data:"pid=" + ${param.pid} + "&job=1",
          dataType:"json",
          success:function(data){
            console.log(data.pcallist)
            successCallback(data.pcallist)
          },
          error:function(err){
            console.log(err)
          }
        });
      }
    });
    calendar.render();
    $("#pcalextend").click();
  });
  var addHTMLz = "";
  <c:forEach var="prj" items="${prjList}">
  /*
  addHTMLz = "";
  addHTMLz += '<div id="pp${prj.pid}" class="embed-responsive embed-responsive-16by9">';
  addHTMLz += '<iframe class="embed-responsive-item" src="dashboard.do?pid='+ ${prj.pid} +'&hide=1"></iframe>';
  addHTMLz += '</div>';
  $("#pp${prj.pid}").html(addHTMLz);
  console.log(addHTMLz);
  */
  </c:forEach>

  function loaddash2(pid){

    var addHTML = "";
    addHTML += '<div id="pp'+ pid +'" class="embed-responsive embed-responsive-16by9">';
    addHTML += '<iframe class="embed-responsive-item" src="dashboard.do?pid='+ pid +'&hide=1" style="max-height: 600px; overflow-y:scroll"></iframe>';
    addHTML += '</div>';
    $("#pp"+pid).html(addHTML);

  }

  function goPageP(cnt) {
    var f = document.createElement('form');
    f.setAttribute('method','post');

    var obj = document.createElement('input');
    obj.setAttribute('type','hidden');
    obj.setAttribute('name','curPage');
    obj.setAttribute('value',cnt);
    f.appendChild(obj);
    document.body.appendChild(f);
    f.submit();
  }
</script>
</body>
</html>

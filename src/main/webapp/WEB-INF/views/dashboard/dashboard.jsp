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
  <!-- gantt -->
  <script src="${path}/frappe-gantt/dist/frappe-gantt.min.js"></script>
  <link rel="stylesheet" href="${path}/frappe-gantt/dist/frappe-gantt.min.css">
  <!-- fullcalendar -->
  <link href='${path}/fullcalendar/lib/main.css' rel='stylesheet' />
  <script src='${path}/fullcalendar/lib/main.js'></script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<script>
  function updateIssue(cnt){
    $.ajax({
      url: "${path}/issueListAjax.do",
      data: "pid=" + ${param.pid} + "&curPage=" + cnt,
      dataType: "json",
      success: function (data) {
        //console.log(data)
        var list = data.ilist;
        var addHTML = "";
        var addPage = "";
        $(list).each(function (idx, rst) {
          addHTML += "<tr><td>" + ((data.issuesSch.curPage-1)*3+(idx + 1)) + "</td><td>" + rst.jname
            + "</td><td>" + rst.ititle + "</td><td>" + rst.iprogress + "</td>";
          addHTML += "<td>" + rst.name + "</td><td>" + new Date(rst.iuptdate).toLocaleDateString()+ "</td></tr>";
        });
        //console.log(addHTML);
        $("#ilist").html(addHTML);
        // Page 처리
        var isch = data.issuesSch;
        console.log(isch);
        addPage += "<li class='page-item'><a class='page-link' href='javascript:goPageI(" + (isch.startBlock-1) + ")'>&laquo;</a></li>";
        for(var i = isch.startBlock; i <= isch.endBlock; i++){
          addPage += '<li class="page-item ' + (isch.curPage==i?'active':'') + '">';
          addPage += '<a class="page-link" href="javascript:goPageI(' + i + ')">' + i + '</a></li>';
        }
        addPage += '<li class="page-item"><a class="page-link" href="javascript:goPageI(' + (isch.endBlock+1) + ')">&raquo;</a></li>';
        $("#ipage").html(addPage);
      }
    });
  }

  function updateNotice(cnt){
    $.ajax({
      url: "${path}/noticeListAjax.do",
      data: "pid=" + ${param.pid} + "&curPage=" + cnt,
      dataType: "json",
      success: function (data) {
        //console.log(data)
        var list = data.nlist;
        var addHTML = "";
        var addPage = "";
        $(list).each(function (idx, rst) {
          addHTML += "<tr><td>" + ((data.noticeSch.curPage-1)*3+(idx + 1)) + "</td><td>" +
                  "<a href='#modal-dash' data-toggle='modal' data-target='#modal-dash' onclick='getNotice("+ rst.nid +")'>" + rst.ntitle + "</a></td>";
          addHTML += "<td>" + new Date(rst.nuptdate).toLocaleDateString()+ "</td></tr>";
        });
        //console.log(addHTML);
        $("#nlist").html(addHTML);
        // Page 처리
        var nsch = data.noticeSch;
        //console.log(isch.startBlock);
        addPage += "<li class='page-item'><a class='page-link' href='javascript:goPageN(" + (nsch.startBlock-1) + ")'>&laquo;</a></li>";
        for(var i = nsch.startBlock; i <= nsch.endBlock; i++){
          addPage += '<li class="page-item ' + (nsch.curPage==i?'active':'') + '">';
          addPage += '<a class="page-link" href="javascript:goPageN(' + i + ')">' + i + '</a></li>';
        }
        addPage += '<li class="page-item"><a class="page-link" href="javascript:goPageN(' + (nsch.endBlock+1) + ')">&raquo;</a></li>';
        $("#npage").html(addPage);
      }
    });
  }

  function getNotice(nid){
    $.ajax({
      url: "${path}/notice.do",
      data: "nid=" + nid,
      dataType: "json",
      success: function (data) {
        console.log(data)
        var notice = data.notice;
        var addHTML = "";
        var addPage = "";
        addHTML += "<p>" + notice.ncontent + "</p>";
        $("#m-title").text(notice.ntitle);
        $("#m-content").html(addHTML);
        //console.log(addHTML);
        //$("#nlist").html(addHTML);
      }
    });
  }

  function goPageI(cnt){
    // 요청값으로 현재 클릭한 페이지를 설정하고, 서버에 전달..
    updateIssue(cnt);
  }
  function goPageN(cnt){
    // 요청값으로 현재 클릭한 페이지를 설정하고, 서버에 전달..
    updateNotice(cnt);
  }

  var calendar;
  $(document).ready(function () {
    updateIssue(1);
    updateNotice(1);

    var toDay = new Date()
    var date = toDay.toISOString().split("T")[0]
    console.log(date)

    var calendarEl = document.getElementById('calendar');

    calendar = new FullCalendar.Calendar(calendarEl, {
      height: 900,
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: date,
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,

      editable: false,
      dayMaxEvents: true, // allow "more" link when too many events
      events: function(info, successCallback, failureCallback){
        // http://localhost:7080/springweb/calList.do callist
        $.ajax({
          type:"post",
          url:"${path}/calList.do",
          data:"pid=" + ${param.pid} + "&job=1",
          dataType:"json",
          success:function(data){
            console.log(data.callist)
            successCallback(data.callist)
          },
          error:function(err){
            console.log(err)
          }
        });
      }
    });
    calendar.render();
    //$("#calextend").click();
  });
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
  <div class="content-wrapper pt-2">
    <!-- Content Header (Page header) -->
    <c:if test="${empty param.hide}">
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    </c:if>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- 페이지 구성 시작!! -->
        <div class="modal fade" id="modal-dash">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="m-title">공지사항</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body" id="m-content">
                <p>One fine body&hellip;</p>
              </div>
              <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title text-bold">간트차트</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                </div>
                <!-- /.card-tools -->
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              <c:choose>
                <c:when test="${empty jlist}">

                  <div class="col-12 align-items-center justify-content-center align-content-center">
                    <!-- small card -->
                    <div class="small-box bg-warning justify-content-center">
                      <div class="inner">
                        <h2>등록된 업무가 없습니다!</h2>
                      </div>
                    </div>
                  </div>
                </c:when>
                <c:otherwise>
                  <div class="row text-center align-items-center justify-content-center align-content-center" style="text-align: center">
                    <div class="col-1 m-0 p-0">
                      <button class="btn btn-block btn-dark btn-sm" onclick="gantt.change_view_mode('Day');">
                        Day
                      </button>
                    </div>
                    <div class="col-1 m-0 p-0">
                      <button class="btn btn-block btn-dark btn-sm" onclick="gantt.change_view_mode('Week');">
                        Week
                      </button>
                    </div>
                    <div class="col-1 m-0 p-0">
                      <button class="btn btn-block btn-dark btn-sm" onclick="gantt.change_view_mode('Month');">
                        Month
                      </button>
                    </div>
                  </div>
                  <div class="row">
                    <svg id="gantt"></svg>
                  </div>
                </c:otherwise>
              </c:choose>
              <c:if test="${empty jlist}">

              </c:if>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>

        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">내 일정</h3>

                <div class="card-tools">
                  <button id="calextend" type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                  </button>
                </div>
                <!-- /.card-tools -->
              </div>
              <!-- /.card-header -->
              <div class="card-body" style="max-height: 500px; overflow-y:scroll"> <!-- style="max-height: 600px; overflow-y:scroll" -->
                <div id="calendar"></div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->

        <div class="row">
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title text-bold">최근 공지사항</h3>

                <div class="card-tools">
                  <ul id="npage" class="pagination pagination-sm float-right">
                    <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                  </ul>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table">
                  <thead>
                  <tr>
                    <th style="width: 10px">#</th>
                    <th>제목</th>
                    <th class="col-sm-3">수정일</th>
                  </tr>
                  </thead>
                  <tbody id="nlist">
                  <c:forEach var="notice" items="${nlist}">
                    <tr>
                      <td>${notice.nid}</td>
                      <td>${notice.ntitle}</td>
                      <td><fmt:formatDate value="${notice.nuptdate}" type="date"/></td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title text-bold">최근 이슈사항</h3>

                <div class="card-tools">
                  <ul id="ipage" class="pagination pagination-sm float-right">
                    <li class="page-item"><a class="page-link" href="javascript:goPage(${issueSch.startBlock-1})">&laquo;</a></li>
                    <c:forEach var="cnt" begin="${issueSch.startBlock}" end="${issueSch.endBlock}">
                      <li class="page-item ${issueSch.curPage==cnt?'active':''}">
                        <a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
                    </c:forEach>
                    <li class="page-item"><a class="page-link" href="javascript:goPage(${issueSch.endBlock+1})">&raquo;</a></li>
                  </ul>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table">
                  <thead>
                  <tr>
                    <th style="width: 10px">#</th>
                    <th>업무</th>
                    <th>제목</th>
                    <th>현황</th>
                    <th>작성자</th>
                    <th>수정일</th>
                  </tr>
                  </thead>
                  <tbody id="ilist">
                  <c:forEach var="issue" items="${ilist}" varStatus="sts">
                    <tr>
                      <td>${sts.index+1}</td>
                      <td>${issue.jname}</td>
                      <td>${issue.ititle}</td>
                      <td>${issue.iprogress}</td>
                      <td>${issue.name}</td>
                      <td><fmt:formatDate value="${issue.iuptdate}" type="date"/></td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>

        <div class="row">
          <!-- 이슈 차트 -->
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">이슈 현황</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                  <div class="col-md-8">
                    <div class="chart-responsive">
                      <canvas id="issuePieChart" height="150"></canvas>
                    </div>
                    <!-- ./chart-responsive -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-4">
                    <ul class="chart-legend clearfix">
                      <li><i class="far fa-circle text-success"></i> 해결</li>
                      <li><i class="far fa-circle text-warning"></i> 해결중</li>
                      <li><i class="far fa-circle text-danger"></i> 해결불가</li>
                      <li><i class="far fa-circle text-primary"></i> 대기</li>
                    </ul>
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer p-0">
                <c:choose>
                  <c:when test="${iprog[5] == 0}">
                    <ul class="nav nav-pills flex-column">
                      <li class="nav-item">
                        <span class="text-success nav-link">등록된 데이터가 없습니다!</span>
                      </li>
                    </ul>
                  </c:when>
                  <c:otherwise>
                    <ul class="nav nav-pills flex-column">
                      <li class="nav-item">
                        <a href="#" class="nav-link">
                          해결
                          <span class="float-right text-success">
                        <i class="fas fa-arrow-up text-sm"></i> <fmt:formatNumber value="${iprog[0]/iprog[5]*100}" pattern="#.##"/>%
                      </span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="#" class="nav-link">
                          해결중
                          <span class="float-right text-warning">
                        <i class="fas fa-arrow-left text-sm"></i> <fmt:formatNumber value="${iprog[1]/iprog[5]*100}" pattern="#.##"/>%
                      </span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="#" class="nav-link">
                          반려
                          <span class="float-right text-danger">
                        <i class="fas fa-arrow-down text-sm"></i>
                        <fmt:formatNumber value="${iprog[2]/iprog[5]*100}" pattern="#.##"/>%</span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="#" class="nav-link">
                          검토요청
                          <span class="float-right text-primary">
                        <i class="fas fa-arrow-down text-sm"></i>
                        <fmt:formatNumber value="${iprog[3]/iprog[5]*100}" pattern="#.##"/>%</span>
                        </a>
                      </li>
                    </ul>
                  </c:otherwise>
                </c:choose>

              </div>
              <!-- /.footer -->
            </div>
            <!-- /.card -->
          </div>
          <!-- 업무 차트 -->
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">업무 현황</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                  <div class="col-md-8">
                    <div class="chart-responsive">
                      <canvas id="jobPieChart" height="150"></canvas>
                    </div>
                    <!-- ./chart-responsive -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-4">
                    <ul class="chart-legend clearfix">
                      <li><i class="far fa-circle text-success"></i> 완료</li>
                      <li><i class="far fa-circle text-warning"></i> 진행중</li>
                    </ul>
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer p-0">
                <c:choose>
                  <c:when test="${jprog[5] == 0}">
                    <ul class="nav nav-pills flex-column">
                      <li class="nav-item">
                        <span class="text-success nav-link">등록된 데이터가 없습니다!</span>
                      </li>
                    </ul>
                  </c:when>
                  <c:otherwise>
                    <ul class="nav nav-pills flex-column">
                      <li class="nav-item">
                        <a href="#" class="nav-link">
                          완료
                          <span class="float-right text-success">
                        <i class="fas fa-arrow-up text-sm"></i> <fmt:formatNumber value="${jprog[0]/jprog[5]*100}" pattern="#.##"/>%
                      </span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="#" class="nav-link">
                          진행중
                          <span class="float-right text-warning">
                        <i class="fas fa-arrow-left text-sm"></i> <fmt:formatNumber value="${jprog[1]/jprog[5]*100}" pattern="#.##"/>%
                      </span>
                        </a>
                      </li>
                    </ul>
                  </c:otherwise>
                </c:choose>
              </div>
              <!-- /.footer -->
            </div>
            <!-- /.card -->
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
<script>
  var gantt
  $(document).ready(function() {
    // 간트차트
    var tasks = [
      <c:forEach var="job" items="${jlist}">
      {
        id: '${job.jid}',
        name: '${job.jname}',
        start: '<fmt:formatDate value="${job.jstart}" pattern="yyyy-MM-dd"></fmt:formatDate>',
        end: '<fmt:formatDate value="${job.jend}" pattern="yyyy-MM-dd"></fmt:formatDate>',
        progress: ${job.percent*100},
        dependencies: '${job.required}',
        read_only: true,
        readonly: true
      },
      </c:forEach>
    ]
    gantt = new Gantt("#gantt", tasks, {
      step: 12,
      view_mode: 'Day',
      read_only: true,
      readonly: true
    });
    //$('.gantt .bar-wrapper').css('pointer-events', 'none');
    gantt.change_view_mode('Month');
    gantt.clear();
    gantt.render();
    gantt.bar_being_dragged = true;
    $('.gantt .bar-label').css('fill', '#555');
  })

  // 이슈차트
  var pieChartCanvas = $('#issuePieChart').get(0).getContext('2d')
  var pieData = {
    labels: [
      '해결',
      '해결중',
      '반려',
      '검토요청',
    ],
    datasets: [
      {
        data: [${iprog[0]}, ${iprog[1]}, ${iprog[2]}, ${iprog[3]}],
        backgroundColor: ['#00a65a', '#f39c12', '#f56954', '#5464f5']
      }
    ]
  }
  var pieOptions = {
    legend: {
      display: false
    }
  }
  var pieChart = new Chart(pieChartCanvas, {
    type: 'doughnut',
    data: pieData,
    options: pieOptions
  })
  // 업무차트
  var pieChartCanvas = $('#jobPieChart').get(0).getContext('2d')
  var pieData = {
    labels: [
      '완료',
      '진행중',
    ],
    datasets: [
      {
        data: [${jprog[0]}, ${jprog[1]}],
        backgroundColor: ['#00a65a', '#f39c12']
      }
    ]
  }
  var pieOptions = {
    legend: {
      display: false
    }
  }
  var pieChart2 = new Chart(pieChartCanvas, {
    type: 'doughnut',
    data: pieData,
    options: pieOptions
  })
</script>
</body>
</html>

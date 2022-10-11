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
  <title>My Calendar</title>

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
<script type="text/javascript">
  document.addEventListener('DOMContentLoaded', function() {
    var toDay = new Date()
    var date = toDay.toISOString().split("T")[0]
    console.log(date)

    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: date,
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        $("#regBtn").show()
        $("#uptBtn").hide()
        $("#delBtn").hide()
        $("#exampleModalLongTitle").text("일정등록");
        $("#frm01")[0].reset(); // 기존 등록된 데이터 삭제 처리..
        $("#modalBox").click(); // 팝업창 로딩:이벤트를 하지 않더라도 코드에 의해 강제 실행 처리..
        console.log("#fullcalendar 데이터#")
        console.log(arg)
        console.log(arg.start)
        console.log(arg.end)
        console.log(arg.color) // 입력으로 넣을 예정
        console.log(arg.textColor) // 입력으로 넣을 예정
        console.log(arg.allDay)
        //alert(new Date(arg.start.getTime()-arg.start.getTimezoneOffset()*60000).toISOString().slice(0, -5));
        // arg.start.toISOString() : GMT 기준 시간으로 나온다.
        $("#frm01 [name=start]").val(new Date(arg.start.getTime()-arg.start.getTimezoneOffset()*60000).toISOString().slice(0, -5))
        $("#frm01 [name=end]").val(new Date(arg.end.getTime()-arg.start.getTimezoneOffset()*60000).toISOString().slice(0, -5))
        $("#frm01 [name=allDay]").val(""+arg.allDay)
        // 내용은 추가적으로 넣을 예정..
      },
      // 있는 데이터를 클릭시, (상세 내용을 보고 수정/삭제..)
      eventClick: function(arg) {
        $("#regBtn").hide()
        $("#uptBtn").show()
        $("#delBtn").show()
        $("#exampleModalLongTitle").text("일정상세");
        $("#modalBox").click(); // 모달창 로딩..
        formData(arg.event)
      },
      eventDrop:function(info){
        // 일정을 클릭해서 드랍처리 시, 날짜 변경
        formData(info.event)
        $("#frm01").attr("action","${path}/calUpdate.do");
        $("#frm01").submit();
      },
      eventResize:function(info){
        // 시간일정을 늘리거나 줄일때..
        formData(info.event)
        $("#frm01").attr("action","${path}/calUpdate.do");
        $("#frm01").submit();
      },

      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: function(info, successCallback, failureCallback){
        // http://localhost:7080/springweb/calList.do callist
        $.ajax({
          type:"post",
          url:"${path}/calList.do",
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
  });
  function formData(event){
    // 매개변수로 받은 일정 내용을 설정처리..
    $("#frm01 [name=mcid]").val(event.id)
    $("#frm01 [name=title]").val(event.title)
    //$("#frm01 [name=start]").val(event.start.toISOString())
    $("#frm01 [name=start]").val(new Date(event.start.getTime()-event.start.getTimezoneOffset()*60000).toISOString().slice(0, -5))
    if(event.end!=null){
      //$("#frm01 [name=end]").val(event.end.toISOString())
      $("#frm01 [name=end]").val(new Date(event.end.getTime()-event.end.getTimezoneOffset()*60000).toISOString().slice(0, -5))
    }else{
      //$("#frm01 [name=end]").val(event.start.toISOString())
      $("#frm01 [name=end]").val(new Date(event.end.getTime()-event.end.getTimezoneOffset()*60000).toISOString().slice(0, -5))
    }
    $("#frm01 [name=backgroundColor]").val(event.backgroundColor)
    $("#frm01 [name=textColor]").val(event.textColor)
    $("#frm01 [name=allDay]").val(""+event.allDay)
    $("#frm01 [name=content]").val(event.extendedProps.content)
  }
</script>
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
            <h1 class="m-0">My Calendar</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">My Calendar</li>
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
            <div id="calendar"></div>
            <h2 data-toggle="modal" id="modalBox"
                data-target="#exampleModalCenter" style="display:none;">모달창 로딩</h2>
            <div class="modal fade" id="exampleModalCenter">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <form id="frm01" class="form"  method="get">
                      <input type="hidden" name="mcid" value="0"/>
                      <div class="row">
                        <div class="col">
                          <input type="text" class="form-control" placeholder="제목 입력"
                                 data-bs-toggle="tooltip"  title="제목 입력" name="title">
                        </div>
                        <div class="col">
                          <select name="allDay" class="form-control"   data-bs-toggle="tooltip"  title="종일여부">
                            <option value="false">시간</option>
                            <option value="true">종일</option>
                          </select>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <div class="form-group">
                            <div class="input-group">
                              <input name="start" type="datetime-local" class="form-control"/>
                            </div>
                          </div>
                        </div>
                        <div class="col-6">
                          <div class="form-group">
                            <div class="input-group">
                              <input name="end" type="datetime-local" class="form-control"/>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <input type="color" class="form-control"  data-bs-toggle="tooltip"  title="배경색상"
                                 value="#0099cc" name="backgroundColor">
                        </div>
                        <div class="col">
                          <input type="color" class="form-control"   data-bs-toggle="tooltip"  title="글자색상"
                                 value="#ccffff" name="textColor">
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
	        <textarea name="content" rows="7"  class="form-control"
                      data-bs-toggle="tooltip"  placeholder="내용 입력"  title="내용" ></textarea>
                        </div>
                      </div>

                    </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" id="regBtn" class="btn btn-primary">일정등록</button>
                    <button type="button" id="uptBtn" class="btn btn-info">일정수정</button>
                    <button type="button" id="delBtn" class="btn btn-danger">일정삭제</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  </div>
                  <script type="text/javascript">
                    $("#regBtn").click(function(){
                      if(confirm("등록하시겠습니까?")){
                        $("#frm01").attr("action","${path}/calInsert.do");
                        $("#frm01").submit();
                      }
                    });
                    $("#uptBtn").click(function(){ // calUpdate.do
                      if(confirm("수정하시겠습니까?")){
                        $("#frm01").attr("action","${path}/calUpdate.do");
                        $("#frm01").submit();
                      }
                    });
                    $("#delBtn").click(function(){
                      if(confirm("삭제하시겠습니까?")){
                        $("#frm01").attr("action","${path}/calDelete.do");
                        $("#frm01").submit();
                      }
                    });
                    // 11:15~
                  </script>
                </div>
              </div>
            </div>
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
</script>
</body>
</html>

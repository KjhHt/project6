<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<c:if test="${param.iid == 0}">
<script type="text/javascript">
	alert("등록된 이슈가 없습니다!");
	location.href="WorkPageList.do?pid=${param.pid}";
</script>
</c:if>
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
     
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">이슈사항 수정 및 삭제</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>

            	
            <div class="card-body">
             <form action="${path}/uptIssuespage.do" class="form" method="post">
				<input type=hidden name="pid" value="${param.pid}"/> 
				<input type=hidden name="iid" value="${param.iid}"/> 
              <div class="form-group">
                <label for="inputName">제 목</label>
                <input type="text" name="ititle" value="${isList.ititle}" class="form-control">
              </div>
              <div class="form-group">
                <label for="inputDescription">이슈사항 내용</label>
                <textarea name="icontent" class="form-control" rows="4">${isList.icontent}</textarea>
              </div>              
              <div class="form-group">              
				<label for="inputDescription">최근 수정일</label>
			<input  class="form-control" 
				value='<fmt:formatDate value="${isList.iuptdate}" pattern="yyyy-MM-dd hh:mm:ss"/>' placeholder="작성자 입력하세요" />	
              </div>
              <div class="form-group"> 
              	<label for="inputProjectLeader">처리현황</label>
                <select name="iprogress" class="form-control pm-select">
                  <option value="PROG">수정</option>
                </select> 
              </div>
			  </form>
            </div>
  	  </div>
      </div>
      <div class="row">
        <div class="col-12">
          <a href="WorkPageList.do?pid=${param.pid}" class="btn btn-secondary">취소</a>  
		  <button type="button" onclick="delProc()" class="btn btn-danger float-right">삭제</button>            
          <button type="button" onclick="uptProc()" class="btn btn-primary float-right">수정</button>
        </div>
      </div>
      

    </section>
        <!-- 페이지 구성 끝!! -->
      </div><!-- /.container-fluid -->
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="../footer.jsp"/>

  <!-- Control Sidebar -->
  <jsp:include page="../ctrlsidebar.jsp"/>
  <!-- /.control-sidebar -->
<!-- ./wrapper -->
<script type="text/javascript">
	function uptProc(){
		if(confirm("이슈사항 수정 하시겠습니까?")){
			var ititleVal = $("[name=ititle]").val();		
			if(	ititleVal == ""){
				alert("등록된 제목이 없습니다.");
				$("[name=ititle]").focus();
				return; 
			}	
			var icontentVal = $("[name=icontent]").val();		
			if(	icontentVal == ""){
				alert("등록된 내용이 없습니다.");
				$("[name=icontent]").focus();
				return; 
			}			
			alert("수정이 완료됬습니다.");
			$("form").attr("action","${path}/uptIssuespage.do");
			$("form").submit();
			}
	}
	function delProc(){
		if(confirm("신청하신 이슈사항을 삭제 하시겠습니까?")){			
			alert("삭제 완료됬습니다.");
			$("form").attr("action","${path}/delIssuespage.do");
			$("form").submit();
			}
	}
	
</script>
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
</body>
</html>
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
  
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	
  <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
  

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
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
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
            <h1 class="m-0">사원 상세정보</h1>
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
     	<form id="frm01" enctype="multipart/form-data" action="${path}/sendEmpnoAndPassword.do" class="form"  method="post">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">${member.name}님 사원정보</h3>
            </div>
            <input id="mid" name="mid" type="hidden" value="${member.mid}" class="form-control" readonly>
            <div class="card-body">
              <div class="form-group">
                <label for="inputName">사원번호</label>
                <input id="empno" name="empno" type="text" value="${member.empno}" class="form-control" readonly>
              </div>
              <div class="form-group">
                <label for="inputName">이메일</label>
                <input id="email" name="email" type="text" value="${member.email}" class="form-control" readonly>
              </div>
              <div class="form-group">
                <label for="inputName">이름</label>
                <input id="name" name="name" type="text" value="${member.name}" class="form-control" readonly>
              </div>
              <div class="form-group">
                <label for="inputName">핸드폰 번호</label>
                <input id="phonenumber" name="phonenumber" type="text" value="${member.phonenumber}" class="form-control" readonly>
              </div>
              <div class="form-group">
                <label for="inputName">생년월일</label>
                <input id="birthdate" name="birthdate" type="text" value="${member.birthdate}" class="form-control" readonly>
              </div>
                <label for="inputProjectLeader">권한</label>
              <div class="form-group">
                <select id="auth" name="auth" class="form-control pm-select">
                  <option>${member.auth}</option>
			      <option>CEO</option>
			      <option>ADMIN</option>
			      <option>HR</option>
			      <option>MEMBER</option>
			      <option>GUEST</option>
                </select> 
              </div>
              <div class="form-group"> 
              	<label for="inputProjectLeader">승인 여부</label>
                <select id="status" name="status" class="form-control pm-select">
				  <option>${member.status}</option>
			      <option>승인</option>
			      <option>대기</option>
                </select> 
              </div>    
              <div class="form-group">
              	<label for="inputProjectLeader">가입일자</label>
                	<fmt:formatDate value="${member.accessdate}" pattern="yyyy-MM-dd hh:mm:ss"/>
              </div>                                    
              </div>
            </div>
            <!-- /.card-body -->
          <!-- /.card -->
      <div class="row">
        <div class="col-12" style="text-align:right">    
          <button type="button" onclick="authorize(${memlist.mid})" class="btn btn-primary btn-sm">권한변경 및 승인</button>
          <button type="button" onclick="updateEmpno(${memlist.mid})" class="btn btn-info btn-sm">사원번호 발급</button>
          <button type="button" onclick="deleteMember(${memlist.mid})" class="btn btn-danger btn-sm">탈퇴</button>
        </div>       
      </div>
       </form>
        <!-- 페이지 구성 끝!! -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  </div>
  <jsp:include page="../footer.jsp"/>

  <!-- Control Sidebar -->
  <jsp:include page="../ctrlsidebar.jsp"/>
  <!-- /.control-sidebar -->
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
</body>

<script type="text/javascript">
	var msg = "${msg}"
	
    if(msg!="") alert(msg)
	function authorize(mid){
		if(confirm("해당 사원정보를 수정하시겠습니까?")){
			$("form").attr("action","${path}/authorize.do");
			$("form").submit();
		}
	} 
	function deleteMember(){
		var mid = $("[name=mid]").val()
		
		if(confirm("해당 사원을 삭제하시겠습니까?")){
			location.href="${path}/deleteMember.do?mid="+mid;
		}
	} 
	
	function updateEmpno(){
		var mid = $("[name=mid]").val()
		
		if(confirm("사원번호를 발급 처리하시겠습니까?")){
			$("form").attr("action","${path}/sendEmpnoAndPassword.do");
			$("form").submit();
		}
	}
	
	
	var proc = "${proc}"
	if(proc=="upt"){
		alert("권한변경 및 승인 처리 완료");
		location.href="${path}/memberlist.do?mid=" + ${param.mid};
	}		
	
	if(proc=="del"){
		alert("삭제완료\n사원 관리 페이지로 이동합니다.");
		location.href="${path}/memberlist.do";
	}
	
	if(proc=="uptE"){
		location.href="${path}/memberDetail.do?mid=" + ${param.mid};
	}
	
</script>
</html>
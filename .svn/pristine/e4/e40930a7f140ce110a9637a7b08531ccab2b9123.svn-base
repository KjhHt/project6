<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<style type="text/css">

    tr.hover:hover { background-color: #F5F5F5;
             cursor:pointer;
     }

</style>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Effective PM | Issues</title>

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
            <h1 class="m-0">사원 관리</h1>
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

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">사원 리스트</h3>
          <div class="card-tools">
	<form id="frm01" class="form"  method="post">
		<input type="hidden" name="curPage" value="0"><!-- 하단의 js에 의해서 현재페이지 호출 -->
 	<div class="input-group lb-3">
		<div class="input-group-prepend">
			<span class="text-center input-group-text">EPM 총 사원수: ${memberSch.count}명</span>
		</div>
		<div class="input-group-append">
			<select name="pageSize" class="form-control">
				<option>3</option>
				<option>5</option>
				<option>10</option>
				<option>20</option>
				<option>30</option>
			</select>
		</div>
	</div>  	
          </div>
        </div>
        <div class="card-body p-0">
          <table class="table">
              <thead>
                  <tr>
                      <th style="width: 1%">
                          #
                      </th>
                      <th style="width: 12%">
                          이메일
                      </th>
                      <th style="width: 8%">
                          이름
                      </th>
                      <th style="width: 8%">
                          사원번호
                      </th>
                      <th style="width: 8%">
                          권한
                      </th>
                      <th style="width: 6%">
                          승인여부
                      </th>
                      <th style="width: 12%">
                          가입일자
                      </th>  
                  </tr>
              </thead>
              <tbody>
              <c:forEach var="memlist" items="${memlist}">
                  <tr class="hover" ondblclick="goDetail(${memlist.mid})">
                      <td>
                          ${memlist.cnt}
                      </td>
                      <td>
                          <div>
                              ${memlist.email}
                          </div>
                      </td>
                      <td>
                          <a>
                              ${memlist.name}
                          </a>
                      </td>
                      <td>
                          <div>
                              ${memlist.empno}
                          </div>
                      </td>
                      <td>
                          <div>
                              ${memlist.auth}
                          </div>
                      </td>
                      <td>
                          <div>
                              ${memlist.status}
                          </div>
                      </td>
                      <td>
                          <div>
                              <fmt:formatDate value="${memlist.accessdate}" pattern="yyyy-MM-dd hh:mm:ss"/>
                          </div>
                      </td>
                  </tr>
              </c:forEach>            
              </tbody>
          </table>
          </form>
          
          
          <ul class="pagination justify-content-end">
	  
	  <li class="page-item">
	  <a class="page-link" href="javascript:goPage(${memberSch.startBlock-1})">이전</a></li>
	  <c:forEach var="cnt" begin="${memberSch.startBlock}" end="${memberSch.endBlock}">
	  	<li class="page-item ${memberSch.curPage==cnt?'active':''}">
	  		<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
	  </c:forEach>
	  <li class="page-item"><a class="page-link" href="javascript:goPage(${memberSch.endBlock+1})">다음</a></li>
	</ul>
        </div>
        <!-- /.card-body -->
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
<script type="text/javascript">
function goDetail(mid){
	location.href="${path}/memberDetail.do?mid="+mid;
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
<script type="text/javascript">
var msg = "${msg}"
    if(msg!="") alert(msg)
    
    
			// 선택된 페이지 크기 설정..
			$("[name=pageSize]").val("${memberSch.pageSize}");
			// 페이지 크기 변경시 마다, controller 단호출..
			$("[name=pageSize]").change(function(){
				$("[name=curPage]").val("1");
				$("form").submit();
			});
			
			
			function goPage(cnt){
				// 요청값으로 현재 클릭한 페이지를 설정하고 서버에 전달..
				$("[name=curPage]").val(cnt);
				$("form").submit();
			}
</script>
</body>
</html>
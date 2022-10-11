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
            <h1 class="m-0">업무관리</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
	<button data-toggle="modal" id="modalBox" data-target="#addjobmodal" type="button" class="btn btn-primary float-right"> + </button>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- 페이지 구성 시작!! -->
<div class="card">
              <div class="card-header">
              </div>
              <!-- /.card-header -->
              <div class="card-body">
	<form class="form"  method="post">
		<input type="hidden" name="curPage" value="0">
	<div class="input-group">
		<div class="input-group-prepend">
			<div style="background-color:white; border:none;" class="text-center input-group-text"><h4>출력된 리스트 : ${workPageSch.count} 건</h4></div>
		</div>
		<span class="form-control" style="border:none"> </span>	
		<div class="input-group-append">
			<span class="text-center input-group-text">승인여부</span>
			<select name="jmstatus" class="form-select" >
				<option value="">전체</option>
				<option value="PROG">진행중</option>
				<option value="COMP">완료</option>
				<option value="REQ">승인요청</option>
				<option value="REJ">반려</option>
			</select>
			<span class="text-center input-group-text">페이지 크기</span>
			<select name="pageSize" class="form-select">
				<option value="3">3</option>
				<option value="5">5</option>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
			</select>
		</div>
		</div>
		</form>

	
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th style="text-align:center;" width="3%">번호</th>
                    <th style="text-align:center;" width="7%">담당자 (사원번호)</th>
                    <th style="text-align:center;" width="9%">시작날짜</th>
                    <th style="text-align:center;" width="9%">마감날짜</th>
                    <th style="text-align:center;" width="15%">업무이름</th>
                    <th style="text-align:center;" width="9%">수정일</th>
                    <th style="text-align:center;" width="5%">진행률</th> 					
                    <th style="text-align:center;" width="5%">승인여부</th>
                    <th style="text-align:center;" width="2%">이슈상세</th>
                    <th style="text-align:center;" width="5%">이슈처리상태</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="wl" items="${wlist}">
                  <tr style="cursor:center;" ondblclick="goDetail(${wl.jid},${wl.jmid},${param.pid}, ${wl.mid })">
                    <td style="text-align:center;">${wl.cnt}</td>
                    <td style="text-align:center;">${wl.name}(${wl.empno})</td>
                    <td style="text-align:center;">
                    <fmt:formatDate value="${wl.jstart}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                    <td style="text-align:center;">
                    <fmt:formatDate value="${wl.jend}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                    <td style="text-align:center;">${wl.jname}</td> 
                    <td style="text-align:center;">
                    <fmt:formatDate value="${wl.juptdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>       
                    <td style="text-align:center;">${wl.progress}%</td>
				<td style="text-align:center;" >${wl.jmstatus}</td>
                    <td style="text-align:center;" width="5%">
	         			<div class="btn-group-vertical">
	         				<button class="btn btn-warning" type="button" onclick="goiDetail(${param.pid},${wl.iid})">		         	
		         					<i class="fas fa-folder-open"></i>		         				
	         				</button>
	         			</div>	             
                    </td>
                <td style="text-align:center;">
                    <c:choose>
                        <c:when test="${wl.iprogress=='PROG'}">
                            진행중
                        </c:when>
                        <c:when test="${wl.iprogress=='REJ'}">
                            반려
                        </c:when>
                        <c:when test="${wl.iprogress=='REQ'}">
                            대기중
                        </c:when>
                        <c:when test="${wl.iprogress=='COMP'}">
                            완료
                        </c:when>
                        <c:otherwise>
                            ${wl.iprogress}
                        </c:otherwise>
                    </c:choose>
                </td>
                  </tr>
                  </c:forEach>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th colspan="10">승인요청은 해당업무 더블클릭</th>
                  </tr>
                  </tfoot>
                </table>
	<ul class="pagination justify-content-end">
	  <li class="page-item"><a class="page-link" href="javascript:goPage(${workPageSch.startBlock-1})">이전</a></li>
	  <c:forEach var="cnt" begin="${workPageSch.startBlock}" end="${workPageSch.endBlock}">
	  	<li class="page-item ${workPageSch.curPage==cnt?'active':''}">
	  			<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
	  </c:forEach>
	  <li class="page-item"><a class="page-link" href="javascript:goPage(${workPageSch.endBlock+1})">다음</a></li>
	</ul> 
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
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
<script type="text/javascript">
function goPage(cnt){
	// 요청값으로 현재 클릭한 페이지를 설정하고, 서버에 전달..
	$("[name=curPage]").val(cnt);
	$("form").submit();
}

function goDetail(jid,jmid,pid, mid){
	location.href="${path}/jobcheckDetail.do?jid="+jid+"&jmid="+jmid+"&pid="+pid+"&mid="+mid;
}	
function goiDetail(pid,iid){
	location.href="${path}/jobIssueDetail.do?pid="+pid+"&iid="+iid;
}	
	$(document).ready(function(){
		$(".nav-link").click(function(){
			var id = $(this).attr("id");
			if(id != undefined){
				location.href="${path}/" + id + ".do?pid=" + ${param.pid};
			}
		});
		$(".nav-link").removeClass("active");
		$("#jobcheck").addClass("active");
		// 선택된 페이지 크기 설정..
		$("[name=pageSize]").val("${workPageSch.pageSize}");
		// 페이지 크기 변경시 마다, controller 단 호출..
		$("[name=pageSize]").change(function(){
			$("[name=curPage]").val("1");
			$("form").submit();
		});
		
		$("[name=jmstatus]").val("${workPageSch.jmstatus}");
		// 페이지 크기 변경시 마다, controller 단 호출..
		$("[name=jmstatus]").change(function(){
			$("[name=curPage]").val("1");
			$("form").submit();
		});
	});
</script>
</body>
</html>

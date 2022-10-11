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
  <!-- Select2 -->
  <link rel="stylesheet" href="${path}/pms/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="${path}/pms/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  

<script type="text/javascript">
var list;


	$(document).ready(function(){
		
		updateMember();
		
		
		//Initialize Select2 Elements
	    $('.select2').select2()

	    //Initialize Select2 Elements
	    $('.select2bs4').select2({
	      theme: 'bootstrap4'
	    })
	   
	    var pmid;
		
	    $("select[name=selectPM]").change(function(){  	  
	  		pmid=$(this).val();
		});
	    
	  	  $("#inputPM").change(function(){
	  		  console.log("pm변경")
	  		  var pm = $("#inputPM option:selected").val();
	  		  $("#inputMem option").each(function(){
	  			  var mem = $(this);
	  			  if(mem.val() == pm) {
	  				  mem.prop("disabled", true);
	  			  }
	  			  else {
	  				  mem.prop("disabled", false);
	  			  }
	  		  });
	  		  
	  	  });
  

	  	  

	  	 // $("#inputPM").change(PrjMember(pmid));
	  	
	  	  
	  


	});
	function updateMember(){
	    $.ajax({
	      url: "${path}/ajaxMember.do",
	      data: "",
	      dataType: "json",
	      success: function (data) {
	        console.log(data)
	        list = data.memberList;
	 
	  
	        var addHTML = "";
	        var addADMINHTML = "";
 
	        $(list).each(function (idx, rst) {
	        
	        	//if(rst.auth == "ADMIN") {
	        	//	addADMINHTML+="<option value='"+rst.mid+"'>"+rst.name+"("+rst.empno+")</option>";
	        	//}
	        	//else{
	        		addHTML+="<option value='"+rst.mid+"'>"+rst.name+"("+rst.empno+")</option>";
	        	//}
	        	
	        });
	        

	        
	        var pmsel = $("#inputPM");
	        
	        pmsel.html(pmsel.html() + addHTML);
	      $("#inputMem").html(addHTML);
	       
	     
	      }
	    });
	  }
/* 	function PrjMember(pm){
        $.ajax({
          url: "${path}/ajaxMember.do",
          data: "",
          dataType: "json",
          success: function (data) {
          console.log(data)
          list = data.memberList;               
          var addHTML02 = ""; 
          
	        $(list).each(function (idx, rst) {
	        	console.log(pmid);
	        	if(rst.mid != pm)
	        	 	addHTML02+="<option value='"+rst.mid+"'>"+rst.name+"</option>";	

	        });
                
               $("#inputMem").html(addHTML02);
            
             }
           });
         } */
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
            <h1 class="m-0">Project</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="dashboard.do?pid=${param.pid}">Home</a></li>
              <li class="breadcrumb-item active">프로젝트 등록</li>
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
     	<form id="frm01" action="${path}/projectInsert.do" class="form"  method="post">
          <div class="card card-primary">
            
            <div class="card-body">
              <div class="form-group">
                <label for="inputName">프로젝트명</label>
                <input name="pname" id="inputName" type="text" value="${param.pname}" class="form-control">
              </div>
              <div class="form-group">                       
                <label for="inputProjectLeader">PM</label>
                <select name="selectPM" id="inputPM" class="form-control pm-select select2bs4">
    				<option selected disabled value="0">PM 선택</option>

                </select>                    
              </div>
              
          
             <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label>참여 멤버</label>
                  <div class="select2-purple">
                   <select name="selectmember" id="inputMem" class="select2" multiple="multiple" data-placeholder="Select a State" data-dropdown-css-class="select2-purple" style="width: 100%;">  			
						
                   </select>
                  </div>           
                </div>
              

                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            
              <div class="form-group">
                <label for="inputDescription">프로젝트 설명</label>
                <textarea name="pcomment" id="inputDescription" class="form-control" rows="4">${param.pcomment}</textarea>
              </div>
              <div class="form-group">
              	<label for="inputClientCompany">시작일</label>
                <input name="pstart" type="date" class="form-control" value="${param.pstart}">

                <label for="inputClientCompany">종료일</label>
                <input name="pend" type="date" class="form-control" value="${param.pend}">

              </div>

            </div>
            <!-- /.card-body -->
     	</div>
          <!-- /.card -->
       
  	  
  	
   
      <div class="row">
        <div class="col-12">    
          <button type="button" onclick="goMain()" class="btn btn-secondary">취소</button>
          <button type="button" id="regBtn" onclick="insertProc()" class="btn btn-success float-right">등록</button>
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
  <jsp:include page="../footer.jsp"/>

  <!-- Control Sidebar -->
  <jsp:include page="../ctrlsidebar.jsp"/>
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
<!-- Select2 -->
<script src="${path}/pms/plugins/select2/js/select2.full.min.js"></script>
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
</body>

<script type="text/javascript">


	

    
var isInsert = "${isInsert}"
	if(isInsert=="Y"){
		if(!confirm("등록성공했습니다\n계속등록하시겠습니까?")){
			// 취소 입력시 조회화면 이동..
			location.href="${path}/adminProjectList.do"
		}
		else{
			location.href="${path}/projectInsertForm.do"
			
		}
	}
	

function insertProc(){
	if(confirm("등록하시겠습니까?")){
		var pnameVal = $("[name=pname]").val();	
	
		if(	pnameVal == ""){
			alert("프로젝트명을 등록하세요");
			$("[name=pname]").focus();
			return; 
		}
		
		var pmVal = $("[name=selectPM]").val();	
		if(	pmVal == null){
			alert("PM을 선택하세요");
			return; 
		}
		
		$("form").submit();
	}
}


function goMain(){
	location.href="${path}/adminProjectList.do";
}

	
</script>
</html>
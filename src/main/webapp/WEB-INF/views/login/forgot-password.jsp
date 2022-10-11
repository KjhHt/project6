<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<style>


select {
  position: absolute;
  top: 0;
  right: 0;
  padding: 20px;
}
</style>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Effective PM | <spring:message code="findpw"/></title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path}/pms/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="${path}/pms/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path}/pms/dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a class="h1"><b>Effective</b>PM</a>
    </div>
    <div class="card-body">
      <p class="login-box-msg"><spring:message code="findpwmsg"/></p>
      <form action="${path}/sendTempPassword.do" id="sendTempPw" method="post">
        <div class="input-group mb-3">
          <input type="email" name="email" id="email" class="form-control" placeholder="<spring:message code="email"/>">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" name="empno" id="empno" class="form-control" placeholder="<spring:message code="empno"/>">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <button type="button" onclick="sendTempPw(); return false;" class="btn btn-primary btn-block"><spring:message code="sendpw"/></button>
          </div>
          <!-- /.col -->
        </div>
      </form>
      <p class="mt-3 mb-1">
        <a href="${path}/login.do"><spring:message code="login"/></a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->
<script type="text/javascript">

	function sendTempPw() {
		
		if ($("#email").val() == null || $("#email").val() == "") {
			alert("<spring:message code="emailcheck"/>");
			$("#email").focus();
			 
			return false;
		}
		
		if ($("#empno").val() == null || $("#empno").val() == "") {
			alert("<spring:message code="enterempno"/>");
			$("#empno").focus();
			
			return false;		
		}
		$("#sendTempPw").submit();
		return false;
	}

	var msg = "${msg}"
    if(msg!="") {
    	alert("<spring:message code="confsend"/>") 
    	location.href="recoverpassword.do"
    }
	
</script>
<!-- jQuery -->
<script src="${path}/pms/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/pms/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/pms/dist/js/adminlte.min.js"></script>
<script>

$(document).ready(function(){
		<%-- 
		
		--%>	
		$("#selLan").val("${param.lang}")
		$("#selLan").change(function(){
			if($(this).val()!=""){
				$("[name=lang]").val($(this).val())
				$("#selLang").submit();
			}
		});
	});
</script>
</body>
</html>

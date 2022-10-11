<%--
  Created by IntelliJ IDEA.
  User: skawn
  Date: 2022-07-28
  Time: 오후 12:13
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*"%>
<%@ page language="java" import="java.net.InetAddress" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
  InetAddress inet = InetAddress.getLocalHost();
  //String svrIP = inet.getHostAddress();
  request.setAttribute("serverIp", inet.getHostAddress());
%>
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
  <!-- summernote -->
  <link rel="stylesheet" href="${path}/pms/plugins/summernote/summernote-bs4.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	var wsocket;
	$(document).ready(function(){
		/*
		
		
		*/
		
		$("#enterBtn").click(function(){
			if(confirm("채팅방 접속합니다.")){
				conn();
				
			}
		});
		// 아이디 입력 후,  enter 키를 입력시도 접속
		$("#id").keyup(function(){
			if(event.keyCode==13){
				conn();
			}
		});
		
		
		$("#exitBtn").click(function(){
			if(confirm("접속을 종료하시겠습니까?")){
				wsocket.send("msg:"+$("#id").val()+":접속 종료 했습니다.")
				wsocket.close();
				// 서버 handler public void afterConnectionClosed()
				// 와 연동
			}
		});
		
	});
	
	
	function conn(){
	    var serverIp = "${serverIp}";
	    if(serverIp.includes("192.")){
	      wsocket = new WebSocket("ws:localhost:7080/${path}/chat-ws.do");
	    } else {
	      wsocket = new WebSocket("ws:${serverIp}:7080/${path}/chat-ws.do");
	    }
	    
		wsocket.onopen=function(evt){ // 접속하는 핸들러 메서드와 연결
			console.log(evt)
			// 능동적으로 서버에 소켓통신으로 메시지를 보내는 것..
			// 받는 값 hidden으로
			wsocket.send("msg:"+$("#id").val()+":연결 접속했습니다.")
			// "msg:himan:연결접속했습니다."
		}
		// 메시지를 받을 때, 처리되는 메서드
		// 서버에서 push방식으로 메시지를 전달 받는데..
		wsocket.onmessage=function(evt){
			
			var msg = evt.data
			console.log(msg)
			if(msg.substring(0,4)=="msg:"){
				
				// msg:그룹명:전송자:메시지(단일 / )
				//
				var revMsg = msg.substring(4)
				console.log("#메시지 받기#")
				console.log(msg)
				$("#chatMessageArea").append("<span>" + revMsg + "</span>"+"<br>")	
				// 자동 scolling 처리 로직
				// 1.  전체 charMessageArea의 입력된 최대 높이 구하기
				var mx = parseInt($("#chatMessageArea").height())
				// 2. 포함하고 있는 div의 scollTop을 통해 최대한 내용으로 scrolling 하기
				$("#chatArea").scrollTop(mx);				
			}
			
			
		}
		// 접속을 종료 처리할 때
		wsocket.onclose=function(){
			alert($("#id").val()+"접속 종료합니다.")
			$("#chatMessageArea").val("")
			$("#id").val("").focus();
			
		}		
		
	}
</script>

<style type="text/css">

.media-chat {
    padding-right: 64px;
    margin-bottom: 0;
}

.media {
    padding: 16px 12px;
    -webkit-transition: background-color .2s linear;
    transition: background-color .2s linear;
}

.media .avatar {
    flex-shrink: 0;
}

.avatar {
    position: relative;
    display: inline-block;
    width: 36px;
    height: 36px;
    line-height: 36px;
    text-align: center;
    border-radius: 100%;
    background-color: #f5f6f7;
    color: #8b95a5;
    text-transform: uppercase;
}

.media-chat .media-body {
    -webkit-box-flex: initial;
    flex: initial;
    display: table;
}

.media-body {
    min-width: 0;
}

.media-chat .media-body p {
    position: relative;
    padding: 6px 8px;
    margin: 4px 0;
    background-color: #f5f6f7;
    border-radius: 3px;
    font-weight: 100;
    color:#9b9b9b;
}

.media>* {
    margin: 0 8px;
}

.media-chat .media-body p.meta {
    background-color: transparent !important;
    padding: 0;
    opacity: .8;
}

.media-meta-day {
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    margin-bottom: 0;
    color: #8b95a5;
    opacity: .8;
    font-weight: 400;
}

.media {
    padding: 16px 12px;
    -webkit-transition: background-color .2s linear;
    transition: background-color .2s linear;
}

.media-meta-day::before {
    margin-right: 16px;
}

.media-meta-day::before, .media-meta-day::after {
    content: '';
    -webkit-box-flex: 1;
    flex: 1 1;
    border-top: 1px solid #ebebeb;
}

.media-meta-day::after {
    content: '';
    -webkit-box-flex: 1;
    flex: 1 1;
    border-top: 1px solid #ebebeb;
}

.media-meta-day::after {
    margin-left: 16px;
}

.media-chat.media-chat-reverse {
    padding-right: 12px;
    padding-left: 64px;
    -webkit-box-orient: horizontal;
    -webkit-box-direction: reverse;
    flex-direction: row-reverse;
}

.media-chat {
    padding-right: 64px;
    margin-bottom: 0;
}

.media {
    padding: 16px 12px;
    -webkit-transition: background-color .2s linear;
    transition: background-color .2s linear;
}

.media-chat.media-chat-reverse .media-body p {
    float: right;
    clear: right;
    background-color: #48b0f7;
    color: #fff;
}

.media-chat .media-body p {
    position: relative;
    padding: 6px 8px;
    margin: 4px 0;
    background-color: #f5f6f7;
    border-radius: 3px;
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
            <h1 class="m-0">채팅</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">채팅</li>
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
   
           <div class="input-group mb-2 ">
				<input type="hidden" id="id" value="${mem.name}" class="form-control" />			
				<button type="button" id="enterBtn" class="btn btn-success">채팅입장</button>
				<button type="button" id="exitBtn" class="btn btn-danger">나가기</button>					
		  </div>  		
         <div class="card card-primary">
           <div class="card-body">  
	  
	        <div class="ps-container ps-theme-default ps-active-y" id="chat-content" style="overflow-y: scroll !important; height:400px !important;">         		
					<div id="chatArea" class="media media-chat">
						<div id="chatMessageArea"></div>
					</div>			
			</div> 	
				
		
		<div class="chat_wrap">
			<div class="input-group mb-2">
				<div class="input-group-prepend">
					<span class="text-center input-group-text">메시지</span>
				</div>
				<input id="msg" class="form-control" placeholder="보낼 메시지 입력" />	
					 
				<button type="button" id="sndBtn"  class="btn btn-info">메시지전송</button>
			</div> 
		</div>
		
		<script type="text/javascript">
	        var currentTime = function(){
	            var date = new Date();
	            var hh = date.getHours();
	            var mm = date.getMinutes();
	            var apm = hh >12 ? "오후":"오전";
	            var ct = apm + " "+hh+":"+mm+"";
	            return ct;
	        }
	        

	       
	        
			
			var id = $("#id").val()
			var date = currentTime()
			

	        
			$("#msg").keyup(function(){
				if(event.keyCode==13){
					wsocket.send("msg:"+$("#id").val()+":"+$("#msg").val()+"&nbsp;&nbsp;&nbsp;"+date)
					$(this).val("").focus()
				}
				
			});
			// 전송 버튼을 클릭시에 메시지 전송
			$("#sndBtn").click(function(){
				var msg = $("#msg").val()
		
				
				wsocket.send("msg:"+id+":"+"<sㄱpan>"+msg+"</span>"+"&nbsp;&nbsp;&nbsp;<span>"+date+"</span>")

				$("#msg").val("").focus()				
				
			});
			


		</script>
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
</body>
</html>
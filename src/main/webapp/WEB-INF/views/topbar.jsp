<%--
  Created by IntelliJ IDEA.
  User: skawn
  Date: 2022-07-27
  Time: 오후 5:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ page language="java" import="java.net.InetAddress" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
  InetAddress inet = InetAddress.getLocalHost();
  //String svrIP = inet.getHostAddress();
  request.setAttribute("serverIp", inet.getHostAddress());
%>
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
  <!-- Left navbar links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
    </li>

  </ul>
  <!-- Right navbar links -->
  <ul class="navbar-nav ml-auto">
    <!-- Navbar Search -->
    <li class="nav-item">
      <a class="nav-link" data-widget="navbar-search" href="#" role="button">
        <i class="fas fa-search"></i>
      </a>
      <div class="navbar-search-block">
        <form class="form-inline">
          <div class="input-group input-group-sm">
            <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
            <div class="input-group-append">
              <button class="btn btn-navbar" type="submit">
                <i class="fas fa-search"></i>
              </button>
              <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                <i class="fas fa-times"></i>
              </button>
            </div>
          </div>
        </form>
      </div>
    </li>

    <!-- My prj list -->
    <div class="col-5">
      <div class="form-group">
        <select id="prjList" class="form-control pm-select select2bs4">
          <option selected disabled>프로젝트 선택</option>
        </select>
      </div>
    </div>
    <!-- Online Check -->
    <li class="nav-item dropdown">
      <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="fas fa-people-arrows"></i>
      </a>
      <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
        <span class="dropdown-item dropdown-header">Online Member</span>
        <div class="dropdown-divider"></div>
        <div id="onlineMember">
          <a href="#" class="dropdown-item">
            <i class="far fa-angry mr-2"></i> 프로젝트를 선택하세요!
          </a>
        </div>
        <div class="dropdown-divider"></div>
      </div>
    </li>
    <!-- Notifications Dropdown Menu -->
    <li class="nav-item dropdown">
      <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="far fa-bell"></i>
        <span class="badge badge-warning navbar-badge">15</span>
      </a>
      <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
        <span class="dropdown-item dropdown-header">15 Notifications</span>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item">
          <i class="fas fa-envelope mr-2"></i> 4 new messages
          <span class="float-right text-muted text-sm">3 mins</span>
        </a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item">
          <i class="fas fa-users mr-2"></i> 8 friend requests
          <span class="float-right text-muted text-sm">12 hours</span>
        </a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item">
          <i class="fas fa-file mr-2"></i> 3 new reports
          <span class="float-right text-muted text-sm">2 days</span>
        </a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
      </div>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-widget="fullscreen" href="#" role="button">
        <i class="fas fa-expand-arrows-alt"></i>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
        <i class="fas fa-th-large"></i>
      </a>
    </li>
  </ul>
</nav>
<!-- jQuery -->
<script src="${path}/pms/plugins/jquery/jquery.min.js"></script>

<script>

  var wsocket2;

$(document).ready(function(){
	<%--

	--%>
	$("#selLan").val("${param.lang}")
	$("#selLan").change(function(){
		if($("[name=selLan]").val()!=""){
			$("[name=lang]").val($("[name=selLan]").val())
			$("frm01").submit();
		}
	});
    <c:if test="${not empty mem}">
      conn2();
    </c:if>

  $.ajax({
    url : "${path}/myProjectAjax.do",
    data : "mid=0",
    dataType : "json",
    success : function(data) {
      console.log(data);
      var prjList = data.projects;
      var addHTML = "";
      $(prjList).each(function(idx, rst) {
        <c:choose>
        <c:when test="${empty param.pid || param.pid == 0}">
        if (idx == 0) {
          addHTML += "<option selected disabled hidden>프로젝트 선택하세요</option>";
          addHTML += "<option value='" + rst.pid + "'>" + rst.pname + "</option>";
        }
        </c:when>
        <c:otherwise>
        if(rst.pid == ${param.pid}) {
          addHTML += "<option value='" + rst.pid + "' selected>" + rst.pname + "</option>";
        }
        </c:otherwise>
        </c:choose>
        else {
          addHTML += "<option value='" + rst.pid + "'>" + rst.pname + "</option>";
        }
      });
      $("#prjList").html(addHTML);
      $("#prjList").change(function(){
        location.href = "dashboard.do?pid="+$("#prjList").val();
      });
    }
  });
});

function onlineMembers() {
    $.ajax({
        url : "${path}/teamMemberAjax.do",
        data : "pid=${param.pid}",
        dataType : "json",
        success : function(data) {
            //console.log(data);
            $("#onlineMember").empty();
            for(var i=0;i<data.members.length;i++){
                //console.log(data.members[i]);
                $("#onlineMember").append("<a href='#' class='dropdown-item'><i class='fas fa-user mr-2'></i>"+data.members[i].name+"("+data.members[i].empno+")"+"<span class='float-right text-muted text-sm'><i class='fas fa-circle text-success'></i></span></a>");
            }
        }
    });
}

  function conn2(){
    var serverIp = "${serverIp}";
    if(serverIp.includes("192.")){
      wsocket2 = new WebSocket("ws:localhost:7080/${path}/online-ws.do");
    } else {
      wsocket2 = new WebSocket("ws:${serverIp}:7080/${path}/online-ws.do");
    }
    wsocket2.onopen=function(evt){ // 접속하는 핸들러 메서드와 연결
      wsocket2.send("add:${mem.mid}");
    }

    wsocket2.onmessage=function(evt){
      var msg = evt.data;
      console.log("#메시지 받기#");
      console.log(msg);
      var msgArr = msg.split(",");
      var dupeCheck = new Set(msgArr);
      msgArr = [...dupeCheck];
      $.ajax({
        url : "${path}/teamMemberAjax.do",
        data : "pid=${param.pid}",
        dataType : "json",
        success : function(data) {
          //console.log(data);
          if(data.members != null) {
            $("#onlineMember").empty();
            for (var i = 0; i < data.members.length; i++) {
              for (var j = 0; j < msgArr.length; j++) {
                if (data.members[i].mid == msgArr[j]) {
                  $("#onlineMember").append("<a href='#' class='dropdown-item'>" +
                          "<i class='fas fa-user mr-2'></i>" + data.members[i].name +
                          "(" + data.members[i].empno + ")" +
                          "<span class='float-right text-muted text-sm'>" +
                          "<i class='fas fa-circle text-success'></i></span></a>");
                }
              }
            }
          }
        }
      });
    }

    wsocket2.onclose=function(){
      //alert($("#id").val()+"접속 종료합니다.")
    }
  }
</script>
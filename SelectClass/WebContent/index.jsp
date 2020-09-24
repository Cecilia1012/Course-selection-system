<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Class.Student"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/amazeui.min.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<title>Insert title here</title>
</head>

<body>

<div class="header" id="head">
  <div class="title">课程管理平台</div>
</div>
<img alt="" src="image/university.jpg">
<div class="content">
   <div class="toSelect">
      <button type="button" class="am-btn am-btn-primary am-round" style="width: 90%; height: 80%; top: 10%; font-size: 6.5vw;">查询课程</button>
   </div>
   <div class="toSelect">
      <button type="button" class="am-btn am-btn-success am-round" style="width: 90%; height: 80%; top: 10%; font-size: 6.5vw;" onclick="myclass()">个人课程</button>
   </div>
   <div class="toSelect">
      <button type="button" class="am-btn am-btn-warning am-round" style="width: 90%; height: 80%; top: 10%; font-size: 6.5vw;" onclick="personIn()">个人信息</button>
   </div>
</div>
<%

	Student student = (Student)session.getAttribute("student");
	String StuName = ""; 
	
 	if(student != null){
 		StuName = student.getStuName();
%>
<div class="showName">
	<span class="am-badge am-round" style="width: 100%; height: 50%; font-size: 5vw;" onclick="logout()">welcome，<%=StuName %></span>
</div>
<script type="text/javascript">
	function personIn(){
		location.href = "personIn.jsp";
	}
	function myclass(){
		location.href="myclass.jsp";
	}
</script>
<%}else{ %>
<div class="loginButton">
   <a class="am-btn am-btn-secondary am-round" href="login.jsp" style="width: 80%; height: 60%; top: 10%; font-size: 4.8vw;">
      <i class="am-icon-user"></i>
      登陆
   </a>
</div>
<%} %>
</body>
<script type="text/javascript">
	function logout(){
		var flag = window.confirm("是否退出登录？");
		if(flag == true){
			location.href = "Logout";
		}
	}

</script>
</html>
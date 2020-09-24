<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Class.Student"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程管理平台</title>
<style type="text/css">
*{
   margin: 0;
   padding: 0;
}
#wrap {
   height: 719px;
   width: 100%;
   background-image: url(4.jpg);
   background-repeat: no-repeat;
   background-position: center center;
   position: relative;
}
#head {
   height: 150px;
   width: 100%;
   background-color: #66CCCC;
   text-align: center;
   position: relative;
}

#wrap .logGet {
   height: 50%;
   width: 80%;  
   position: absolute;
   background-color: #FFFFFF;
   top: 20%;
   right: 10%;
}
.logC a button {
   width: 100%;
   height: 20%;
   background-color: #ee7700;
   border: none;
   color: white;
   font-size: 18px;
}
.logGet .logD.logDtip .p1 {
   display: inline-block;
   font-size: 28px;
   margin-top: 30px;
   width: 86%;
}
#wrap .logGet .logD.logDtip {
   width: 86%;
   border-bottom: 3px solid #ee7700;
   margin-bottom: 40px;
   margin-top: 0px;
   margin-right: auto;
   margin-left: auto;
}
.logGet .lgD img {
   position: absolute;
   top: 12px;
   left: 8px;
}
.logGet .lgD input {
   width: 100%;
   height: 140px;
   border: 5px solid #black;
   font-size: 4.5vw;
   text-indent: 2.5rem;
}
#wrap .logGet .lgD {
   width: 88%;
   position: relative;
   margin-bottom: 20px;
   margin-top: 12%;
   margin-right: auto;
   margin-left: auto;
}
#wrap .logGet .logC {
   width: 88%;
   margin-top: 12%;
   margin-right: auto;
   margin-bottom: 0px;
   margin-left: auto;
}
 
.title {
   font-family: "宋体";
   color: #FFFFFF;
   position: absolute;
   top: 45%;
   left: 50%;
   transform: translate(-50%, -50%);  /* 使用css3的transform来实现 */
   font-size: 6vw;
   height: 40px;
   width: 40%;
}

.back{
   top: 33%;
   left: 4%;
   width: 6%;
   height: 38%;
   position: absolute;
}
 
</style>

</head>
<body>
<%
	String StuID = (String)request.getAttribute("StuID");
	String flag = "0";
	if(StuID==null)
	{
		StuID = "";
	}
	else
	{ 
		flag = "1";
	} 
%>
<div class="header" id="head">
	<div class="back">
      <img id="return" style="width: 100%; height: 100%;" src="image/return-dark.png" onclick="window.location.href='index.jsp'"/>
   	</div>
  	<div class="title">教务管理系统</div>
</div>
	
<div class="wrap" id="wrap">
<div class="logGet">
         <!-- 头部提示信息 -->
         <div class="logD logDtip">
            <p class="p1" style="font-size: 7vw">登录</p>
         </div>
         <input type="hidden" disabled="disabled" value="<%=flag %>" id="isPasswordTrue">
         <!-- 输入框 -->
         <form name="form" action="Login" method="post">
         <div class="lgD">
            <img src="img/logName.png" width="20" height="20" alt=""/>
            <input name="account" id="account" type="text" placeholder="输入用户账号" value="<%=StuID%>"/>
         </div>
         <div class="lgD">
            <img src="img/logPwd.png" width="20" height="20" alt=""/>
            <input name="password" id="password" type="password" placeholder="输入用户密码" />
         </div>
         <div class="logC">
               <input style="width: 100%;font-size: 4.5vw; height:100px; background-color: #ee7700; border:0" type="Submit" name="Submit" value="登陆" />
         </div>
      </form>
      </div>
</div>
</body>
<script type="text/javascript">
	var flag = document.getElementById('isPasswordTrue').value;
	if(flag == "1")
		alert("账号密码错误！");
</script>
</html>
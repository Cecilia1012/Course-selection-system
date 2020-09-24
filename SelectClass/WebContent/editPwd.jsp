<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Class.Student"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
.logGet .editP.logDtip .p1 {
   display: inline-block;
   font-size: 28px;
   margin-top: 30px;
   width: 86%;
}
#wrap .logGet .editP.logDtip {
   width: 86%;
   border-bottom: 3px solid #ee7700;
   margin-bottom: 40px;
   margin-top: 0px;
   margin-right: auto;
   margin-left: auto;
}
.logGet .editP img {
   position: absolute;
   top: 12px;
   left: 8px;
}
.logGet .editP input {
   width: 100%;
   height: 120px;
   border: 5px solid #black;
   font-size: 4.5vw;
   text-indent: 2.5rem;
}
#wrap .logGet .editP {
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
.tips{
	font-size:30px;
	padding-bottom:10px;
	color:red;
}
</style>

</head>


<body>
<%
	Student student = (Student)session.getAttribute("student");
	String StuID = "";	
	String StuPassword = "";
	if(student != null){
		StuID = student.getStuID();
		StuPassword = student.getPassword();
	}
	
%>
<div class="header" id="head">
	<div class="back">
      <img id="return" style="width: 100%; height: 100%;" src="image/return-dark.png" onclick="window.location.href='personIn.jsp'"/>
   	</div>
  	<div class="title">修改密码</div>
</div>
	
<div class="wrap" id="wrap">
<div class="logGet">
         <!-- 头部提示信息 -->
         <div class="editP logDtip">
            <p class="p1" style="font-size: 5vw; letter-spacing:8px;">密码设置</p>
         </div>
         <input type="hidden" disabled="disabled" value="<%=StuPassword %>" id="StuPassword">
         <!-- 输入框 -->
         <form name="form" action="EditPwd" method="post">
         	<div class="editP">
         		<p class="tips"><span id="tips1">*</span></p>
            	<img src="img/logPwd.png" width="20" height="20" alt=""/>
            	<input name="password" id="password" type="password" placeholder="输入用户密码"/>
         	</div>
         	<div class="editP">
         		<p class="tips"><span id="tips2">*</span></p>
            	<img src="img/logPwd.png" width="20" height="20" alt=""/>
            	<input name="newpwd" id="newpwd" type="password" placeholder="输入新密码" />
         	</div>
         	<div class="editP">
         		<p class="tips"><span id="tips3">*</span></p>
            	<img src="img/logPwd.png" width="20" height="20" alt=""/>
            	<input name="newpwded" id="newpwded" type="password" placeholder="确认密码" />
         	</div>
         	<input type="hidden" id="isTrue" name="flag">
         	<input type="hidden" value="<%=StuID %>" id="StuID" name="StuID">
         	<div class="logC">
         		<input style="width: 45%;font-size: 4.5vw; height:100px; background-color: #6CB56C; border:2px" type="Submit" name="Submit" value="确定" />
               	<input style="width: 45%;font-size: 4.5vw; height:100px; background-color: #ee7700; border:2px;float:right" type="button" name="cancel" value="取消" onclick="window.location.href='personIn.jsp'"/>
         	</div>
         	
         </form>
      </div>
</div>
</body>
<script type="text/javascript">
	var StuPassword = document.getElementById('StuPassword').value;
	var pwdText = document.getElementById('password');
	var newPwdText = document.getElementById('newpwd');
	var newPwdedText = document.getElementById('newpwded');
	pwdText.onblur = function(){
		if(pwdText.value == StuPassword){
			document.getElementById('tips1').innerHTML = "*";
			document.getElementById('isTrue').value = "0";
		}
		else{
			document.getElementById('tips1').innerHTML = "密码错误";
			document.getElementById('isTrue').value = "1";
		}	
	}
	newPwdText.onblur = function(){
		if(newPwdText.value != ""){
			document.getElementById('tips2').innerHTML = "*";
			document.getElementById('isTrue').value += "0";
		}
		else{
			document.getElementById('tips2').innerHTML = "密码不可为空";
			document.getElementById('isTrue').value += "1";
		}	
	}
	newPwdedText.onblur = function(){
		if(newPwdedText.value == newPwdText.value){
			document.getElementById('tips3').innerHTML = "*"
			document.getElementById('isTrue').value += "0";
		}
		else{
			document.getElementById('tips3').innerHTML = "密码不一致";
			document.getElementById('isTrue').value += "1";
		}	
	}
</script>
</html> 
<%
	if(request.getAttribute("result") != null){
		out.println("<script >alert('" + request.getAttribute("result")+ "');</script>");
	}
%>
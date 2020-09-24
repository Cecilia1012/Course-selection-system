﻿<%@ page import="MySQL.Connect" %>
<%@ page import="java.sql.*" %> 
<%@page import="Class.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>课程管理平台</title>
<link rel="stylesheet" type="text/css" href="css/myclass.css">
</head>
<body>
	<div class="header" id="head">
		<div class="back">
			<img id="return" src="image/return-dark.png" onclick="back()" />
		</div>
		<div class="title">我的课程</div>
	</div>
	<%
	//获取学生学号
	Student student = (Student)session.getAttribute("student");
	String StuID="";
	if(student != null)
	{
		StuID=student.getStuID();
		Connection conn = Connect.getConnection();
		String sql="select CourseClassID from TB_SelectCourse where StuID='"+StuID+"'";
		try
		{
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				String CourseClassID=rs.getString("CourseClassID");
				String sql2="select TC.CourseID,CourseName,CourseGrade,TeacherName,Place,Time from TB_Course TC,TB_Teacher TT,TB_CourseClass TCC ";
				sql2=sql2+"where TCC.CourseClassID='"+CourseClassID+"' and TCC.CourseID=TC.CourseID and TCC.TeacherID=TT.TeacherID";
				PreparedStatement pst2=conn.prepareStatement(sql2);
				ResultSet rs2=pst2.executeQuery();
				while(rs2.next())
				{
					String CourseID = rs2.getString("CourseID");
					String CourseName=rs2.getString("CourseName");
					Integer CourseGrade=rs2.getInt("CourseGrade");
					String TeacherName=rs2.getString("TeacherName");
					String Place=rs2.getString("Place");
					String Time=rs2.getString("Time");
		%>
					<div class="part">
						<p id="stu-title"><%= CourseName %><span id="stu-info" style="font-size: 30px;">（学分：<%= CourseGrade %>）</span></p>
						<p id="stu-view">课程代码：<span id="stu-info"><%= CourseID %></span></p>
						<p id="stu-view">任课教师：<span id="stu-info"><%= TeacherName %></span></p>
						<p id="stu-view">上课时间：<span id="stu-info"><%= Time %></span></p>
						<p id="stu-view">上课地点：<span id="stu-info"><%= Place %></span></p>
					</div>
		<%
				}
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			e.printStackTrace();
		}
	}
	%>
	<script type="text/javascript">
		function back() {
			window.location.href="index.jsp";
		}
	</script>
</body>
</html>
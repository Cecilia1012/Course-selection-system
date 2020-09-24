package MySQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Class.Student;

public class Operate {
	public Student Login(String StuID) throws SQLException
	{
		Connection conn = Connect.getConnection();
		String sql = "select * from tb_student where StuID = '" + StuID + "'";
		Student student = new Student();
		try { 
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				student.setStuID(rst.getString("StuID"));
				student.setStuName(rst.getString("StuName"));
				student.setDeptID(rst.getString("DeptID"));
				student.setClassID(rst.getString("ClassID"));
				student.setSex(rst.getString("Sex"));
				student.setPassword(rst.getString("Password"));
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			System.out.println("数据库出现异常");
			e.printStackTrace();
		}
		return student;
	}
}

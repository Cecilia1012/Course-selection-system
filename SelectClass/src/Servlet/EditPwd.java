package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MySQL.Connect;
import Class.Student;
/**
 * Servlet implementation class EditPwd
 */
@WebServlet("/EditPwd")
public class EditPwd extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doPost(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String flag = request.getParameter("flag");
		String failure = "";
		//System.out.print(flag);
		if(flag.equals("000")) {
			//System.out.print("没错");
			String StuID = request.getParameter("StuID");
			String newpwded = request.getParameter("newpwded");
			try { 
				Connection conn = Connect.getConnection();
				String sql = "update tb_student set Password = '" + newpwded + "' where StuID = '"+StuID+"'";
				PreparedStatement pst = conn.prepareStatement(sql);
				int rst = pst.executeUpdate();
				if (rst > 0) {
					RequestDispatcher requestDispatcher2 = request.getRequestDispatcher("success.jsp");
					requestDispatcher2.forward(request, response);
				}
				pst.close();
			} catch (SQLException e) {
				System.out.println("数据库出现异常");
				e.printStackTrace();
			}
			
		}
		else {
			failure = "修改失败";
			request.setAttribute("result",failure);
			RequestDispatcher requestDispatcher1 = request.getRequestDispatcher("editPwd.jsp");
			requestDispatcher1.forward(request, response);
		}
		
		
	}

}

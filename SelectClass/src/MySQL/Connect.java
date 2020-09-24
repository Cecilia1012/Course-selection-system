package MySQL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Connect {
	private static final String url = "jdbc:mysql://localhost:3306/db_teaching?serverTimezone=UTC";
	private static final String username = "root";   /*�˺�*/
	private static final String password = "123456";   /*����*/
	private static Connection conn = null;
	
	public static Connection getConnection() throws SQLException
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
        }
        catch(ClassNotFoundException e)
        {
        	System.out.println("���ݿ�����ʧ��");
            e.printStackTrace();
        }
        return conn;
    }
    public static void close(ResultSet rs,PreparedStatement ps,Connection conn) throws SQLException
    {
        try
        {
            rs.close();
            ps.close();
            conn.close();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
    }
}

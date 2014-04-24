package beans;

import java.io.PrintStream;
import java.sql.*;

public class connDB
{

    private static Connection conn = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    private static final String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=db_bookmanage";
    private static final String user = "sa";
    private static final String pwd = "111";
    public connDB()
    {
    	try {
			Class.forName(driverClass);
			 conn = DriverManager.getConnection(URL,user,pwd);
    	} catch (Exception e) {
			
			e.printStackTrace();
		}
    }
    public ResultSet executeQuery(String sql)
    {
        try {  
            stmt = conn.createStatement(1004, 1007);
            rs = stmt.executeQuery(sql);
        }
        catch(SQLException ex)
        {
            System.err.println(ex.getMessage());
        }
        return rs;
    }

    public int executeUpdate(String sql)
    {
        int result = 0;
        try
        {
            stmt = conn.createStatement(1004, 1007);
            result = stmt.executeUpdate(sql);
        }
        catch(SQLException ex)
        {
            result = 0;
        }
        return result;
    }

    public int executeUpdate_id(String sql)
    {
        int result = 0;
        try
        {
            stmt = conn.createStatement(1004, 1007);
            result = stmt.executeUpdate(sql);
            String ID = "select @@IDENTITY as id";
            rs = stmt.executeQuery(ID);
            if(rs.next())
            {
                int autoID = rs.getInt("id");
                result = autoID;
            }
        }
        catch(SQLException ex)
        {
            result = 0;
        }
        return result;
    }

    public void close()
    {
        try
        {
            if(rs != null)
                rs.close();
            if(stmt != null)
                stmt.close();
            if(conn != null)
                conn.close();
        }
        catch(Exception e)
        {
            e.printStackTrace(System.err);
        }
    }
}

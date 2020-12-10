
package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class jdbc {
  public static Connection jdbc_con() throws ClassNotFoundException, SQLException{
       String url="jdbc:mysql://localhost:3307/chat";
       String pass="1234";
       String user="root";
        
    Class.forName("com.mysql.jdbc.Driver");
   Connection con=(Connection)  DriverManager.getConnection(url, user, pass);
   
    return con;
}
}
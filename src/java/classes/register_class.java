package classes;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;



public class register_class  {

    String Email;
    String First_Name;
    String Last_Name;
    String Sex;
    String birthdate;
    String pass;
    int id;
    String photo;
     String School;
     String high_school;
     String  college;

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
     String intrested_in;
     String city;
    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getFirst_Name() {
        return First_Name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getSchool() {
        return School;
    }

    public void setSchool(String School) {
        this.School = School;
    }

    public String getHigh_school() {
        return high_school;
    }

    public void setHigh_school(String high_school) {
        this.high_school = high_school;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getIntrested_in() {
        return intrested_in;
    }

    public void setIntrested_in(String intrested_in) {
        this.intrested_in = intrested_in;
    }

    public void setFirst_Name(String First_Name) {
        this.First_Name = First_Name;
    }

    public String getLast_Name() {
        return Last_Name;
    }

    public void setLast_Name(String Last_Name) {
        this.Last_Name = Last_Name;
    }

    public String getSex() {
        return Sex;
    }

    public void setSex(String Sex) {
        this.Sex = Sex;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }
//---------------------------
   public static boolean register_in_jsp(register_class rc) throws ClassNotFoundException, SQLException{
    
      Connection con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps= con.prepareStatement("insert into userlogin(Email,First_Name,Last_Name,Sex,birthdate,pass) values(?,?,?,?,?,?)");
      ps.setString(1, rc.Email);
      ps.setString(2, rc.First_Name);
      ps.setString(3, rc.Last_Name);
      ps.setString(4, rc.Sex);
      ps.setString(5, rc.birthdate+" 00:00:00");
      ps.setString(6, rc.pass);
      
     return  ps.execute();   
   }
   public static String Login(String name,String pas) throws ClassNotFoundException, SQLException{
       Connection con=null; 
     try{
      con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement(" select id from userlogin where Email='"+name+"' and pass='"+pas+"';");
      ResultSet rs=ps.executeQuery();
       rs.next();
       
       return rs.getString(1);
     }
      catch(Exception x){
          
          return x.getMessage();
      }
    
      
   }
   public  static void update_pass(String Email,String Pass) throws ClassNotFoundException, SQLException
   {
    Connection con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement(" update userlogin set pass='"+Pass+"' where Email='"+Email+"'");
      
       ps.execute();
       con.close();
   }
   
   public static register_class profile(int id) throws ClassNotFoundException, SQLException{
       
        register_class rc=new register_class();
        Connection con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("select * from userlogin where id="+id+"");
      ResultSet rs=ps.executeQuery();
      rs.next();
      rc.setEmail(rs.getString(1));
      rc.setFirst_Name(rs.getString(2));
      rc.setLast_Name(rs.getString(3));
      rc.setSex(rs.getString(4));
      rc.setBirthdate(rs.getString(5));
      rc.setId(rs.getInt(6));
      rc.setPhoto(rs.getString(7));
      rc.setSchool(rs.getString(8));
      rc.setHigh_school(rs.getString(9));
      rc.setCollege(rs.getString(10));
      rc.setIntrested_in(rs.getString(11));
      rc.setCity(rs.getString(13));
       
     return rc;  
     
       
   }
   
   public static ResultSet Friend_List(int id) throws ClassNotFoundException, SQLException
   {
      register_class rc=new register_class();
        Connection con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("select id_person from Friends where id_user="+id+"");
      ResultSet rs=ps.executeQuery();
          
      return rs;
              
   }
   
   public static ResultSet Friend_Request(int id,String s) throws ClassNotFoundException, SQLException
   {
      register_class rc=new register_class();
        Connection con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("select id_user from friend_request where id_person="+id+" and ch='"+s+"'");
      ResultSet rs=ps.executeQuery();
        
      return rs;
              
   }
   
  
   public static void update(int id,String c_name,String value) throws ClassNotFoundException, SQLException{
       Connection con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("update userlogin set "+c_name+"='"+value+"' where id="+id+" ");
      
       ps.execute();
       con.close();
   }
    
   public static ResultSet getIds() throws ClassNotFoundException, SQLException{
      register_class rc=new register_class();
        Connection con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("select id from userlogin");
      ResultSet rs=ps.executeQuery();
        
      return rs; 
   }
    public static void add_Friend(int id_user,int id_person,String dy) throws ClassNotFoundException, SQLException{
        register_class rc=new register_class();
        Connection con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("insert into friend_request values("+id_user+","+id_person+",'"+dy+"')");
      ps.execute();
      con.close();
          
   }
   
   public static void accept_request(int id_user,int id_person) throws ClassNotFoundException, SQLException{
        register_class rc=new register_class();
        Connection con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("insert into Friends values("+id_user+","+id_person+")");
      ps.execute();
     con.close();
          
   }
   public static void delete_request(int id_person,int id_user) throws ClassNotFoundException, SQLException{
        register_class rc=new register_class();
        Connection con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("delete from friend_request where id_user="+id_user+" and id_person="+id_person+"");
     
      
       ps.execute();
     con.close();
          
   }
   
   public static String ch(int id_user,int id_person) throws SQLException
   {
        Connection con=null; 
        try{
          
        
    register_class rc=new register_class();
        con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("select ch from friend_request where id_user="+id_user+" and id_person="+id_person+"");
         ResultSet rs= ps.executeQuery();
         rs.next();
          
        
     return rs.getString(1);
      }
      catch(Exception x)
      {
           
          return x.getMessage();
      }
   }
   public static String check_for_friends(int id_user,int id_person) throws SQLException
   {
        Connection con=null; 
        try{
          
        
    register_class rc=new register_class();
        con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("select id_user from Friends where id_user="+id_user+" and id_person="+id_person+"");
         ResultSet rs= ps.executeQuery();
         rs.next();
          
      
     return rs.getString(1);
      }
      catch(Exception x)
      {
          
          return x.getMessage();
      }
   }
   
   
   public static ResultSet Post(int id) throws ClassNotFoundException, SQLException{
       Connection con=null; 
      con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("select * from post where id_User="+id+" ");
      ResultSet r=ps.executeQuery(); 
      return r;
      
   }
   
   public static ResultSet Post_sr_no(int id) throws ClassNotFoundException, SQLException{
       Connection con=null; 
      con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("select * from post where SR_NO="+id+" ");
      ResultSet r=ps.executeQuery(); 
      return r;
      
   }
   
   public static void set_post(int id_user, String phot,Date date,String story) throws ClassNotFoundException, SQLException{
       Connection con=null; 
       con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("insert into post (id_user,photo,date,story) values(?,?,?,?)");
      ps.setInt(1, id_user);
      ps.setString(2, phot);
      ps.setDate(3, (java.sql.Date) date);
      ps.setString(4, story);
      ps.execute();
   }
   
   public static ArrayList message_list(int id_user) throws ClassNotFoundException, SQLException{
       Connection con=null; 
       con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("select * from message where id_sender="+id_user+" or id_reciever="+id_user+"");
      
      ArrayList ar=new ArrayList();
     ResultSet rs= ps.executeQuery();
     while(rs.next()){
        ar.add( rs.getInt(1));
         ar.add(rs.getInt(2));
     }
     ArrayList ar1=new ArrayList();
     for(Object i:ar){
         if(!ar1.contains((int)i)){
             
             if((int)i!=id_user)
             ar1.add(i);
             
         }
     }
     return ar1;
   }
   
   public static ResultSet message_list_inbox(int id_user, int id_reciever) throws ClassNotFoundException, SQLException{
       Connection con=null; 
       con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("select * from message where (id_sender="+id_user+" and id_reciever="+id_reciever+") or (id_reciever="+id_user+" and id_sender="+id_reciever+");");
      
      ArrayList ar=new ArrayList();
     ResultSet rs= ps.executeQuery();
   return rs;
   }
   
  public static void message_submit(int id_user, int id_reciever,String Message) throws ClassNotFoundException, SQLException{
       Connection con=null; 
       con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("insert into message values(?,?,?,?)");
      ps.setInt(1, id_user);
      ps.setInt(2, id_reciever);
      ps.setString(3, Message);
      Date d=new Date( new java.util.Date().getTime());
      ps.setDate(4, d);
      
     
    ps.execute();
   }
  
  
   public static ResultSet College_Post() throws ClassNotFoundException, SQLException{
       Connection con=null; 
      con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("select * from College_Post  ");
      ResultSet r=ps.executeQuery(); 
      return r;
      
   }
  
  
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
      
     
     try{
      
       Connection con=null; 
       con= jdbc.jdbc.jdbc_con();
      PreparedStatement ps=con.prepareStatement("select * from message where id_sender=1013 or id_reciever=1013");
      
      ArrayList ar=new ArrayList();
     ResultSet rs= ps.executeQuery();
     while(rs.next()){
        ar.add( rs.getInt(1));
         ar.add(rs.getInt(2));
     }
     ArrayList ar1=new ArrayList();
     for(Object i:ar){
         if(!ar1.contains((int)i)){
             ar1.add(i);
             
         }
     }
     }
      catch(Exception x){
              System.out.println(x.getMessage());
          
        
      }
    
    }
    //-----------------------
    
    


    }

<%-- 
    Document   : accept_request_form
    Created on : Sep 10, 2019, 1:11:25 PM
    Author     : vc
--%>

<%@page import="classes.register_class"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%@include file='..\User_Login\Profile.html' %>
            <div class="container-fluid">
                <!--///////////////////////////////////////////-->
                
                
               <%
                     
                     int id=Integer.parseInt(request.getSession(false).getAttribute("MainId").toString());
                        
                         ResultSet itr=classes.register_class.Friend_Request(id,"f");
                           while(itr.next())
                           {
                          String i=itr.getString(1);
                       
                        register_class rs= classes.register_class.profile(Integer.parseInt(i));
                        System.out.print(rs.getId());
                         String show_button;
                        
                   
                       out.print(""
                         
                           +" <div class='comment-widgets scrollable'>"
                           
                            + "   <div class='d-flex flex-row comment-row m-t-0'>"
                            +"        <div class='p-2'><img src='"+rs.getPhoto()+"' alt='user' width='50' class='rounded-circle'></div>"
                            +"        <div class='comment-text w-100'>"
                            +"      <a href='../Friends/Profile_1.jsp?param="+i+"'       <h6 class='font-medium'>"+rs.getFirst_Name()+" "+rs.getLast_Name()+"</h6></a>"
                              
                                +"<input type='hidden' name='id' value='"+rs.getId()+"'>"
                             +"           <span class='m-b-15 d-block'>"+rs.getCity()+" </span>"
                                  +"    <a href='request_accept.jsp?id="+rs.getId()+"' class='btn btn-cyan btn-sm'>Accept Request</a>"
                                +"    </div>"
                                +"</div>");
                           
                        
                           }
                           

               %>
                                
                                
                <!--/////////////////////////////////////////////-->
                
            </div>
            <%@include file='..\User_Login\footer.html' %>
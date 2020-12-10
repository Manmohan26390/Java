<%-- 
    Document   : Friends.jsp
    Created on : Sep 8, 2019, 4:03:04 PM
    Author     : vc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="classes.register_class"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file='..\User_Login\Profile.html' %>
            <div class="container-fluid">
                 <!--///////////////////////////////////////////-->
                 
                 
                  <div class="card-body">
                                <h4 class="card-title m-b-0"><center>Friends</center></h4>
                            </div>
           
                 
                
             <%
                     int id=Integer.parseInt(request.getSession(false).getAttribute("MainId").toString());
                     
                     ResultSet it=classes.register_class.Friend_List(id);
                         
                           while(it.next())
                           {
                          int i=it.getInt(1);
                          
                        register_class rs= classes.register_class.profile(i);
                        out.print(
                         
                           " <div class='comment-widgets scrollable'>"
                           +"     <!-- Comment Row --> "
                            + "   <div class='d-flex flex-row comment-row m-t-0'>"
                            +"        <div class='p-2'><img src='"+rs.getPhoto()+"' alt='user' width='50' class='rounded-circle'></div>"
                            +"        <div class='comment-text w-100'>"
                            +"      <a href='Profile_1.jsp?param="+i+"'         <h6 class='font-medium'>"+rs.getFirst_Name()+" "+rs.getLast_Name()+"</h6> </a>"
                            +"        <form action='../Message/Inbox.jsp' method='post'>"+
                                " <input type='hidden' name='id' value='"+rs.getId()+"'>"
                     +"<input type='submit' name='submit' style='float:right;' value='Message'>"+
                          "</form>"
                             +"           <span class='m-b-15 d-block'>"+rs.getCity()+" </span>"
                                      
                                +"    </div>"
                                +"</div>"
                           
                              );
                        
                           }

               %>


                  <!--///////////////////////////////////////////-->
            </div>
             <%@include file='..\User_Login\footer.html' %>
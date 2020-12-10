<%-- 
    Document   : Friend_request_form
    Created on : Sep 9, 2019, 11:05:29 PM
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
                                <h4 class="card-title m-b-0"><center> Find Friends</center></h4>
                            </div>
                  
             <%
                     
                      int id=Integer.parseInt(request.getSession(false).getAttribute("MainId").toString());
                        String show_button;
                        String side=request.getSession(false).getAttribute("MainId").toString();
                         ResultSet itr=classes.register_class.getIds();
                           while(itr.next())
                           {
                          String i=itr.getString(1);
                          if(!side.equals(i)){
                       register_class rs= classes.register_class.profile(Integer.parseInt(i));
                         
                       
                       String chr=classes.register_class.check_for_friends(id, rs.getId());
                        if(chr.equals("Illegal operation on empty result set.")){
                            
                            
                        String ch=classes.register_class.ch(id, rs.getId());
                        
                        if(ch.equals("f")){
                        show_button="Request sent";
                        
                        }
                        
                        else
                        {
                            show_button="Send Request";
                           
                        }
                       out.print(""
                         
                           +" <div class='comment-widgets scrollable'>"
                           
                            + "   <div class='d-flex flex-row comment-row m-t-0'>"
                            +"        <div class='p-2'><img src='"+rs.getPhoto()+"' alt='user' width='50' class='rounded-circle'></div>"
                            +"        <div class='comment-text w-100'>"
                            +"      <a href='../Friends/Profile_1.jsp?param="+i+"'       <h6 class='font-medium'>"+rs.getFirst_Name()+" "+rs.getLast_Name()+"</h6></a>"
                              
                                +"<input type='hidden' name='id' value='"+rs.getId()+"'>"
                             +"           <span class='m-b-15 d-block'>"+rs.getCity()+" </span>");
                       if(!ch.equals("s"))
                       out.print("    <a href='request_send.jsp?id="+rs.getId()+"' class='btn btn-cyan btn-sm'>"+show_button+"</a>");
                       if(ch.equals("s"))
                       out.print("    <a href='request_accept.jsp?id="+rs.getId()+"' class='btn btn-cyan btn-sm'>Accept Request</a>");
                                out.print("    </div>"
                                +"</div>");
                           
                        
                        }
                        
                          }
                       }  

               %>
               

                  <!--///////////////////////////////////////////-->
            </div>
           

               <%@include file='..\User_Login\footer.html' %>
               
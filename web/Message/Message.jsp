
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.register_class"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file='..\User_Login\Profile.html' %>
<div class="container-fluid">
<%
    
     int id=Integer.parseInt(request.getSession(false).getAttribute("MainId").toString());
   ArrayList ar=classes.register_class.message_list(id);
   Iterator it= ar.iterator();
   
  
    
    %>

<div class="row">
                    <div class="col-md-6">
                         <div class='comment-widgets scrollable'>
                          <%
                                String i="";
                                     while(it.hasNext()){
                                         register_class rs=classes.register_class.profile(Integer.parseInt(it.next().toString()));
                                         ResultSet rr=classes.register_class.message_list_inbox(id, rs.getId());
                                         while(rr.next())
                                         {
                                             i=rr.getString(3);
                                         }
                                     out.print(
                            
                          "<a href='Inbox.jsp?id="+rs.getId()+"'>"+
                                
                               " <div class='d-flex flex-row comment-row m-t-0'>"+
                                  
                                    "<div class='p-2'><img src='"+rs.getPhoto()+"' alt='user' width='50' class='rounded-circle'></div>"+
                                    "<div class='comment-text w-100'>"+
                                        "<h6 class='font-medium'>"+rs.getFirst_Name()+"</h6>"+
                                      
                                       " <span class='m-b-15 d-block'>"+i+" </span>"+
                                    "</div>"
                                  + "</div>"
                                  + "</a>");
                                        }
                                    %>
                             
                            
                                
                            </div>
                    </div>
</div>


</div>


<%@include file='..\User_Login\footer.html' %>
<%-- 
    Document   : Inbox
    Created on : Sep 10, 2019, 3:50:08 PM
    Author     : vc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="classes.register_class"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file='..\User_Login\Profile.html' %>
           <div class="container-fluid">
          <!--//////////////////////////////////////////////-->
          
         
          <%
               int id=Integer.parseInt(request.getSession(false).getAttribute("MainId").toString());
               String sender= request.getParameter("id");
               request.getSession(false).setAttribute("S_id",sender);
               request.getSession(false).getAttribute("S_id");
              ResultSet r=classes.register_class.message_list_inbox(id,Integer.parseInt( request.getSession(false).getAttribute("S_id").toString()));
                register_class rs=classes.register_class.profile(Integer.parseInt(request.getSession(false).getAttribute("S_id").toString()));
              %>
           <a  href="Inbox.jsp?id=<%=sender%>"style="float:right ">Refresh</a>
           <br>
          <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                
                                <div class="chat-box scrollable" style="height:475px;">
                                    <!--chat Row -->
                                    <ul class="chat-list">
                                        <!--chat Row -->
                                        
                                        <%
                                        while(r.next()){
                                          if(id==r.getInt(1)){
                                              out.print(
                                                      "<li class='chat-item'>"+
                                            
                                            "<div class='chat-content'>"+
                                             
                                              "  <div class='box bg-light-info'>"+r.getString(3)+"</div>"+
                                            "</div>"+
                                            "<div class='chat-time'></div>"+
                                        "</li>"
                                                      );
                                              
                                          }
                                          else{
                                              
                                              
                                              out.print(
                                        "<li class='odd chat-item'>"+
                                            "<div class='chat-content'>"+
                                             "   <div class='box bg-light-inverse'>"+r.getString(3)+"</div>"+
                                               
                                            "</div>"+
                                        "</li>");
                                          }
                                            
                                          
                                            
                                            
                                        }
                                       
                                       %>
                                    </ul>
                                </div>
                            </div>
                                    <form action="messageSubmit.jsp" method="post">
                            <div class="card-body border-top">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="input-field m-t-0 m-b-0">
                                            <input type='hidden' value='<%=sender%>' name='id'>
                                            <textarea name="message" id="textarea1" placeholder="Type and enter" class="form-control border-0"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        
                                        <button type="submit"  class="btn-circle btn-lg btn-cyan float-right text-white"></button>
                                    </div>
                                </div>
                            </div>
                                    </form>
                        </div>
                    </div>
          <!--////////////////////////////////////////////-->
          </div>
          <%@include file='..\User_Login\footer.html' %>

<%-- 
    Document   : x.jsp
    Created on : Sep 8, 2019, 3:51:47 PM
    Author     : vc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="classes.register_class"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file='..\User_Login\Profile.html' %>
            <div class="container-fluid">
               
                 <!--///////////////////////////////////////////-->
                 
                 
                 <%
                     String st=request.getParameter("param");
                    
                     register_class rs=classes.register_class.profile(Integer.parseInt(st));
                    
                    
                     
                     
                     
                     %>
                 
               <center> <img src="<%= rs.getPhoto()%>" alt="user" style="border-radius:100%; width:40%;"></center>
               <br><br>
               <center><font color="Blue" size="5"><%= rs.getFirst_Name()%></font></center>
               
               <br>
               <br>
               <div class="card">
                            <div class="card-body">
                                <h4 class="card-title m-b-0"><center>About</center></h4>
                            </div>
                            <ul class="list-style-none">
                                <li class="card-body">
                                    <i  class="m-b-0 p-0">
                                        <div class="d-flex no-block">
                                            <h class="fa fa-check-circle w-30px m-t-5"></i>
                                            <div>
                                                <span class="font-bold">School</span> <%=rs.getSchool()%> 
                                               
                                            </div>
                                        </div>
                                    </i>
                                </li> 
                                  <li class="card-body">
                                    <i  class="m-b-0 p-0">
                                        <div class="d-flex no-block">
                                            <h class="fa fa-check-circle w-30px m-t-5"></i>
                                            <div>
                                                <span class="font-bold">High School</span> <%= rs.getHigh_school()%> 
                                               
                                            </div>
                                        </div>
                                    </i>
                                </li>
                                
                               <li class="card-body">
                                    <i  class="m-b-0 p-0">
                                        <div class="d-flex no-block">
                                            <h class="fa fa-check-circle w-30px m-t-5"></i>
                                            <div>
                                                <span class="font-bold">College</span> <%= rs.getCollege()%> 
                                               
                                            </div>
                                        </div>
                                    </i>
                                </li>
                                
                                 
                                 <li class="card-body">
                                    <i  class="m-b-0 p-0">
                                        <div class="d-flex no-block">
                                            <h class="fa fa-check-circle w-30px m-t-5"></i>
                                            <div>
                                                <span class="font-bold">Birth Date</span> <%=  rs.getBirthdate().substring(0, 11) %> 
                                               
                                            </div>
                                        </div>
                                    </i>
                                </li>
                                
                                <li class="card-body">
                                    <i  class="m-b-0 p-0">
                                        <div class="d-flex no-block">
                                            <h class="fa fa-check-circle w-30px m-t-5"></i>
                                            <div>
                                                <span class="font-bold">City</span> <%= rs.getCity()%> 
                                               
                                            </div>
                                        </div>
                                    </i>
                                </li>
                                
                            </ul>
                        </div>

                <div class="card-body">
                                <h4 class="card-title m-b-0"><center>Friends</center></h4>
                            </div>
                                    
             <%
                     
                     ResultSet it=classes.register_class.Friend_List(Integer.parseInt(st));
                         
                           while(it.next())
                           {
                          int i=it.getInt(1);
                          
                        register_class rv= classes.register_class.profile(i);
                        out.print("   <a href='Profile_1.jsp?param="+i+"'"
                         
                           +" <div class='comment-widgets scrollable'>"
                           +"     <!-- Comment Row --> "
                            + "   <div class='d-flex flex-row comment-row m-t-0'>"
                            +"        <div class='p-2'><img src='"+rv.getPhoto()+"' alt='user' width='50' class='rounded-circle'></div>"
                            +"        <div class='comment-text w-100'>"
                            +"            <h6 class='font-medium'>"+rv.getFirst_Name()+" "+rv.getLast_Name()+"</h6>"
                               
                             +"           <span class='m-b-15 d-block'>"+rv.getCity()+" </span>"
                                      
                                +"    </div>"
                                +"</div>"
                           
                              +"  </a>");
                        
                           }

               %>


                


                  <!--///////////////////////////////////////////-->
            </div>
            <%@include file='..\User_Login\footer.html' %>
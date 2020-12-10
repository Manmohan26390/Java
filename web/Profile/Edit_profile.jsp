<%-- 
    Document   : x.jsp
    Created on : Sep 8, 2019, 3:51:47 PM
    Author     : vc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="classes.register_class"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='..\User_Login\Profile.html' %>
            <div class="container-fluid">
               
                 <!--///////////////////////////////////////////-->
                 
                 
                 <%
                    int id=Integer.parseInt(request.getSession(false).getAttribute("MainId").toString());
                    
                     register_class rs=classes.register_class.profile(id);
                    
                   
                     %>
                 
                     <center> <img src='<%= rs.getPhoto()%>' alt="user" style="border-radius:100%; width:40%;"></center>
               <form method="post" action="edit.jsp">
                   <input type="hidden" name="type" value="photo">
                   <center><input type="submit" name="head" value="Change"></center>
               </form>
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
                                                <span class="font-bold">School</span>  
                                                <%=rs.getSchool()%>
                                               
                                                <form method="post" action="edit.jsp">
                                                     <input type="hidden" name="type" value="school">
                                                <center><input type="submit" name="head" value="Change"></center>
                                                </form>
                                                    
                                                
                                               
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
                                                
                                                
                                                <form method="post" action="edit.jsp">
                                                     <input type="hidden" name="type" value="high school">
                                                <center><input type="submit" name="head" value="Change"></center>
                                                </form>
                                               
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
                                                
                                                  
                                                <form method="post" action="edit.jsp">
                                                  <input type="hidden" name="type" value="College">   
                                                <center><input type="submit" name="head" value="Change "></center>
                                                </form>
                                               
                                               
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
                                                
                                                  
                                                <form method="post" action="edit.jsp">
                                                     <input type="hidden" name="type" value="birthdate">
                                                <center><input type="submit" name="head" value="Change"></center>
                                                </form>
                                               
                                               
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
                                                
                                                  
                                                <form method="post" action="edit.jsp">
                                                     <input type="hidden" name="type" value="city">
                                                <center><input type="submit" name="head" value="Change"></center>
                                                </form>
                                               
                                               
                                            </div>
                                        </div>
                                    </i>
                                </li>
                                
                            </ul>
                        </div>
                                               
           

               
                                    
           


                


                  <!--///////////////////////////////////////////-->
            </div>
            <%@include file='..\User_Login\footer.html' %>
<%-- 
    Document   : x.jsp
    Created on : Sep 8, 2019, 3:51:47 PM
    Author     : vc
--%>


<%@page import="java.util.*"%>
<%@page import="Post_photo.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.register_class"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file='..\User_Login\Profile.html' %>
            <div class="container-fluid">
               
                 <!--///////////////////////////////////////////-->
                 
                 
                 <%
                     
                   if(request.getSession().getAttribute("email")!= null){
                    int id=Integer.parseInt(request.getSession(false).getAttribute("MainId").toString());
                     register_class rs=classes.register_class.profile(id);
                    
                    
                    
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
                     
                    ResultSet it=classes.register_class.Friend_List(id);
                         
                           while(it.next())
                           {
                          int i=it.getInt(1);
                          
                        register_class rv= classes.register_class.profile(i);
                       out.print("   <a href='Profile_1.jsp?param="+i+"'"
                         
                           +" <div class='comment-widgets scrollable'>"
                           +"     <!-- Comment Row --> "
                            + "   <div class='d-flex flex-row comment-row m-t-0'>"
                           +"        <div class='p-2'>");
                               
                         
                       
                       
                       
                       
                       
                       
                       
                       out.print(
                                "<img src='"+rv.getPhoto()+"' alt='user' style=' width:50%;'>"+
                            "            <h6 class='font-medium'>"+rv.getFirst_Name()+" "+rv.getLast_Name()+"</h6>"
                              
                             +"           <span class='m-b-15 d-block'>"+rv.getCity()+" </span>"
                                      
                                +"    </div>"
                                +"</div>"
                           
                              +"  </a>");
                      
                           }
                    }
                   else
                   {
                       response.sendRedirect("../Login_form.jsp");
                   }

               

               
                  
                                            %>
                                           <div class="card-body">
                                <h4 class="card-title m-b-0"><center>Posts</center></h4>
                            </div>  
                                            <%
                   
                    
                                           
                                           
                                                ResultSet p=classes.register_class.Post(Integer.parseInt(request.getSession(false).getAttribute("MainId").toString()));
                                                ArrayList ar=new ArrayList();
                                                try{
                                                while(p.next()){
                                                    Post po=new Post();
                                                    po.setSrno(p.getInt(1));
                                                    po.setId_user(p.getInt(2));
                                                    po.setPhot(p.getString(3));
                                                    po.setDate(p.getDate(4));
                                                    po.setStory(p.getString(5));
                                                    ar.add(po);
                                                }
                                               
                                                        
                                                        
                                            
                                            Collections.sort(ar);
                                            Iterator it=ar.iterator();
                                            while(it.hasNext()){
                                                Post po=(Post)it.next();
                                                register_class rrr=classes.register_class.profile(po.getId_user());
                                               out.print("<div class='d-flex flex-row comment-row m-t-0'>"+
                                    "<div class='p-2'><img src='"+rrr.getPhoto()+"' alt='user' width='50' class='rounded-circle'></div>"+
                                    "<div class='comment-text w-100'>"+
                                      "  <h6 class='font-medium'>"+rrr.getFirst_Name()+"</h6>"+
                                        
                                    "</div>"+
                                "</div>"+
                                                     
                                             
                                         "  <!--hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh--><center>"+
                                          " <span class='m-b-15 d-block'>"+po.getStory()+" </span>");
                                                       
                                                       
                                      
                                   
                            
                                    
                                                  
                                               
                            
                                               
                                    
                          
                                               
                                 if(po.getPhot().endsWith("mp3")){
                       out.print(
                               
                               
                                ""
                               + "<audio controls ><source src='"+po.getPhot()+"' type='audio/mp3'/></audio> "
                            +"        <div class='comment-text w-100'>"
                       );}
                          
                          else if(po.getPhot().endsWith("jpeg")){
                          
                          out.print(
                               
                               
                                ""
                               + "<img src='"+po.getPhot()+"' alt='user' style=' width:50%;'>"
                            +"        <div class='comment-text w-100'>"
                       );
                         
                          }
                          else if(po.getPhot().endsWith("mp4"))
                          {
                            
                               out.print(
                               
                               
                                ""
                               + "<video controls ><source src='"+po.getPhot()+"' type='video/mp4'/></video> "
                            +"        <div class='comment-text w-100'>"
                       );
                              
                          }
                                           out.print(
                                          
                                          
                                           "  <br><br>"+
                                                    
                                             
                                           " &nbsp &nbsp  &nbsp &nbsp &nbsp"+
                                           
                                                       
                                               " </center> <br><br><br><hr>");
                                            
                                             
                                            
                    }
                                                }
                                                catch(Exception x){}
                   %>


                  <!--///////////////////////////////////////////-->
            </div>
            <%@include file='..\User_Login\footer.html' %>
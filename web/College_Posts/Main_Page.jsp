<%-- 
    Document   : Main_Page
    Created on : Sep 23, 2019, 8:10:45 AM
    Author     : vc
--%>

<%@page import="Post_photo.Post"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.register_class"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='..\User_Login\Profile.html' %>
<!DOCTYPE html>
 <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
    
     <%
         int id=Integer.parseInt(request.getSession(false).getAttribute("MainId").toString());
                    
                     register_class rs=classes.register_class.profile(id);
                    
         %>
        
                                          
                                           
                                           
                                           
                                           
                                           
                                           
                                           
                                           

                                 

                                           
                                            
                                            <%
                                            ArrayList ar=new ArrayList();
                                           
               
                                           
                                                ResultSet p=classes.register_class.College_Post();
                                                
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
                                                }
                                                catch(Exception x){}
                                                        
                                                        
                                            
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
                                          " <span class='m-b-15 d-block'>"+po.getStory()+" </span>"+
                                           
                                           "<img src='"+po.getPhot()+"' alt='user' style=' width:50%;'>"+
              
                                           "  <br><br>"+
                                                    
                                             
                                           " &nbsp &nbsp  &nbsp &nbsp &nbsp"+
                                           
                                                       
                                               " </center> <br><br><br><hr>");
                                            }
                                            %>
                                            
                                            

                                            <br>


                                  
              
              
              
              
             
              
               
                       
                        
               
                          
                     



                         
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->


            </div>

<%@include file='..\User_Login\footer.html' %>

<%-- 
    Document   : new
    Created on : Sep 9, 2019, 9:52:18 AM
    Author     : vc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file='..\User_Login\Profile.html' %>
            <div class="container-fluid">
                <%
                   String type= request.getParameter("type");
                if(type.equals("school"))    
               out.print(" <center>"
                  +" <form action='edit_sub.jsp' method='post'>"
                  +"<h3 class='text-uppercase error-subtitle'>school</h3>"
                    +"<input type='hidden' name='type' value='school'>"
                  +"<input type='text' name='text'>"
                  +"<br><br>"
                  +"<input type='submit'name='submit' >" 
                  +"</form>"
                +"</center> " );
                
                else if(type.equals("high school"))    
               out.print(" <center>"
                  +" <form action='edit_sub.jsp' method='post'>"
                  +"<h3 class='text-uppercase error-subtitle'>High School</h3>"
                       +"<input type='hidden' name='type' value='high_school'>"
                  +"<input type='text' name='text'>"
                  +"<br><br>"
                  +"<input type='submit'name='submit' >" 
                  +"</form>"
                +"</center> " );

                 else if(type.equals("College"))    
               out.print(" <center>"
                  +" <form action='edit_sub.jsp' method='post'>"
                  +"<h3 class='text-uppercase error-subtitle'>College</h3>"
                       +"<input type='hidden' name='type' value='college'>"
                  +"<input type='text' name='text'>"
                  +"<br><br>"
                  +"<input type='submit'name='submit' >" 
                  +"</form>"
                +"</center> " );
                
                else if(type.equals("birthdate"))    
               out.print(" <center>"
                  +" <form action='edit_sub.jsp' method='post'>"
                  +"<h3 class='text-uppercase error-subtitle'>Date of Birth</h3>"
                       +"<input type='hidden' name='type' value='birthdate'>"
                  +"<input type='date' name='text'>"
                  +"<br><br>"
                  +"<input type='submit'name='submit' >" 
                  +"</form>"
                +"</center> " );
                 else if(type.equals("city"))    
               out.print(" <center>"
                  +" <form action='edit_sub.jsp' method='post'>"
                  +"<h3 class='text-uppercase error-subtitle'>City</h3>"
                       +"<input type='hidden' name='type' value='City'>"
                  +"<input type='text' name='text'>"
                  +"<br><br>"
                  +"<input type='submit'name='submit' >" 
                  +"</form>"
                +"</center> " );
                
                
                else if(type.equals("photo"))    
               out.print(" <center>"
                  +" <form action='../hari' method='post'enctype='multipart/form-data\' >"
                  +"<h3 class='text-uppercase error-subtitle'>Photo</h3>"
                       +"<input type='hidden' name='type' value='photo'>"
                  +"<input type='file' name='text'>"
                  +"<br><br>"
                  +"<input type='submit'name='submit' >" 
                  +"</form>"
                +"</center> " );
                
                
                
             %>   
            </div>
            <%@include file='..\User_Login\footer.html' %>
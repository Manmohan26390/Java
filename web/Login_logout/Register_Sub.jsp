
<%@page import="classes.register_class"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <%
          try{
        register_class r=new register_class();
        String f_name=request.getParameter("f_name");
        String l_name= request.getParameter("l_name");
        String gender=request.getParameter("gender");
        String date=request.getParameter("date");
        String email=request.getParameter("email");
        String pe=request.getParameter("p1");
        String p2=request.getParameter("p2");
        
        
        if(pe.equals(p2.toString()))
        {
            r.setFirst_Name(f_name);
            r.setLast_Name(l_name);
            r.setSex(gender);
            r.setEmail(email);
            r.setBirthdate(date);
            r.setPass(p2);
            HttpSession s=request.getSession();
         s.setAttribute("register_data", r);
         
         s.setAttribute("otp", mymail.Mymail.send_otp(email));
         response.sendRedirect("otp.jsp");
        }
        else
        {
            request.setAttribute("pas", "password not match");
           RequestDispatcher rs=request.getRequestDispatcher("Register_form.jsp");
           rs.include(request, response);
        }
          }
          catch(Exception x){
              response.sendRedirect("error-500.html");
              
          }
        %>
    </body>
</html>

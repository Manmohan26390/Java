<%-- 
    Document   : otp_sub
    Created on : Sep 5, 2019, 5:30:35 PM
    Author     : vc
--%>

<%@page import="classes.register_class"%>
<%@page import="classes.message_class"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OTP</title>
    </head>
    <body>
        <%
            register_class m=null;
            try{
            String otp=request.getParameter("otp");
            HttpSession s=request.getSession();
            String st=s.getAttribute("otp").toString();
            m=(register_class) s.getAttribute("register_data");
            if(otp.equals(st)){
             register_class.register_in_jsp(m);
             request.setAttribute("success", "Registration successful");
             
           response.sendRedirect("../Login_form.jsp");
             
         
            }
            else{
                request.setAttribute("error", "Wrong OTP");
                RequestDispatcher rd=request.getRequestDispatcher("otp.jsp");
                rd.forward(request, response);
            }
            }
            catch(Exception x){
                if(x.getMessage().equals("Duplicate entry '"+m.getEmail()+"' for key 'PRIMARY'")){
                    response.sendRedirect("already.html");
                }
                  else
                {
                    out.print(x.getMessage());
                }
            }
            %>
    </body>
</html>

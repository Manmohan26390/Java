<%-- 
    Document   : recover_sub
    Created on : Sep 6, 2019, 3:39:05 PM
    Author     : vc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%   try{
             String s=request.getParameter("email");
              HttpSession ss=request.getSession();
               ss.setAttribute("R_otp", mymail.Mymail.send_otp(s));
               ss.setAttribute("R_email",s);
               response.sendRedirect("otp_1.jsp");
        }
        catch(Exception x)
        {
            
            out.print(x.getMessage());
            // response.sendRedirect("error-500.html");
        }
            %>
    </body>
</html>

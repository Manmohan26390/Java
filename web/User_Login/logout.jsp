<%-- 
    Document   : logout
    Created on : Sep 7, 2019, 12:49:10 PM
    Author     : vc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout</title>
    </head>
    <body>
        <%
                HttpSession ss= request.getSession();

              ss.invalidate();
           
           response.sendRedirect("../Login_form.jsp");
           
          
            %>
    </body>
</html>

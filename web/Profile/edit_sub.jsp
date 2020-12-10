<%-- 
    Document   : edit_sub
    Created on : Sep 9, 2019, 1:58:26 PM
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
        <%
          int id=Integer.parseInt(request.getSession(false).getAttribute("MainId").toString());
         String type=request.getParameter("type");
         String text=request.getParameter("text");
         classes.register_class.update(id, type, text);
         response.sendRedirect("Edit_profile.jsp");
        %> 
    </body>
</html>

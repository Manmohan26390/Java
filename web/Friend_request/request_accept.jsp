<%-- 
    Document   : request_accept
    Created on : Sep 10, 2019, 1:34:24 PM
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
             int id_user= Integer.parseInt(request.getSession(false).getAttribute("MainId").toString());
           int id_person= Integer.parseInt(request.getParameter("id"));
           
           classes.register_class.accept_request(id_user, id_person);
           classes.register_class.accept_request(id_person, id_user);
           classes.register_class.delete_request(id_user, id_person);
           classes.register_class.delete_request(id_person, id_user);
          response.sendRedirect("accept_request_form.jsp");
            
            %>
    </body>
</html>

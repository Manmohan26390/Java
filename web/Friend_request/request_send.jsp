<%-- 
    Document   : request_send
    Created on : Sep 10, 2019, 11:07:46 AM
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
           
           try{
           classes.register_class.add_Friend(id_user, id_person,"f");
           classes.register_class.add_Friend(id_person, id_user,"s");
          response.sendRedirect("Friend_request_form.jsp");
           }
           catch(Exception x){
            response.sendRedirect("Friend_request_form.jsp");   
           }
            %>
    </body>
</html>

<%-- 
    Document   : messageSubmit
    Created on : Sep 25, 2019, 3:17:40 PM
    Author     : vc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    int id=Integer.parseInt(request.getSession(false).getAttribute("MainId").toString());
   String Message= request.getParameter("message");
   String id1= request.getParameter("id");
   if(!Message.isEmpty())
   {
       classes.register_class.message_submit(Integer.parseInt(id1),id , Message);
        response.sendRedirect("Inbox.jsp?id="+id1+"");
   }
   else
       response.sendRedirect("Inbox.jsp?id="+id1+"");
    %>

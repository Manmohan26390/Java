<%-- 
    Document   : Login_sub
    Created on : Sep 6, 2019, 3:01:54 PM
    Author     : vc
--%>

<%@page import="classes.register_class"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
          String s=  request.getParameter("email");
          String p=  request.getParameter("pas");
          
          String st=register_class.Login(s, p);
          if(st.equals("Illegal operation on empty result set.")){
             request.setAttribute("er", "Wrong Email OR password");
             response.sendRedirect("../Login_form.jsp");
          }
         
          else
             {
              HttpSession ss=request.getSession();
             out.print(st);
             ss.setAttribute("email", s);
             ss.setAttribute("pass", p);
              ss.setAttribute("MainId",st );
            response.sendRedirect("../Profile/Main_Page.jsp");
              }
          
        %>
    </body>
</html>

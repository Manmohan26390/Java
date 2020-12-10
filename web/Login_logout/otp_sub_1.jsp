

<%@page import="classes.register_class"%>
<%@page import="classes.message_class"%>


    
    <body>
        
       
          
           
           
            <%
                try{
            String otp=request.getParameter("otp");
            String p1=request.getParameter("p1");
            String p2=request.getParameter("p2");
            HttpSession s=request.getSession();
           
           s.getAttribute("R_email").toString();
           
           String st=s.getAttribute("R_otp").toString();
           
            if(otp.equals(st)&&p1.equals(p2)){
                classes.register_class.update_pass(s.getAttribute("R_email").toString(), p1);
            request.setAttribute("success", "Password Reset Succesfull");
            response.sendRedirect("../Login_form.jsp");
          
            }
            else{
                request.setAttribute("error", "Wrong OTP or Password Not Match");
                RequestDispatcher rd=request.getRequestDispatcher("otp_1.jsp");
                rd.forward(request, response);
            }
            }
            catch(Exception x){
                
                
                out.print(x.getMessage());
                   // response.sendRedirect("error-500.html");
                
            }
            %>
   
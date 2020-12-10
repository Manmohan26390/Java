/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Post_photo;

import classes.register_class;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author vc
 */

public class photo_uploading extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             int id=Integer.parseInt(request.getSession(false).getAttribute("MainId").toString());
             
             register_class r= classes.register_class.profile(id);
           
          String st= request.getParameter("post_t");
          
           Part p=request.getPart("post_p");
           String ty=p.getContentType();
          String t[]= ty.split("/");
          String fin=t[1];
          if(fin.equalsIgnoreCase("mpeg"))
              fin="mp3";
          out.print(fin);
           if(st.isEmpty()||!p.getSubmittedFileName().isEmpty()){
           
           upload_img img=new upload_img();
           
          Random rand=new Random();
         int i=rand.nextInt(10000);
         if(!p.getSubmittedFileName().isEmpty())
           img.upload_img_fun( p.getInputStream(),request.getServletContext().getRealPath("/POST"),"/"+r.getFirst_Name()+i+"."+fin);
            
           
           Date d=new Date(new java.util.Date().getTime());
           classes.register_class.set_post(id,  "../POST/"+r.getFirst_Name()+i+"."+fin, d, st);
          
          response.sendRedirect("Profile/Main_Page.jsp");
          
           
        }
           else
           {
         response.sendRedirect("Profile/Main_Page.jsp");
           }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(photo_uploading.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(photo_uploading.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(photo_uploading.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(photo_uploading.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

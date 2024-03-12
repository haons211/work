/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import configs.headerInfor;
import dal.ApplicationDAO;
import dal.ConversationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.AccountDTO;
import models.Conversation;
import models.EmployeeDTO;
import models.Message;
import models.MessageDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name="OpenChatController", urlPatterns={"/OpenChat"})
public class OpenChatController extends HttpServlet {
   

     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        headerInfor.setSessionAttributes(request);
        ApplicationDAO a = new ApplicationDAO();
        AccountDTO account = (AccountDTO) request.getSession().getAttribute("account");
        
        if (account == null) {
            throw new ServletException("Account not found in session");
        }
         if(account.getRole()== 1) {
             
          request.getRequestDispatcher("OpenChat.jsp").forward(request, response);
            
        }
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      
    }

    

}

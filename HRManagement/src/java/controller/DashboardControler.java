/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import configs.headerInfor;
import dal.DashboardDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import models.AccountDTO;
import models.Department;
import models.DepartmentAttendanceDTO;
import models.DepartmentEmployeeCountDTO;
import models.Employee;

/**
 *
 * @author andep
 */
public class DashboardControler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DashboardDAO dao = new DashboardDAO();
        int numberDepartments = dao.getNumberOfDepartments();
        int numberEmployees = dao.getNumberOfEmployees();
        int numberAttend = dao.getNumberOfAttend();
        int numberLeave = numberEmployees - numberAttend;
        List<Department> listDepartment = dao.getTop3Department();
        List<Employee> listTop5Employee = dao.getTop5Employee();
        List<Employee> listLeave = dao.getListLeave();
        ArrayList<DepartmentEmployeeCountDTO> listDepartmentEmployee = dao.getEmployeeCountByDepartment();
        ArrayList<DepartmentAttendanceDTO> departmentAttendanceList = dao.getAttendancePercentageByDepartment();

        
        
        headerInfor.setSessionAttributes(request);
        request.setAttribute("numberDepartments", numberDepartments);
        request.setAttribute("numberEmployees", numberEmployees);
        request.setAttribute("numberAttend", numberAttend);
        request.setAttribute("numberLeave", numberLeave);
        request.setAttribute("listDepartment", listDepartment);
        request.setAttribute("listTop5Employee", listTop5Employee);
        request.setAttribute("listLeave", listLeave);
        request.setAttribute("listDepartmentEmployee", listDepartmentEmployee);
        request.setAttribute("departmentAttendanceList", departmentAttendanceList);
        
        
        request.getRequestDispatcher("HomeAdmin.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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

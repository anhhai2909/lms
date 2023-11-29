/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author dangn
 */
public class AddUser extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUserServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        UserDAO d = new UserDAO();
        request.getRequestDispatcher("/view/admin/UserAdd.jsp").forward(request, response);

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
        String fullname = request.getParameter("fullname");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone_number");
        String avatar = request.getParameter("avatar");
        int status = Integer.parseInt(request.getParameter("status"));
        String roleId = "4"; //auto set after adding 
        UserDAO dao = new UserDAO();
        String nameError = "", emailError = "", phoneError = "", passwordError = "";
        //nameError
        if (fullname.length() > 20) {
            nameError = "** The user name can only contain a maximum of 20 characters. **";
        } else if (dao.getUserByName(fullname) != null) {
            nameError = "** The users name already exists. **";
        }
        //emailError
        if (dao.getUserByEmail(email) != null) {
            emailError = "** The user email already exists. **";
        }
        //phoneError
        if (phone.length() > 10) {
            phoneError = "** The phone number can only contain a maximum of 10 characters. **";
        } else if (dao.getUserByPhone(phone) != null) {
            nameError = "** The phone number already exists. **";
        }
        //passwordError
        if (password.length() < 6) {
            passwordError = "** The password must contain more than 6 characters **";
        }
        if (nameError.length() == 0 && emailError.length() == 0 && phoneError.length() == 0 && passwordError.length() == 0) {
            dao.addUser(password, fullname, email, phone, avatar, status, roleId);
            request.setAttribute("txt", "Notification: Successfully!");
            request.getRequestDispatcher("/view/admin/UserAdd.jsp").forward(request, response);
        } else {
            request.setAttribute("err", "Notification: Failed to add!");
            request.setAttribute("nameError", nameError);
            request.setAttribute("emailError", emailError);
            request.setAttribute("phoneError", phoneError);
            request.setAttribute("passwordError", passwordError);
            request.getRequestDispatcher("/view/admin/UserAdd.jsp").forward(request, response);
        }
//        dao.addUser(password, fullname, email, phone, avatar, status, roleId, verified);
//        response.sendRedirect("user");
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

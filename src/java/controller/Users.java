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
import model.User;
import utils.CheckInputUser;
//import utils.CheckInputUser;

/**
 *
 * @author bao chau
 */
public class Users extends HttpServlet {

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
            out.println("<title>Servlet Subjects</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Subjects at " + request.getContextPath() + "</h1>");
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
    UserDAO d = new UserDAO();
    CheckInputUser check = new CheckInputUser();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Users user = new Users();
        String action = request.getParameter("action");
        switch (action) {
            case "list":
                user.userList(request, response);
                break;
            case "searchUser":
                user.searchUser(request, response);
                break;
            case "delete":
                user.deleteUser(request, response);
                break;
            case "addUser":
                user.addUser(request, response);
                break;
            case "addScreen":
                user.addScreen(request, response);
                break;
            case "detailUser":
                String id = request.getParameter("sid");
                user.detailUser(request, response, id);
                break;
            case "updateUser":
                user.updateUser(request, response);
                break;
            case "statusUserUpdate":
                user.statusUserUpdate(request, response);
                break;
            case "searchStatus":
                user.searchStatus(request, response);
                break;
            case "searchRole":
                user.searchRole(request, response);
                break;
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
        processRequest(request, response);
    }

    private void userList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ArrayList<User> list = d.getUserList();
        int numOfUser = list.size();
        int page, startPage = 1, endPage;
        int maxPage = numOfUser / 10;
        if (numOfUser % 10 != 0) {
            maxPage++;
        }

        String spage = request.getParameter("page");
        if (spage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(spage);
        }

        int start, end;
        start = (page - 1) * 10;
        end = Math.min(page * 10, numOfUser);
        ArrayList<User> listByPage = d.getUserByPage(list, start, end);

        if (page >= 3) {
            if (page + 2 < maxPage) {
                endPage = page + 2;
            } else {
                endPage = maxPage;
            }
            if (maxPage >= 5) {
                startPage = endPage - 4;
            } else {
                startPage = page - 2;
            }
        } else {
            if (maxPage >= 5) {
                endPage = 5;
            } else {
                endPage = maxPage;
            }
        }
        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("list", listByPage);
        request.getRequestDispatcher("/view/admin/UserList.jsp").forward(request, response);
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserDAO dao = new UserDAO();
        String searchQuery = request.getParameter("searchQuery");
        ArrayList<User> list = dao.searchUser(searchQuery);
        request.setAttribute("page", 1);
        request.setAttribute("startPage", 1);
        request.setAttribute("endPage", 1);
        request.setAttribute("maxPage", 1);
        request.setAttribute("list", list);
        request.getRequestDispatcher("view/admin/UserList.jsp").forward(request, response);
    }

    private void searchStatus(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserDAO dao = new UserDAO();
        String status = request.getParameter("status");
        ArrayList<User> list = dao.filterStatus(status);
        request.setAttribute("statusSaved", status);
        request.setAttribute("page", 1);
        request.setAttribute("startPage", 1);
        request.setAttribute("endPage", 1);
        request.setAttribute("maxPage", 1);
        request.setAttribute("list", list);
        request.getRequestDispatcher("view/admin/UserList.jsp").forward(request, response);
    }

    private void searchRole(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserDAO dao = new UserDAO();
        String role_id = request.getParameter("role_id");
        ArrayList<User> list = dao.filterRole(role_id);
        request.setAttribute("roleSaved", role_id);
        request.setAttribute("page", 1);
        request.setAttribute("startPage", 1);
        request.setAttribute("endPage", 1);
        request.setAttribute("maxPage", 1);
        request.setAttribute("list", list);
        request.getRequestDispatcher("view/admin/UserList.jsp").forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserDAO d = new UserDAO();
        String[] selectedList = request.getParameterValues("select");
        for (String item : selectedList) {
            d.deleteUser(item);
        }
        ArrayList<User> list = d.getUserList();
        int numOfUser = list.size();
        int page, startPage = 1, endPage;
        int maxPage = numOfUser / 10;
        if (numOfUser % 10 != 0) {
            maxPage++;
        }
        String spage = request.getParameter("page");
        if (spage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(spage);
        }
        int start, end;
        start = (page - 1) * 10;
        end = Math.min(page * 10, numOfUser);
        ArrayList<User> listByPage = d.getUserByPage(list, start, end);

        if (page >= 3) {
            if (page + 2 < maxPage) {
                endPage = page + 2;
            } else {
                endPage = maxPage;
            }
            if (maxPage >= 5) {
                startPage = endPage - 4;
            } else {
                startPage = page - 2;
            }
        } else {
            if (maxPage >= 5) {
                endPage = 5;
            } else {
                endPage = maxPage;
            }
        }
        request.setAttribute("txt", "Notification: " + selectedList.length + " users have been deleted!");
        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("listA", listByPage);
        request.getRequestDispatcher("/view/admin/UserList.jsp").forward(request, response);
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String fullname = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String avatar = request.getParameter("avatar");
        String statusParam = request.getParameter("status");
        int status = 0; // Default value or any other appropriate default
        if (statusParam != null && !statusParam.isEmpty()) {
            status = Integer.parseInt(statusParam);
        }
        String role_id = "4"; //auto set after adding 
        UserDAO dao = new UserDAO();
        String nameError = check.nameValid(fullname);
        String emailError = check.emailValid(email);
        String phoneError = check.phoneValid(phone);
        String passwordError = check.passValid(password);
        if (nameError.length() == 0 && emailError.length() == 0 && phoneError.length() == 0 && passwordError.length() == 0) {
            dao.addUser(password, fullname, email, phone, avatar, status, role_id);
            request.setAttribute("txt", "Notification: Successfully!");

        } else {
            request.setAttribute("err", "Notification: Failed to add!");
            request.setAttribute("nameError", nameError);
            request.setAttribute("emailError", emailError);
            request.setAttribute("phoneError", phoneError);
            request.setAttribute("passwordError", passwordError);
        }
        request.getRequestDispatcher("/view/admin/UserAdd.jsp").forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String uid = request.getParameter("id");
        String uname = request.getParameter("name");
        String uemail = request.getParameter("email");
        String uphone = request.getParameter("phone");
        String uavatar = request.getParameter("avatar");
        String statusParam = request.getParameter("status");
        String roleParam = request.getParameter("role");
        // Check if statusParam and roleParam are not null and not empty before parsing
        int ustatus = (statusParam != null && !statusParam.isEmpty()) ? Integer.parseInt(statusParam) : 0;
        int urole = (roleParam != null && !roleParam.isEmpty()) ? Integer.parseInt(roleParam) : 0;
        int created_by = 1;
        String nameError = check.nameValid(uname);
        if (nameError.length() == 0) {
            UserDAO dao = new UserDAO();
            dao.updateUser(uid, uavatar, uname, uemail, uphone, uavatar, ustatus, urole, created_by);
            request.setAttribute("txt", "Notification: Updated successfully!");
        } else {
            request.setAttribute("err", "Notification: Failed to update!");
            request.setAttribute("nameError", nameError);
        }
        request.getRequestDispatcher("view/admin/UserDetail.jsp").forward(request, response);
    }

    private void detailUser(HttpServletRequest request, HttpServletResponse response, String id) throws IOException, ServletException {
        try {
            UserDAO d = new UserDAO();
            User list = d.getUserByID(id);
            request.setAttribute("us", list);
            request.getRequestDispatcher("view/admin/UserDetail.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void addScreen(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("view/admin/UserAdd.jsp").forward(request, response);
    }

    private void statusUserUpdate(HttpServletRequest request, HttpServletResponse response) {
        String userId = request.getParameter("id");
        String status = request.getParameter("status");
        d.updateStatusUser(userId, status);
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ChapterDAO;
import dao.LessonDAO;
import dao.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Chapter;
import model.Lesson;
import model.Subject;

/**
 *
 * @author bao chau
 */
public class Lessons extends HttpServlet {

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
    LessonDAO d = new LessonDAO();
    SubjectDAO sd = new SubjectDAO();
    ChapterDAO cd = new ChapterDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Lessons lesson = new Lessons();
        String action = request.getParameter("action");
        switch (action) {
            case "list":
                lesson.lessonList(request, response);
                break;
            case "searchLesson":
                lesson.searchLesson(request, response);
                break;
            case "delete":
                lesson.deleteUser(request, response);
                break;
            case "addLesson":
                lesson.addLesson(request, response);
                break;
            case "addScreen":
                lesson.addScreen(request, response);
                break;
            case "detailLesson":
                String id = request.getParameter("sid");
                lesson.detailLesson(request, response, id);
                break;
//            case "updateUser":
//                user.updateUser(request, response);
//                break;
//            case "statusUserUpdate":
//                user.statusUserUpdate(request, response);
//                break;
//            case "searchStatus":
//                user.searchStatus(request, response);
//                break;
//            case "searchRole":
//                user.searchRole(request, response);
//                break;
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

    private void lessonList(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        ArrayList<Lesson> list = d.getLesList();
        ArrayList<Subject> subjectList = sd.getSubjectList();
        ArrayList<Chapter> chapterList = cd.getChapterList();
        int numOfLesson = list.size();
        int page, startPage = 1, endPage;
        int maxPage = numOfLesson / 10;
        if (numOfLesson % 10 != 0) {
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
        end = Math.min(page * 10, numOfLesson);
        ArrayList<Lesson> listByPage = d.getLessonByPage(list, start, end);

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
        request.setAttribute("listA", listByPage);
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("chapterList", chapterList);
        request.getRequestDispatcher("/view/manager/LessonList.jsp").forward(request, response);
    }

    private void searchLesson(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        LessonDAO dao = new LessonDAO();
        String searchQuery = request.getParameter("searchQuery");
        String title = request.getParameter("searchTitle");
        String chapter = request.getParameter("searchChapter");
        ArrayList<Lesson> list = dao.searchLesson(searchQuery, title, chapter);
        request.setAttribute("page", 1);
        request.setAttribute("startPage", 1);
        request.setAttribute("endPage", 1);
        request.setAttribute("maxPage", 1);
        request.setAttribute("list", list);
        request.getRequestDispatcher("view/manager/LessonList.jsp").forward(request, response);
    }

//    private void searchStatus(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        UserDAO dao = new UserDAO();
//        String status = request.getParameter("status");
//        ArrayList<User> list = dao.filterStatus(status);
//        request.setAttribute("statusSaved", status);
//        request.setAttribute("page", 1);
//        request.setAttribute("startPage", 1);
//        request.setAttribute("endPage", 1);
//        request.setAttribute("maxPage", 1);
//        request.setAttribute("list", list);
//        request.getRequestDispatcher("view/admin/UserList.jsp").forward(request, response);
//    }
//
//    private void searchRole(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        UserDAO dao = new UserDAO();
//        String role_id = request.getParameter("role_id");
//        ArrayList<User> list = dao.filterRole(role_id);
//        request.setAttribute("roleSaved", role_id);
//        request.setAttribute("page", 1);
//        request.setAttribute("startPage", 1);
//        request.setAttribute("endPage", 1);
//        request.setAttribute("maxPage", 1);
//        request.setAttribute("list", list);
//        request.getRequestDispatcher("view/admin/UserList.jsp").forward(request, response);
//    }
//
    private ArrayList<Lesson> getUpdatedLessonList() {
        LessonDAO d = new LessonDAO();
        return d.getLesList();
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        LessonDAO d = new LessonDAO();
        String[] selectedList = request.getParameterValues("select");
        for (String item : selectedList) {
            d.deleteLesson(item);
        }
        ArrayList<Lesson> list = getUpdatedLessonList();
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
        ArrayList<Lesson> listByPage = d.getLessonByPage(list, start, end);

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
        request.setAttribute("txt", "Notification: " + selectedList.length + " lessons have been deleted!");
        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("listA", listByPage);
        request.getRequestDispatcher("/view/manager/LessonList.jsp").forward(request, response);
    }

    private void addLesson(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String title = request.getParameter("title");
        String chapterId = request.getParameter("chapter_id");
        String isActive = request.getParameter("is_active");
        String description = request.getParameter("description");
        String video_link = request.getParameter("video_link");
        String file_attached = request.getParameter("file_attached");
        String subject_code = request.getParameter("subject_code");
        String linkedQuiz = request.getParameter("linked_quiz");
        String lessonType = request.getParameter("lesson_type");
        if (chapterId != null && isActive != null && linkedQuiz != null && lessonType != null) {
            try {
                int chapter_id = Integer.parseInt(chapterId);
                int is_active = Integer.parseInt(title);
                int linked_quiz = Integer.parseInt(linkedQuiz);
                int lesson_type = Integer.parseInt(lessonType);
                LessonDAO dao = new LessonDAO();
                dao.addLesson(title, chapter_id, is_active, description, video_link, file_attached, subject_code, linked_quiz, lesson_type);
                request.setAttribute("txt", "Notification: Successfully!");
            } catch (Exception e) {
                request.setAttribute("err", "Notification: Failed to add!");
                System.out.println(e);
            }
        }

//        String nameError = check.nameValid(fullname);
//        String emailError = check.emailValid(email);
//        String phoneError = check.phoneValid(phone);
//        String passwordError = check.passValid(password);
//        if (nameError.length() == 0 && emailError.length() == 0 && phoneError.length() == 0 && passwordError.length() == 0) {
//            dao.addUser(password, fullname, email, phone, avatar, status, role_id);
//            request.setAttribute("txt", "Notification: Successfully!");
//        } else {
//            request.setAttribute("err", "Notification: Failed to add!");
//            request.setAttribute("nameError", nameError);
//            request.setAttribute("emailError", emailError);
//            request.setAttribute("phoneError", phoneError);
//            request.setAttribute("passwordError", passwordError);
//        }
        request.getRequestDispatcher("/view/manager/LessonAdd.jsp").forward(request, response);
    }
//
//    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        String uid = request.getParameter("id");
//        String uname = request.getParameter("name");
//        String uemail = request.getParameter("email");
//        String uphone = request.getParameter("phone");
//        String uavatar = request.getParameter("avatar");
//        String statusParam = request.getParameter("status");
//        String roleParam = request.getParameter("role");
//        // Check if statusParam and roleParam are not null and not empty before parsing
//        int ustatus = (statusParam != null && !statusParam.isEmpty()) ? Integer.parseInt(statusParam) : 0;
//        int urole = (roleParam != null && !roleParam.isEmpty()) ? Integer.parseInt(roleParam) : 0;
//        int created_by = 1;
//        String nameError = check.nameValid(uname);
//        if (nameError.length() == 0) {
//            UserDAO dao = new UserDAO();
//            dao.updateUser(uid, uavatar, uname, uemail, uphone, uavatar, ustatus, urole, created_by);
//            request.setAttribute("txt", "Notification: Updated successfully!");
//        } else {
//            request.setAttribute("err", "Notification: Failed to update!");
//            request.setAttribute("nameError", nameError);
//        }
//        request.getRequestDispatcher("view/admin/UserDetail.jsp").forward(request, response);
//    }
//

    private void detailLesson(HttpServletRequest request, HttpServletResponse response, String id) throws IOException, ServletException {
        try {
            LessonDAO d = new LessonDAO();
            Lesson list = d.getLessonByID(id);
            request.setAttribute("lesson", list);
            request.getRequestDispatcher("view/manager/LessonDetail.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void addScreen(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("view/admin/LessonAdd.jsp").forward(request, response);
    }

//    private void statusUserUpdate(HttpServletRequest request, HttpServletResponse response) {
//        String userId = request.getParameter("id");
//        String status = request.getParameter("status");
//        d.updateStatusUser(userId, status);
//    }
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

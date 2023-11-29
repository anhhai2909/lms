<%-- 
    Document   : SidebarMenu
    Created on : Sep 17, 2023, 2:41:02 PM
    Author     : bao chau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="ttr-sidebar-logo">
            <a href="#"><img alt="" src="assets_Admin/images/logo.png" width="122" height="27"></a>
            <!-- <div class="ttr-sidebar-pin-button" title="Pin/Unpin Menu">
                    <i class="material-icons ttr-fixed-icon">gps_fixed</i>
                    <i class="material-icons ttr-not-fixed-icon">gps_not_fixed</i>
            </div> -->
            <div class="ttr-sidebar-toggle-button">
                <i class="ti-arrow-left"></i>
            </div>
        </div>
        <!-- side menu logo end -->
        <!-- sidebar menu start -->
        <nav class="ttr-sidebar-navi">
            <ul>
                <li>
                    <a href="index.html" class="ttr-material-button">
                        <span class="ttr-label">Dashboard</span>
                    </a>
                </li>

                <li>
                    <a href="subject?action=list" class="ttr-material-button">
                        <span class="ttr-label">Subjects</span>
                    </a>
                </li>

                <li>
                    <a href="user" class="ttr-material-button">
                        <span class="ttr-label">User</span>
                    </a>
                </li>

                <li>
                    <a href="settinglist?action=listSetting" class="ttr-material-button">
                        <span class="ttr-label">Setting</span>
                    </a>
                </li>

                <li>
                    <a href="Quizz" class="ttr-material-button">
                        <span class="ttr-label">Quiz</span>
                    </a>
                </li>

                <li>
                    <a href="question?action=list&subjectId=0&chapterId=0&txtQuestion=&status=-1&sortElement=none" class="ttr-material-button">
                        <span class="ttr-label">Question Bank</span>
                    </a>
                </li>

                <li>
                    <a href="classes?action=listClass" class="ttr-material-button">
                        <span class="ttr-label">Class</span>
                    </a>
                </li>

                <li>
                    <a href="lesson?action=list" class="ttr-material-button">
                        <span class="ttr-label">Lesson</span>
                    </a>
                </li>
                <li>
                    <a href="lesson?action=list" class="ttr-material-button">
                        <span class="ttr-label">Subject Setting</span>
                    </a>
                </li>
                
                <li>
                    <a href="myclasses?action=getClass" class="ttr-material-button">
                        <span class="ttr-label">My class</span>
                    </a>
                </li>
                
                <li>
                    <a href="submittedaassignment?action=getList&txtName=&classID=0&assignmentID=0&sortElement=none" class="ttr-material-button">
                        <span class="ttr-label">Assignment Submitted</span>
                    </a>
                </li>
                <li class="ttr-seperate"></li>
            </ul>
            <!-- sidebar menu end -->
        </nav>
    </body>
</html>

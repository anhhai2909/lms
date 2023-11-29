<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:10:19 GMT -->
    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="EduChamp : Education HTML Template" />

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets_Admin/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduChamp : Education HTML Template </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="assets_Admin/js/html5shiv.min.js"></script>
        <script src="assets_Admin/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets_Admin/css/assets.css">
        <link rel="stylesheet" type="text/css" href="assets_Admin/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets_Admin/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets_Admin/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets_Admin/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets_Admin/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets_Admin/css/color/color-1.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <header class="ttr-header">
            <div class="ttr-header-wrapper">
                <%@include file="/view/component/AdminPageHeader.jsp"%>
            </div>
        </header>
        <!-- header end -->
        <!-- Left sidebar menu start -->
        <div class="ttr-sidebar">
            <div class="ttr-sidebar-wrapper content-scroll">
                <!-- side menu logo start -->
                <%@include file="/view/component/SidebarMenu.jsp"%>
                <!-- sidebar menu end -->
            </div>
        </div>
        <!-- Left sidebar menu end -->

        <!--Main container start -->
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="db-breadcrumb">
                    <h4 class="breadcrumb-title">Lesson Details</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="lesson?action=list">Manage Lesson</a></li>
                        <li><a>Lesson Details</a></li>
                    </ul>
                </div>
                <div style="background-color: #CBFFDF;margin-bottom: 10px">
                    <p style="color:#6C6C6C;font-size: 18px;padding-left: 30px;font-family: initial;margin: 0;line-height: 60px">${txt}</p>
                </div>
                <div style="background-color: #FFB4C4;margin-bottom: 10px">
                    <p style="color:#6C6C6C;font-size: 18px;padding-left: 30px;font-family: initial;margin: 0;line-height: 60px"><strong>${err}</strong></p>
                </div>
                &nbsp;&nbsp;&nbsp;<a href="lesson?action=list" style="font-size: 15px"><strong>BACK TO THE LIST</strong></a>
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Lesson Details</h4>
                            </div>
                            <div class="widget-inner">                               
                                <form action="lesson" method="get" id="userForm" class="edit-profile m-b30">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="ml-auto">
                                                <h3>Basic info</h3>
                                            </div>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label" >Lesson ID</label>
                                            <div>
                                                <input class="form-control" id="inputcode" style="background-color: white" type="text" name="lesson_id" value="${lesson.lesson_id}" readonly>                                               
                                            </div>

                                        </div>

                                        <!--                                        <div class="form-group col-6">
                                                                                    <label class="col-form-label" >Subject</label>
                                                                                    <div>
                                                                                        <input class="form-control" id="inputcode" style="background-color: white" type="text" name="subject_code" value="${lesson.subject_code}" readonly>                                               
                                                                                    </div>
                                        
                                                                                </div>-->

                                        <div class="form-group col-6">
                                            <label class="col-form-label">Chapter</label>
                                            <div>
                                                <input class="form-control" id="inputname" style="background-color: white" type="text" name="chapter_id" value="${lesson.chapter_id}" readonly>
                                            </div>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label">Title</label>
                                            <div>
                                                <input class="form-control" id="inputname" style="background-color: white" type="text" name="title" value="${lesson.title}" readonly>
                                            </div>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label">Lesson Type</label>
                                            <div>
                                                <input class="form-control" id="inputemail" style="background-color: white" type="text" name="lesson_type" value="${lesson.lesson_type}" readonly>
                                            </div>
                                        </div>	

                                        <!--                                        <div class="form-group col-6">
                                                                                    <label class="col-form-label">Linked Quiz</label>
                                                                                    <div>
                                                                                        <input class="form-control" id="inputemail" style="background-color: white" type="text" name="linked_quiz" value="${lesson.linked_quiz}" readonly>
                                                                                    </div>
                                                                                </div>	-->

                                        <div class="form-group col-12">
                                            <label class="col-form-label">Video URL</label>
                                            <div>
                                                <input class="form-control" id="inputphone" style="background-color: white" type= "text" name="video_link" value="${lesson.video_link}" readonly>
                                            </div>
                                            <p style="color:red">${phoneError}</p>
                                        </div>	

                                        <!--                                        <div class="form-group col-3">
                                                                                    <label class="col-form-label">User Role</label>
                                                                                    <select id="inputrole" name="role">
                                                                                        <option value="1" ${requestScope.us.role.setting_value eq 'Admin' ? 'selected' : ''}>Admin</option>
                                                                                        <option value="2" ${requestScope.us.role.setting_value eq 'Subject Manager' ? 'selected' : ''}>Subject Manager</option>
                                                                                        <option value="3" ${requestScope.us.role.setting_value eq 'Trainer' ? 'selected' : ''}>Trainer</option>
                                                                                        <option value="4" ${requestScope.us.role.setting_value eq 'Trainee' ? 'selected' : ''}>Trainee</option>
                                                                                    </select>
                                                                                </div>-->

                                        <div class="form-group col-6">
                                            <label class="col-form-label">Status</label>
                                            <div> 
                                                <select class="" name="is_active" required>
                                                    <option value="-1" ${requestScope.lesson.is_active == -1 ? 'selected' : ''}>Unverified</option>
                                                    <option value="1" ${requestScope.lesson.is_active == 1 ? 'selected' : ''}>Active</option>
                                                    <option value="0" ${requestScope.lesson.is_active == 0 ? 'selected' : ''}>Inactive</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label">Created At</label>
                                            <div>
                                                <input class="form-control" style="background-color: white" type="text" name="created_at" value="${requestScope.lesson.created_at}" readonly>
                                            </div>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label">Created By</label>
                                            <div>
                                                <input class="form-control" style="background-color: white" type="text" name="created_by" value="${requestScope.lesson.created_by}" readonly>
                                            </div>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label">Updated At</label>
                                            <div>
                                                <input class="form-control" style="background-color: white" type="text" name="updated_at" value="${requestScope.lesson.updated_at}" readonly>
                                            </div>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label">Updated By</label>
                                            <div>
                                                <input class="form-control" style="background-color: white" type="text" name="updated_by" value="${requestScope.lesson.updated_by}" readonly>
                                            </div>
                                        </div>

                                        <div class="form-group col-12">
                                            <label class="col-form-label">Content</label>
                                            <div>
                                                <textarea class="form-control" style="background-color: white" name="description" readonly>${requestScope.lesson.description}</textarea>
                                            </div>
                                        </div>


                                        <div class="col-12" id="editbut" style="display: block">
                                            <button type="button" class="btn-secondry add-item m-r5" onclick="turnEdit()">Edit</button>                                            
                                        </div>

                                        <input type="text" name="action" style="display: none" value="updateLesson"/>
                                        <div class="col-12" id="savebut" style="display: none">
                                            <input type="submit" class="btn-secondry add-item m-r5" value="Save Changes"/>
                                            <input type="button" onclick="resetForm()" class="btn-secondry add-item m-r5" value="Reset Changes"/>
                                            <button type="button" class="btn-secondry add-item m-r5" onclick="turnView()">View</button>
                                        </div>                                                                    
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>

        <script>
            function resetForm() {
                var userForm = document.getElementById("userForm");
                userForm.reset();
                var selectElements = userForm.getElementsByTagName("select");
                for (var i = 0; i < selectElements.length; i++) {
                    selectElements[i].removeAttribute("disabled");
                }
            }


//            function turnEdit() {
//                document.getElementById('inputcode').readOnly = true;
//                document.getElementById('inputname').readOnly = false;
//                document.getElementById('inputemail').readOnly = false;
//                document.getElementById('inputphone').readOnly = false;
//                document.getElementById('inputrole').readOnly = false;
//                document.getElementById('savebut').style.display = "block";
//                document.getElementById('editbut').style.display = "none";
//            }
//            function turnView() {
//                document.getElementById('inputcode').readOnly = true;
//                document.getElementById('inputname').readOnly = true;
//                document.getElementById('inputemail').readOnly = true;
//                document.getElementById('inputphone').readOnly = true;
//                document.getElementById('savebut').style.display = "none";
//                document.getElementById('editbut').style.display = "block";
//            }
        </script>
        <!-- External JavaScripts -->
        <script src="assets_Admin/js/jquery.min.js"></script>
        <script src="assets_Admin/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets_Admin/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets_Admin/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets_Admin/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="assets_Admin/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="assets_Admin/vendors/counter/waypoints-min.js"></script>
        <script src="assets_Admin/vendors/counter/counterup.min.js"></script>
        <script src="assets_Admin/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="assets_Admin/vendors/masonry/masonry.js"></script>
        <script src="assets_Admin/vendors/masonry/filter.js"></script>
        <script src="assets_Admin/vendors/owl-carousel/owl.carousel.js"></script>
        <script src='assets_Admin/vendors/scroll/scrollbar.min.js'></script>
        <script src="assets_Admin/js/functions.js"></script>
        <script src="assets_Admin/vendors/chart/chart.min.js"></script>
        <script src="assets_Admin/js/admin.js"></script>
        <script src='assets_Admin/vendors/switcher/switcher.js'></script>
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>
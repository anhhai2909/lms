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
        <title>EduChamp : Education </title>

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style>
            .label {
                font-family: sans-serif;
                font-size: 15px;
                color: #333;
            }
        </style>
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
                    <h4 class="breadcrumb-title">Add Lesson</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="lesson?action=list">Manage Lesson</a></li>
                        <li>Add Lesson</li>
                    </ul>
                </div>
                <div style="background-color: #CBFFDF;margin-bottom: 10px">
                    <p style="color:#6C6C6C;font-size: 18px;padding-left: 30px;font-family: initial;margin: 0;line-height: 60px">${txt}</p>
                </div>
                <div style="background-color: #FFB4C4;margin-bottom: 10px">
                    <p style="color:#6C6C6C;font-size: 18px;padding-left: 30px;font-family: initial;margin: 0;line-height: 60px">${err}</p>
                </div>
                &nbsp;&nbsp;&nbsp;<a href="lesson?action=list" style="font-size: 15px"><strong>BACK TO THE LIST</strong></a>
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Add Lesson</h4>
                            </div>  

                            <div class="widget-inner">

                                <form action="lesson" method="get" id="lessonForm" class="edit-profile m-b30">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="ml-auto">
                                                <h3 style="margin-bottom: 15px;font-size: 20px">Basic info</h3>
                                            </div>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label" style="font-size: 17px">Subject</label>
                                            <select name="subject_code" id="subjectDropdown">
                                                <option value="" selected disabled>Choose Subject</option>
                                                <option value="">SWT-Software Testing</option>
                                                <option value="">SWR-Software Requirement</option>
                                            </select>
                                            <div>

                                            </div>
                                            <!--<p style="color:red">${nameError}</p>-->
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label" style="font-size: 17px" >Chapter</label>
                                            <div>
                                                <select name="chapter_id">
                                                    <option selected disabled>Choose Chapter</option>
                                                    <option value="">Chapter 1 - Hello</option>
                                                    <option value="">Chapter 2 - Hoc di</option>
                                                </select>
                                            </div>
                                            <!--<p style="color:red">${emailError}</p>-->
                                        </div>	

                                        <div class="form-group col-6">
                                            <label class="col-form-label" style="font-size: 17px">Title</label>
                                            <div>
                                                <input name="title" class="form-control" type="text" placeholder="Enter title lesson" required>
                                            </div>
                                            <!--<p style="color:red">${phoneError}</p>-->
                                        </div>	

                                        <div class="form-group col-6">
                                            <label class="col-form-label" style="font-size: 17px" >Lesson Type</label>
                                            <div class="" style="margin-top: 10px;font-size: 14px"> 
                                                &nbsp;&nbsp;&nbsp;<input type="radio" name="lesson_type" value="1"/>&nbsp;Video&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="lesson_type" value="2"/>&nbsp;Quiz&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="lesson_type" value="3"/>&nbsp;Assignment
                                            </div>
                                            <!--<p style="color:red">${passwordError}</p>-->
                                        </div>	

                                        <div class="form-group col-12">
                                            <label class="col-form-label" style="font-size: 17px">Video Link</label>
                                            <input name="video_link" class="form-control" type="text" placeholder="Enter video url" required>
                                        </div>

                                        <div class="form-group col-12">
                                            <label class="col-form-label" style="font-size: 17px">Description</label>
                                            <textarea name="title" class="form-control" type="text" placeholder="Enter description" required></textarea>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label" style="font-size: 17px">Linked Quiz</label>
                                            <div>
                                                <select name="linked_quiz">
                                                    <option selected disabled>Choose linked quiz</option>
                                                    <option value="">Quiz 1</option>
                                                    <option value="">Quiz 2</option>
                                                </select>
                                            </div>
                                            <!--<p style="color:red">${phoneError}</p>-->
                                        </div>	

                                        <div class="form-group col-6">
                                            <label class="col-form-label" style="font-size: 17px">Status</label>
                                            <div class="" style="margin-top: 10px;font-size: 14px"> 
                                                &nbsp;&nbsp;&nbsp;<input type="radio" name="is_active" value="-1"/>&nbsp;Unverified&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="is_active" value="1"/>&nbsp;Active&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="is_active" value="0"/>&nbsp;Inactive
                                            </div>
                                            <!--<p style="color:red">${passwordError}</p>-->
                                        </div>

                                        <div class="seperator"></div>

                                        <input type="text" name="action" style="display: none" value="addLesson">
                                        <div class="col-12">
                                            <input type="submit" onclick="show()" class="btn-secondry add-item m-r5" value="Save Changes"/>
                                            <input type="button" onclick="resetForm()" class="btn-secondry add-item m-r5" value="Reset Changes"/>
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

            document.addEventListener("DOMContentLoaded", function () {
                var subjectDropdown = document.getElementById("subjectDropdown");
                subjectDropdown.addEventListener("click", function () {
                    // Hide the disabled option
                    var disabledOption = subjectDropdown.querySelector('option:disabled');
                    if (disabledOption) {
                        disabledOption.style.display = "none";
                    }
                });

                // Restore the hidden option when the user clicks outside the dropdown
                document.addEventListener("click", function (event) {
                    if (event.target !== subjectDropdown) {
                        var disabledOption = subjectDropdown.querySelector('option:disabled');
                        if (disabledOption) {
                            disabledOption.style.display = "";
                        }
                    }
                });
            });

            function resetForm() {
                var lessonForm = document.getElementById("lessonForm");
                lessonForm.reset();
            }
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
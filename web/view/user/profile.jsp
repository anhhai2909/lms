<!DOCTYPE html>
<html lang="en">
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <link rel="icon" href="${pageContext.request.contextPath}/assets_User/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets_User/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduChamp : Education HTML Template </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="${pageContext.request.contextPath}/assets_User/js/html5shiv.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_User/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_User/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_User/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_User/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_User/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_User/css/color/color-1.css">

    </head>
<style>
    .password-field-container {
        position: relative;
    }

    .password-field {
        padding-right: 30px; /* Adjust the padding to make room for the icon */
    }

    .password-toggle-icon {
        position: absolute;
        top: 40%;
        right: 20px; /* Adjust the right position as needed */
        cursor: pointer;
        transform: translateY(-50%);
        z-index: 1;
        width: 16px; /* Adjust the width to make the icon smaller */
        height: auto; /* Adjust the height to make the icon smaller */
    }
</style>
    <style>
        /* Style the button and label */
        .custom-button,
        .custom-label {
            background-color: #FFA500; /* Orange by default */
            color: black; /* Text color */
            padding: 10px 20px; /* Adjust padding as needed */
            border: none; /* Remove border */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Show a pointer cursor on hover */
            transition: background-color 0.3s ease-in-out; /* Add a smooth transition */
        }

        .custom-button:hover,
        .custom-label:hover {
            background-color: #800080; /* Purple on hover */
        }

        /* Hide the original file input element */
        #input-file {
            display: none;
        }
    </style>
    
    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <!-- Header Top ==== -->
            <header class="header rs-nav">
                <div class="top-bar">
                    <div class="container">
                        <div class="row d-flex justify-content-between">
                            <div class="topbar-left">
                                <ul>
                                    <li><a href="faq-1.html"><i class="fa fa-question-circle"></i>Ask a Question</a></li>
                                    <li><a href="javascript:;"><i class="fa fa-envelope-o"></i>Support@website.com</a></li>
                                </ul>
                            </div>
                            <div class="topbar-right">
                                <ul>
                                    <li>
                                        <select class="header-lang-bx">
                                            <option data-icon="flag flag-uk">English UK</option>
                                            <option data-icon="flag flag-us">English US</option>
                                        </select>
                                    </li>
                                    <li><a href="login.html">Logout</a></li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sticky-header navbar-expand-lg">
                    <div class="menu-bar clearfix">
                        <div class="container clearfix">
                            <!-- Header Logo ==== -->
                            <div class="menu-logo">
                                <a href="index.html"><img src="${pageContext.request.contextPath}/assets_User/images/logo.png" alt=""></a>
                            </div>
                            <!-- Mobile Nav Button ==== -->
                            <button class="navbar-toggler collapsed menuicon justify-content-end" type="button" data-toggle="collapse" data-target="#menuDropdown" aria-controls="menuDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                <span></span>
                                <span></span>
                                <span></span>
                            </button>
                            <!-- Author Nav ==== -->
                            <div class="secondary-menu">
                                <div class="secondary-inner">
                                    <ul>
                                        <li><a href="javascript:;" class="btn-link"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="javascript:;" class="btn-link"><i class="fa fa-google-plus"></i></a></li>
                                        <li><a href="javascript:;" class="btn-link"><i class="fa fa-linkedin"></i></a></li>
                                        <!-- Search Button ==== -->
                                        <li class="search-btn"><button id="quik-search-btn" type="button" class="btn-link"><i class="fa fa-search"></i></button></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Search Box ==== -->
                            <div class="nav-search-bar">
                                <form action="#">
                                    <input name="search" value="" type="text" class="form-control" placeholder="Type to search">
                                    <span><i class="ti-search"></i></span>
                                </form>
                                <span id="search-remove"><i class="ti-close"></i></span>
                            </div>
                            <!-- Navigation Menu ==== -->
                            <div class="menu-links navbar-collapse collapse justify-content-start" id="menuDropdown">
                                <div class="menu-logo">
                                    <a href="index.html"><img src="${pageContext.request.contextPath}/assets_User/images/logo.png" alt=""></a>
                                </div>
                                <ul class="nav navbar-nav">	
                                    <li class="active"><a href="javascript:;">Home <i class="fa fa-chevron-down"></i></a>
                                        <ul class="sub-menu">
                                            <li><a href="index.html">Home 1</a></li>
                                            <li><a href="index-2.html">Home 2</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="javascript:;">Pages <i class="fa fa-chevron-down"></i></a>
                                        <ul class="sub-menu">
                                            <li><a href="javascript:;">About<i class="fa fa-angle-right"></i></a>
                                                <ul class="sub-menu">
                                                    <li><a href="about-1.html">About 1</a></li>
                                                    <li><a href="about-2.html">About 2</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:;">Event<i class="fa fa-angle-right"></i></a>
                                                <ul class="sub-menu">
                                                    <li><a href="event.html">Event</a></li>
                                                    <li><a href="events-details.html">Events Details</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:;">FAQ's<i class="fa fa-angle-right"></i></a>
                                                <ul class="sub-menu">
                                                    <li><a href="faq-1.html">FAQ's 1</a></li>
                                                    <li><a href="faq-2.html">FAQ's 2</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:;">Contact Us<i class="fa fa-angle-right"></i></a>
                                                <ul class="sub-menu">
                                                    <li><a href="contact-1.html">Contact Us 1</a></li>
                                                    <li><a href="contact-2.html">Contact Us 2</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="portfolio.html">Portfolio</a></li>
                                            <li><a href="profile.html">Profile</a></li>
                                            <li><a href="membership.html">Membership</a></li>
                                            <li><a href="error-404.html">404 Page</a></li>
                                        </ul>
                                    </li>
                                    <li class="add-mega-menu"><a href="javascript:;">Our Courses <i class="fa fa-chevron-down"></i></a>
                                        <ul class="sub-menu add-menu">
                                            <li class="add-menu-left">
                                                <h5 class="menu-adv-title">Our Courses</h5>
                                                <ul>
                                                    <li><a href="courses.html">Courses </a></li>
                                                    <li><a href="courses-details.html">Courses Details</a></li>
                                                    <li><a href="profile.html">Instructor Profile</a></li>
                                                    <li><a href="event.html">Upcoming Event</a></li>
                                                    <li><a href="membership.html">Membership</a></li>
                                                </ul>
                                            </li>
                                            <li class="add-menu-right">
                                                <img src="${pageContext.request.contextPath}/assets_User/images/adv/adv.jpg" alt=""/>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="javascript:;">Blog <i class="fa fa-chevron-down"></i></a>
                                        <ul class="sub-menu">
                                            <li><a href="blog-classic-grid.html">Blog Classic</a></li>
                                            <li><a href="blog-classic-sidebar.html">Blog Classic Sidebar</a></li>
                                            <li><a href="blog-list-sidebar.html">Blog List Sidebar</a></li>
                                            <li><a href="blog-standard-sidebar.html">Blog Standard Sidebar</a></li>
                                            <li><a href="blog-details.html">Blog Details</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-dashboard"><a href="javascript:;">Dashboard <i class="fa fa-chevron-down"></i></a>
                                        <ul class="sub-menu">
                                            <li><a href="admin/index.html">Dashboard</a></li>
                                            <li><a href="admin/add-listing.html">Add Listing</a></li>
                                            <li><a href="admin/bookmark.html">Bookmark</a></li>
                                            <li><a href="admin/courses.html">Courses</a></li>
                                            <li><a href="admin/review.html">Review</a></li>
                                            <li><a href="admin/teacher-profile.html">Teacher Profile</a></li>
                                            <li><a href="admin/user-profile.html">User Profile</a></li>
                                            <li><a href="javascript:;">Calendar<i class="fa fa-angle-right"></i></a>
                                                <ul class="sub-menu">
                                                    <li><a href="admin/basic-calendar.html">Basic Calendar</a></li>
                                                    <li><a href="admin/list-view-calendar.html">List View Calendar</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:;">Mailbox<i class="fa fa-angle-right"></i></a>
                                                <ul class="sub-menu">
                                                    <li><a href="admin/mailbox.html">Mailbox</a></li>
                                                    <li><a href="admin/mailbox-compose.html">Compose</a></li>
                                                    <li><a href="admin/mailbox-read.html">Mail Read</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                                <div class="nav-social-link">
                                    <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                                    <a href="javascript:;"><i class="fa fa-google-plus"></i></a>
                                    <a href="javascript:;"><i class="fa fa-linkedin"></i></a>
                                </div>
                            </div>
                            <!-- Navigation Menu END ==== -->
                        </div>
                    </div>
                </div>
            </header>
            <!-- header END ==== -->
            <!-- Content -->
            <div class="page-content bg-white">
                <!-- inner page banner -->
                <div class="page-banner ovbl-dark" style="background-image:url(${pageContext.request.contextPath}/assets_User/images/banner/banner1.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white">Profile</h1>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb row -->
                <div class="breadcrumb-row">
                    <div class="container">
                        <ul class="list-inline">
                            <li><a href="#">Home</a></li>
                            <li>Profile</li>
                        </ul>
                    </div>
                </div>
                <!-- Breadcrumb row END -->
                <!-- inner page banner END -->
                <div class="content-block">
                    <!-- About Us -->
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                                    <div class="profile-bx text-center">
                                        <c:set var="u" value="${lstUserProfile}" />
                                        <div class="user-profile-thumb">
                                            <img src="${pageContext.request.contextPath}/view/img_user/${u.getAvatar()}" alt=""/>
                                        </div>
                                        <div class="profile-info">
                                            <h4>${u.fullname}</h4>
                                        </div>
                                        <div class="profile-social">
                                            <ul class="list-inline m-a0">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="profile-tabnav">
                                            <ul class="nav nav-tabs">
                                                <li class="nav-item">
                                                    <a class="nav-link active" data-toggle="tab" href="#courses"><i class="ti-book"></i>Courses</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#quiz-results"><i class="ti-bookmark-alt"></i>Quiz Results </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#edit-profile"><i class="ti-pencil-alt"></i>Edit Profile</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#change-password"><i class="ti-lock"></i>Change Password</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-8 col-sm-12 m-b30">
                                    <div class="profile-content-bx">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="courses">
                                                <div class="profile-head">
                                                    <h3>My Courses</h3>
                                                    <div class="feature-filters style1 ml-auto">
                                                        <ul class="filters" data-toggle="buttons">
                                                            <li data-filter="" class="btn active">
                                                                <input type="radio">
                                                                <a href="#"><span>All</span></a> 
                                                            </li>
                                                            <li data-filter="publish" class="btn">
                                                                <input type="radio">
                                                                <a href="#"><span>Publish</span></a> 
                                                            </li>
                                                            <li data-filter="pending" class="btn">
                                                                <input type="radio">
                                                                <a href="#"><span>Pending</span></a> 
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="courses-filter">
                                                    <div class="clearfix">
                                                        <ul id="masonry" class="ttr-gallery-listing magnific-image row">
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="${pageContext.request.contextPath}/assets_User/images/courses/pic1.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
                                                                        <div class="review">
                                                                            <span>3 Review</span>
                                                                            <ul class="cours-star">
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="price">
                                                                            <del>$190</del>
                                                                            <h5>$120</h5>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 pending">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="${pageContext.request.contextPath}/assets_User/images/courses/pic2.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
                                                                        <div class="review">
                                                                            <span>3 Review</span>
                                                                            <ul class="cours-star">
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="price">
                                                                            <del>$190</del>
                                                                            <h5>$120</h5>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="${pageContext.request.contextPath}/assets_User/images/courses/pic3.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
                                                                        <div class="review">
                                                                            <span>3 Review</span>
                                                                            <ul class="cours-star">
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="price">
                                                                            <del>$190</del>
                                                                            <h5>$120</h5>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 pending">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="${pageContext.request.contextPath}/assets_User/images/courses/pic4.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
                                                                        <div class="review">
                                                                            <span>3 Review</span>
                                                                            <ul class="cours-star">
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="price">
                                                                            <del>$190</del>
                                                                            <h5>$120</h5>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="${pageContext.request.contextPath}/assets_User/images/courses/pic5.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
                                                                        <div class="review">
                                                                            <span>3 Review</span>
                                                                            <ul class="cours-star">
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="price">
                                                                            <del>$190</del>
                                                                            <h5>$120</h5>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 pending">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="${pageContext.request.contextPath}/assets_User/images/courses/pic6.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
                                                                        <div class="review">
                                                                            <span>3 Review</span>
                                                                            <ul class="cours-star">
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="price">
                                                                            <del>$190</del>
                                                                            <h5>$120</h5>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="${pageContext.request.contextPath}/assets_User/images/courses/pic7.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
                                                                        <div class="review">
                                                                            <span>3 Review</span>
                                                                            <ul class="cours-star">
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="price">
                                                                            <del>$190</del>
                                                                            <h5>$120</h5>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 book">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="${pageContext.request.contextPath}/assets_User/images/courses/pic8.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
                                                                        <div class="review">
                                                                            <span>3 Review</span>
                                                                            <ul class="cours-star">
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="price">
                                                                            <del>$190</del>
                                                                            <h5>$120</h5>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                                <div class="cours-bx">
                                                                    <div class="action-box">
                                                                        <img src="${pageContext.request.contextPath}/assets_User/images/courses/pic9.jpg" alt="">
                                                                        <a href="#" class="btn">Read More</a>
                                                                    </div>
                                                                    <div class="info-bx text-center">
                                                                        <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                                        <span>Programming</span>
                                                                    </div>
                                                                    <div class="cours-more-info">
                                                                        <div class="review">
                                                                            <span>3 Review</span>
                                                                            <ul class="cours-star">
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li class="active"><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                                <li><i class="fa fa-star"></i></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="price">
                                                                            <del>$190</del>
                                                                            <h5>$120</h5>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="quiz-results">
                                                <div class="profile-head">
                                                    <h3>Quiz Results</h3>
                                                </div>
                                                <div class="courses-filter">
                                                    <div class="row">
                                                        <div class="col-md-6 col-lg-6">
                                                            <ul class="course-features">
                                                                <li><i class="ti-book"></i> <span class="label">Lectures</span> <span class="value">8</span></li>
                                                                <li><i class="ti-help-alt"></i> <span class="label">Quizzes</span> <span class="value">1</span></li>
                                                                <li><i class="ti-time"></i> <span class="label">Duration</span> <span class="value">60 hours</span></li>
                                                                <li><i class="ti-stats-up"></i> <span class="label">Skill level</span> <span class="value">Beginner</span></li>
                                                                <li><i class="ti-smallcap"></i> <span class="label">Language</span> <span class="value">English</span></li>
                                                                <li><i class="ti-user"></i> <span class="label">Students</span> <span class="value">32</span></li>
                                                                <li><i class="ti-check-box"></i> <span class="label">Assessments</span> <span class="value">Yes</span></li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-6 col-lg-6">
                                                            <ul class="course-features">
                                                                <li><i class="ti-book"></i> <span class="label">Lectures</span> <span class="value">8</span></li>
                                                                <li><i class="ti-help-alt"></i> <span class="label">Quizzes</span> <span class="value">1</span></li>
                                                                <li><i class="ti-time"></i> <span class="label">Duration</span> <span class="value">60 hours</span></li>
                                                                <li><i class="ti-stats-up"></i> <span class="label">Skill level</span> <span class="value">Beginner</span></li>
                                                                <li><i class="ti-smallcap"></i> <span class="label">Language</span> <span class="value">English</span></li>
                                                                <li><i class="ti-user"></i> <span class="label">Students</span> <span class="value">32</span></li>
                                                                <li><i class="ti-check-box"></i> <span class="label">Assessments</span> <span class="value">Yes</span></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="edit-profile">
                                                <div class="profile-head">
                                                    <h3>Edit Profile</h3>
                                                </div>
                                                <div class="row">
                                                    <!-- Your Profile Views Chart -->
                                                    <div class="col-lg-12 m-b30">
                                                        <div class="widget-box">
                                                            <div class="wc-title">

                                                            </div>
                                                            <c:set var="u" value="${lstUserProfile}" />
                                                            <div class="hero">  

                                                                <form class="edit-profile m-b30" action="UserProfile" method="post" enctype="multipart/form-data">
                                                                    <!-- Add a hidden input field to specify the form type -->
                                                                    <input type="hidden" name="formType" value="uploadAvatar">

                                                                    <!-- Input field for selecting an avatar image -->
                                                                    <input type="file" hidden="" name="avatar" accept="image/jpeg, image/png, image/jpg" id="input-file" onchange="displayAvatar(this)">

                                                                    <!-- Image preview area -->                                   
                                                                    <img src="${pageContext.request.contextPath}/view/img_user/${u.getAvatar()}" alt="User Avatar" id="profile-pic" width="100">


                                                                    <label class="custom-label" for="input-file">Upload Profile Picture</label>

                                                                    <button type="submit" class="custom-button">Save Avatar</button>
                                                                </form>
                                                            </div>

                                                            <form class="edit-profile m-b30" action="UserProfile" method="post">
                                                                <input type="hidden" name="formType" value="personalDetails"> <!-- Add this hidden field -->
                                                                <div class="container">
                                                                    <div class="form-group row">
                                                                        <div class="col-sm-10 ml-auto">
                                                                            <h3>2. Personal Details</h3>
                                                                        </div>
                                                                    </div>
                                                                    <c:set var="u" value="${lstUserProfile}" />
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label" for="fullname">Full Name</label>
                                                                        <div class="col-sm-7">
                                                                            <input id="fullname" name="fullname" class="form-control" type="text" value="${u.fullname}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label"  for="email">Email</label>
                                                                        <div class="col-sm-7">
                                                                            <input id="email" name="email" readonly="" class="form-control" type="email" value="${u.email}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label" for="phone_number">Phone No.</label>
                                                                        <div class="col-sm-7">
                                                                            <input id="phone_number" name="phone_number" class="form-control" type="number" value="${u.phone_number}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">Role Name</label>
                                                                        <div class="col-sm-7">
                                                                            <input  class="form-control" type="text" readonly="" value="${u.role.role_name}">
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group row">
                                                                        <div class="col-sm-2"></div>
                                                                        <div class="col-sm-7">
                                                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                                                            <button type="reset" class="btn btn-secondary">Cancel</button>
                                                                            <div></div>
                                                                            <span style="color: red">${sessionScope.msg1}</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div><!-- </div> -->
                                                </div>
                                            </div>
                                            <div  class="tab-pane"  id="change-password">
                                                <div class="profile-head">
                                                    <h3>Change Password</h3>
                                                </div>
                                                <form class="edit-profile m-b30" action="UserProfile" method="post">
                                                    <input type="hidden" name="formType" value="passwordChange"> <!-- Add this hidden field -->
                                                    <div class="container">
                                                        <div class="form-group row">
                                                            <div class="col-sm-10 ml-auto">
                                                                <h3>3. Password</h3>
                                                            </div>
                                                        </div>

                                                        <!-- Old Password -->
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label" for="oldPass">Old Password</label>
                                                            <div class="col-sm-7">
                                                                <input id="oldPass" name="oldPass" class="form-control password-field" type="password" value="">
                                                                <img class="password-toggle-icon" src="${pageContext.request.contextPath}/eye-icons/eye-close.png" data-target="oldPass" alt="Toggle Password">
                                                            </div>
                                                        </div>

                                                        <!-- New Password -->
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label" for="newPass">New Password</label>
                                                            <div class="col-sm-7">
                                                                <input id="newPass" name="newPass" class="form-control password-field" type="password" value=""
                                                                       pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"
                                                                       title="Password must contain at least eight characters, at least one number, and both lower and uppercase letters and special characters">
                                                                <small class="form-text text-muted">Password must contain at least eight characters, at least one number, and both lower and uppercase letters and special characters.</small>
                                                                <img class="password-toggle-icon" src="${pageContext.request.contextPath}/eye-icons/eye-close.png" data-target="newPass" alt="Toggle Password">
                                                            </div>
                                                        </div>

                                                        <!-- Re-Type Password -->
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label" for="reNewPass">Re-Type Password</label>
                                                            <div class="col-sm-7">
                                                                <input id="reNewPass" name="reNewPass" class="form-control password-field" type="password" value="">
                                                                <img class="password-toggle-icon" src="${pageContext.request.contextPath}/eye-icons/eye-close.png" data-target="reNewPass" alt="Toggle Password">
                                                            </div>
                                                        </div>

                                                        <div class="form-group row">
                                                            <div class="col-sm-2"></div>
                                                            <div class="col-sm-7">
                                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                                                <button type="reset" class="btn btn-secondary">Cancel</button>
                                                                <div></div>
                                                                <span style="color: red">${sessionScope.msg}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>

                                            </div> 

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- contact area END -->
                    </div>
                    <!-- Content END-->
                    <!-- Footer ==== -->
                    <footer>
                        <div class="footer-top">
                            <div class="pt-exebar">
                                <div class="container">
                                    <div class="d-flex align-items-stretch">
                                        <div class="pt-logo mr-auto">
                                            <a href="index.html"><img src="${pageContext.request.contextPath}/assets_User/images/logo-white.png" alt=""/></a>
                                        </div>
                                        <div class="pt-social-link">
                                            <ul class="list-inline m-a0">
                                                <li><a href="#" class="btn-link"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#" class="btn-link"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#" class="btn-link"><i class="fa fa-linkedin"></i></a></li>
                                                <li><a href="#" class="btn-link"><i class="fa fa-google-plus"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="pt-btn-join">
                                            <a href="#" class="btn ">Join Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-4 col-md-12 col-sm-12 footer-col-4">
                                        <div class="widget">
                                            <h5 class="footer-title">Sign Up For A Newsletter</h5>
                                            <p class="text-capitalize m-b20">Weekly Breaking news analysis and cutting edge advices on job searching.</p>
                                            <div class="subscribe-form m-b20">
                                                <form class="subscription-form" action="http://educhamp.themetrades.com/demo/${pageContext.request.contextPath}/assets_User/script/mailchamp.php" method="post">
                                                    <div class="ajax-message"></div>
                                                    <div class="input-group">
                                                        <input name="email" required="required"  class="form-control" placeholder="Your Email Address" type="email">
                                                        <span class="input-group-btn">
                                                            <button name="submit" value="Submit" type="submit" class="btn"><i class="fa fa-arrow-right"></i></button>
                                                        </span> 
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-lg-5 col-md-7 col-sm-12">
                                        <div class="row">
                                            <div class="col-4 col-lg-4 col-md-4 col-sm-4">
                                                <div class="widget footer_widget">
                                                    <h5 class="footer-title">Company</h5>
                                                    <ul>
                                                        <li><a href="index.html">Home</a></li>
                                                        <li><a href="about-1.html">About</a></li>
                                                        <li><a href="faq-1.html">FAQs</a></li>
                                                        <li><a href="contact-1.html">Contact</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-4 col-lg-4 col-md-4 col-sm-4">
                                                <div class="widget footer_widget">
                                                    <h5 class="footer-title">Get In Touch</h5>
                                                    <ul>
                                                        <li><a href="http://educhamp.themetrades.com/admin/index.html">Dashboard</a></li>
                                                        <li><a href="blog-classic-grid.html">Blog</a></li>
                                                        <li><a href="portfolio.html">Portfolio</a></li>
                                                        <li><a href="event.html">Event</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-4 col-lg-4 col-md-4 col-sm-4">
                                                <div class="widget footer_widget">
                                                    <h5 class="footer-title">Courses</h5>
                                                    <ul>
                                                        <li><a href="courses.html">Courses</a></li>
                                                        <li><a href="courses-details.html">Details</a></li>
                                                        <li><a href="membership.html">Membership</a></li>
                                                        <li><a href="profile.html">Profile</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-lg-3 col-md-5 col-sm-12 footer-col-4">
                                        <div class="widget widget_gallery gallery-grid-4">
                                            <h5 class="footer-title">Our Gallery</h5>
                                            <ul class="magnific-image">
                                                <li><a href="${pageContext.request.contextPath}/assets_User/images/gallery/pic1.jpg" class="magnific-anchor"><img src="${pageContext.request.contextPath}/assets_User/images/gallery/pic1.jpg" alt=""></a></li>
                                                <li><a href="${pageContext.request.contextPath}/assets_User/images/gallery/pic2.jpg" class="magnific-anchor"><img src="${pageContext.request.contextPath}/assets_User/images/gallery/pic2.jpg" alt=""></a></li>
                                                <li><a href="${pageContext.request.contextPath}/assets_User/images/gallery/pic3.jpg" class="magnific-anchor"><img src="${pageContext.request.contextPath}/assets_User/images/gallery/pic3.jpg" alt=""></a></li>
                                                <li><a href="${pageContext.request.contextPath}/assets_User/images/gallery/pic4.jpg" class="magnific-anchor"><img src="${pageContext.request.contextPath}/assets_User/images/gallery/pic4.jpg" alt=""></a></li>
                                                <li><a href="${pageContext.request.contextPath}/assets_User/images/gallery/pic5.jpg" class="magnific-anchor"><img src="${pageContext.request.contextPath}/assets_User/images/gallery/pic5.jpg" alt=""></a></li>
                                                <li><a href="${pageContext.request.contextPath}/assets_User/images/gallery/pic6.jpg" class="magnific-anchor"><img src="${pageContext.request.contextPath}/assets_User/images/gallery/pic6.jpg" alt=""></a></li>
                                                <li><a href="${pageContext.request.contextPath}/assets_User/images/gallery/pic7.jpg" class="magnific-anchor"><img src="${pageContext.request.contextPath}/assets_User/images/gallery/pic7.jpg" alt=""></a></li>
                                                <li><a href="${pageContext.request.contextPath}/assets_User/images/gallery/pic8.jpg" class="magnific-anchor"><img src="${pageContext.request.contextPath}/assets_User/images/gallery/pic8.jpg" alt=""></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="footer-bottom">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 text-center"> <a target="_blank" href="https://www.templateshub.net">Templates Hub</a></div>
                                </div>
                            </div>
                        </div>
                    </footer>
                    <!-- Footer END ==== -->
                    <button class="back-to-top fa fa-chevron-up" ></button>
                </div>
                <!-- External JavaScripts -->
                <script>
                    let profilePic = document.getElementById("profile-pic");
                    let inputfile = document.getElementById("input-file");
                    inputfile.onchange = function () {
                        profilePic.src = URL.createObjectURL(inputfile.files[0]);
                    }
                </script>
             <script>
    document.addEventListener("DOMContentLoaded", function () {
        const togglePasswordIcons = document.querySelectorAll(".password-toggle-icon");
        togglePasswordIcons.forEach(function (icon) {
            icon.addEventListener("click", function () {
                const targetId = icon.getAttribute("data-target");
                const passwordField = document.getElementById(targetId);
                if (passwordField.type === "password") {
                    passwordField.type = "text";
                    icon.src = "${pageContext.request.contextPath}/eye-icons/eye-open.png"; 
                } else {
                    passwordField.type = "password";
                    icon.src = "${pageContext.request.contextPath}/eye-icons/eye-close.png";
                }
            });
        });
    });
</script>

</body>
</html>







                <script src="${pageContext.request.contextPath}/assets_User/js/jquery.min.js"></script>
                <script src="${pageContext.request.contextPath}/assets_User/vendors/bootstrap/js/popper.min.js"></script>
                <script src="${pageContext.request.contextPath}/assets_User/vendors/bootstrap/js/bootstrap.min.js"></script>
                <script src="${pageContext.request.contextPath}/assets_User/vendors/bootstrap-select/bootstrap-select.min.js"></script>
                <script src="${pageContext.request.contextPath}/assets_User/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
                <script src="${pageContext.request.contextPath}/assets_User/vendors/magnific-popup/magnific-popup.js"></script>
                <script src="${pageContext.request.contextPath}/assets_User/vendors/counter/waypoints-min.js"></script>
                <script src="${pageContext.request.contextPath}/assets_User/vendors/counter/counterup.min.js"></script>
                <script src="${pageContext.request.contextPath}/assets_User/vendors/imagesloaded/imagesloaded.js"></script>
                <script src="${pageContext.request.contextPath}/assets_User/vendors/masonry/masonry.js"></script>
                <script src="${pageContext.request.contextPath}/assets_User/vendors/masonry/filter.js"></script>
                <script src="${pageContext.request.contextPath}/assets_User/vendors/owl-carousel/owl.carousel.js"></script>
                <script src="${pageContext.request.contextPath}/assets_User/js/functions.js"></script>
                <script src="${pageContext.request.contextPath}/assets_User/js/contact.js"></script>
                <script src='${pageContext.request.contextPath}/assets_User/vendors/switcher/switcher.js'></script>
                </body>

                </html>

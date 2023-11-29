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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body onload="showToast('${txt}');" class="ttr-opened-sidebar ttr-pinned-sidebar">
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
                    <h4 class="breadcrumb-title">Users</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="users?action=list">Manage User</a></li>
                    </ul>
                </div>	

                <div id="snackbar" style="display: flex">
                    <i class="fa-solid fa-circle-check" style="font-size: 50px;float:left;margin-right: 10px;padding:10px 0 10px 0"></i>
                    <div>
                        <p style="text-align: left;margin-top: 20px">${txt}</p>
                    </div>
                </div>

                <div style="background-color: #CBFFDF; margin-bottom: 10px">
                    <p style="color: #6C6C6C; font-size: 18px; padding-left: 30px; font-family: initial; margin: 0; line-height: 60px">
                        <strong>${txt}</strong>
                    </p>
                </div>


                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Users List</h4>
                            </div>

                            <div style="width: 92%;margin: auto">
                                <div class="action-container" style="margin-top: 15px">
                                    <div class="search-box" style="width: 30%">
                                        <form action="users" method="get" class="row" style="line-height: 30px">
                                            <input type="text" name="action" style="display: none" value="searchUser"/>     
                                            <input type="text" name="searchQuery" class="col-md-9" placeholder="Search..."/>
                                            <input type="submit" style="display: none">
                                        </form>                                        
                                    </div> 

                                    <div class="action-container" style="margin-bottom: 17px">  
                                        <div class="row">
                                            <!-- Status Filter -->
                                            <form action="users" method="get" class="col-md-6">
                                                <input type="text" name="action" style="display: none" value="searchStatus"/>
                                                <div class="d-flex">
                                                    <c:set var="statusSaved" value="${statusSaved}" />
                                                    <select name="status" class="form-control" style="border-radius: 20px flex 1;">
                                                        <option value="-1" ${statusSaved == -1 ? 'selected' : ''}>Filter by Status</option>
                                                        <option value="1" ${statusSaved == 1 ? 'selected' : ''}>Active</option>
                                                        <option value="0" ${statusSaved == 0 ? 'selected' : ''}>Inactive</option>
                                                    </select>
                                                    <button style="background-color: #337ab7" type="submit" class="btn btn-primary ml-2">Find</button>
                                                </div>
                                            </form>

                                            <!-- Role Filter -->
                                            <form action="users" method="get" class="col-md-6">
                                                <input name="action" style="display: none" value="searchRole"/>
                                                <div class="d-flex">
                                                    <c:set var="roleSaved" value="${roleSaved}" />
                                                    <select name="role_id" class="form-control" style="border-radius: 20px flex 1;">
                                                        <option value="-1" ${roleSaved == -1 ? 'selected' : ''}>Filter by Role</option>
                                                        <option value="1" ${roleSaved == 1 ? 'selected' : ''}>Admin</option>
                                                        <option value="2" ${roleSaved == 2 ? 'selected' : ''}>Subject Manager</option>
                                                        <option value="3" ${roleSaved == 3 ? 'selected' : ''}>Trainer</option>
                                                        <option value="4" ${roleSaved == 4 ? 'selected' : ''}>Trainee</option>
                                                    </select>
                                                    <button style="background-color: #337ab7" type="submit" class="btn btn-primary ml-2">Find</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>



                                    <div class="adbutton" style="padding: 0;margin-left: auto">
                                        <div>
                                            <button class="button" onclick="noCheck()"><i class="fas fa-trash" style="margin-right: 5px"></i>Delete</button>
                                            <button class="button" onclick="window.location.href = 'users?action=addScreen';"><i class="fas fa-plus" style="margin-right: 5px"></i>New User</button>                                           
                                        </div>
                                    </div>
                                </div>

                                <form class="mobile-action" action="searchUser" method="get" style="line-height: 30px">
                                    <input type="text" name="searchName" placeholder="Search..." style="width: 100%;margin-bottom: 2px"/>                                   
                                </form>
                                <button class="button mobile-action" onclick="noCheck()" style="width: 100%;margin-bottom: 2px">Delete</button>
                                <button class="button mobile-action" onclick="window.location.href = 'users?action=addScreen';"style="width: 100%"><i class="fas fa-plus"></i>New User</button>                                           

                                <div class="table-container">
                                    <table id="user-table" style="max-width: 100%;margin-top: 5px;font-size: 15px">
                                        <thead>
                                            <tr class="row">
                                                <th class="col-md-1" style="text-align: center;padding: 10px"><span>ID</span></i></th>
                                                <th class="col-md-2" style="text-align: center;padding: 10px"><span>Name</span></th>
                                                <th class="col-md-2" style="text-align: center;padding: 10px"><span>Email</span></th>
                                                <th class="col-md-2" style="text-align: center;padding: 10px"><span>Phone Number</span></th>
                                                <th class="col-md-2" style="text-align: center;padding: 10px"><span>Role&nbsp;</span></th>
                                                <th class="col-md-1" id="status-header" style="text-align: center;padding: 10px"><span>Status&nbsp;<i class="fas fa-sort" id="status-sort-icon"></i></span></th>
                                                <th class="col-md-2" style="text-align: center;padding: 10px"><span>Action</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <form action="users" id="deleteUser" method="get">
                                            <input name="action" value="delete" style="display: none"/>
                                            <c:forEach items="${requestScope.list}" var="i">
                                                <tr class="row" style="line-height: 30px">
                                                    <td class="col-md-1" style="text-align: center;padding: 10px"><input type="checkbox" name="select" value="${i.id}"/>
                                                        <b>${i.id}</b>
                                                    </td>
                                                    <td class="col-md-2" style="text-align: center;padding: 10px">${i.fullname}</td>
                                                    <td class="col-md-2" style="text-align: center;padding: 10px">${i.email}</td>
                                                    <td class="col-md-2" style="text-align: center;padding: 10px">${i.phone_number}</td>
                                                    <td class="col-md-2" style="text-align: center;padding: 10px">
                                                        <c:choose>
                                                            <c:when test="${i.role.setting_value eq 'Admin' }">
                                                                Admin
                                                            </c:when>
                                                            <c:when test="${i.role.setting_value eq 'Subject Manager'}">
                                                                Subject Manager
                                                            </c:when>
                                                            <c:when test="${i.role.setting_value eq 'Trainer'}">
                                                                Trainer
                                                            </c:when>
                                                            <c:when test="${i.role.setting_value eq 'Trainee'}">
                                                                Trainee
                                                            </c:when>
                                                            <c:otherwise>
                                                                Unknown Role
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>

                                                    <td class="col-md-1 status-cell" style="text-align: center; padding: 10px" >
                                                        <span  id="status_${i.id}" class="${i.status eq false ? 'text-danger':'text-success'}">
                                                            ${i.status eq false ? 'Inactive': 'Active'}
                                                        </span>
                                                    </td>

                                                    <td class="col-md-2 bot-row" style="text-align: center;padding: 10px">   
                                                <li class="list-inline-item">
                                                    <a style="color: #002752" href="users?action=detailUser&sid=${i.id}" class="text-info" data-toggle="tooltip" title="View Detail">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                </li>

                                                <li class="list-inline-item">
                                                    <a href="#" style="color: green" onclick="confirmStatus(${i.id})" title="Activate">
                                                        <i class="far fa-circle-check"></i>
                                                    </a>
                                                </li>

                                                <li class="list-inline-item">
                                                    <a href="#" style="color: red" onclick="rejectStatus(${i.id})" title="Deactivate">
                                                        <i class="fas fa-ban"></i>
                                                    </a>
                                                </li>
                                                </td>
                                                </tr>
                                            </c:forEach>
                                        </form>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div style="text-align: center;padding-bottom: 20px">
                                <c:set var="page" value="${page}"/>
                                <div class="paging">
                                    <a href="<%=request.getContextPath()%>/users?action=list&page=${1}">&laquo;</a>
                                    <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                        <a class="${i==page?"active":""}" onclick="noCheckSwitchPage('${i}', '${page}')">${i}</a>                                       
                                    </c:forEach>
                                    <a href="<%=request.getContextPath()%>/users?action=list&page=${maxPage}">&raquo;</a>
                                </div>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
            <!-- Your Profile Views Chart END-->
        </main>
        <div class="ttr-overlay"></div>
        <style>
            @media (max-width:768px){
                table{
                    text-align: center;
                }
                th{
                    display: none;
                }
                .bot-row{
                    margin-bottom: 20px;
                }
                .action-container{
                    display: none;
                }
                .mobile-action{
                    display: block;
                }
            }
            @media (min-width:768px){
                .action-container{
                    display: flex;
                }
                .mobile-action{
                    display: none;
                }
            }

            td,th{
                border: 1px solid gray;
                word-break: break-word;
            }
            .paging{
                display: inline-block;
            }
            .paging a{
                color: black;
                font-size: 14px;
                padding: 9px 14px;
                text-decoration: none;
                border: 1px solid #DBDBDB;
            }
            .paging a.active{
                background-color: #337ab7;
                color: white;
            }
            .paging a:hover{
                cursor: pointer;
            }
            .paging a:hover:not(.active){
                cursor: pointer;
                background-color: #EFEFEF;
                color: #337ab7
            }
            .button{
                line-height: 30px;
                border: none;
                padding: 3px 15px;
                border-radius: 3px;
                background-color: #337ab7;
                color: white;
            }
            .button:hover{
                opacity: 0.7;
            }

            #snackbar {
                visibility: hidden;
                min-width: 280px;
                margin-left: -125px;
                background-color: #7BF470;
                color: white;
                text-align: center;
                border-radius: 2px;
                padding: 10px 16px 10px 16px;
                position: fixed;
                z-index: 3;
                right: 30px;
                font-size: 20px;
                font-weight: 400;
            }

            #snackbar.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

            @-webkit-keyframes fadein {
                from {
                    right: 0;
                    opacity: 0;
                }
                to {
                    right: 30px;
                    opacity: 1;
                }
            }

            @keyframes fadein {
                from {
                    right: 0;
                    opacity: 0;
                }
                to {
                    right: 30px;
                    opacity: 1;
                }
            }

            @-webkit-keyframes fadeout {
                from {
                    right: 30px;
                    opacity: 1;
                }
                to {
                    right: 0;
                    opacity: 0;
                }
            }

            @keyframes fadeout {
                from {
                    right: 30px;
                    opacity: 1;
                }
                to {
                    right: 0;
                    opacity: 0;
                }
            }

        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
                                            function showToast(txt) {
                                                if (txt !== "") {
                                                    var x = document.getElementById("snackbar");
                                                    x.className = "show";
                                                    setTimeout(function () {
                                                        x.className = x.className.replace("show", "");
                                                    }, 3000);
                                                }
                                            }
                                            ;
                                            function handleSelect(elm)
                                            {
                                                window.location = elm.value;
                                            }
        </script>


        <script>
            function showToast(message, type) {
                toastr[type](message); // Use toastr to display the notification
            }
            // Sorting status
            $(document).ready(function () {
                let ascending = true;

                $("#status-sort-icon").click(function () {
                    ascending = !ascending;

                    // Update the sorting icon
                    $("#status-sort-icon").removeClass("fas fa-sort");
                    if (ascending) {
                        $("#status-sort-icon").addClass("fas fa-sort-up");
                    } else {
                        $("#status-sort-icon").addClass("fas fa-sort-down");
                    }
                    // Call the sorting function for the data rows only
                    sortTableByStatus(ascending);
                });
            });

            function sortTableByStatus(ascending) {
                var table = $("#user-table tbody"); // Select tbody for data rows only
                var rows = table.find("tr").get(); // Get data rows

                rows.sort(function (a, b) {
                    // Extract "Active" or "Inactive" from the status cells
                    var statusA = $(a).find(".text-success").length > 0 ? "Active" : "Inactive";
                    var statusB = $(b).find(".text-success").length > 0 ? "Active" : "Inactive";
                    // Compare the status values based on sorting direction
                    if (ascending) {
                        if (statusA < statusB)
                            return -1;
                        if (statusA > statusB)
                            return 1;
                    } else {
                        if (statusA > statusB)
                            return -1;
                        if (statusA < statusB)
                            return 1;
                    }
                    return 0;
                });
                // Reorder the data rows in the tbody
                $.each(rows, function (index, row) {
                    table.append(row);
                });
            }



            function noCheck() {
                if (document.querySelectorAll('input[type="checkbox"]:checked').length === 0) {
                    alert("You have not chosen any user!");
                } else {
                    var option = confirm("Confirm user deletion?");
                    if (option === true) {
                        document.getElementById("deleteUser").submit();
                    }
                }
            }

            function noCheckSwitchPage(curentPage, nextPage) {
                if (document.querySelectorAll('input[type="checkbox"]:checked').length !== 0) {
                    if (curentPage !== nextPage) {
                        var option = confirm("Your choices will be discarded if you switch sites. Do you want to switch pages?");
                        if (option === true) {
                            window.location.href = 'users?action=list&page=' + curentPage;
                        }
                    }
                } else {
                    window.location.href = 'users?action=list&page=' + curentPage;
                }
            }

            function confirmStatus(id) {
                $.ajax({
                    url: "users?action=updateUserStatus",
                    type: 'GET',
                    data: {id: id, status: 1},
                    success: function (response) {
                        console.log("Status updated successfully.");
                        var statusElement = $("#status_" + id);
                        statusElement.text("Active");
                        statusElement.removeClass("text-danger").addClass("text-success");
                        showToast("Activate user successfully!", "success");
                    },
                    error: function (xhr, status, error) {
                        console.error("Error updating status: ", error);
                        showToast("Error updating status", "error");
                    }
                });
            }

            function rejectStatus(id) {
                $.ajax({
                    url: "users?action=updateUserStatus",
                    type: 'GET',
                    data: {id: id, status: 0},
                    success: function (response) {
                        console.log("Status updated successfully.");
                        var statusElement = $("#status_" + id);
                        statusElement.text("Inactive");
                        statusElement.removeClass("text-success").addClass("text-danger");
                        showToast("Deactivate user successfully! ", "error");
                    },
                    error: function (xhr, status, error) {
                        console.error("Error updating status: ", error);
                        showToast("Error updating status", "error");
                    }
                });
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
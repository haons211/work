
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <title>Update Employee</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/employeecss.css">
    </head>

    <body>

        <div class="main-wrapper">
            <div class="header">
                <div class="header-left">
                    <a href="dashboard" class="logo">
                        <img src="assets/img/pngtree-hacker-logo-png-image_6408677.png" width="40" height="40" alt=""/> <span>BeztTech</span>
                    </a>
                </div>
                <a id="toggle_btn" href="javascript:void(0);"><i class="fa fa-bars"></i></a>
                <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
                <ul class="nav user-menu float-right">
                    <li class="nav-item dropdown d-none d-sm-block">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"><i class="fa fa-bell-o"></i> <span class="badge badge-pill bg-danger float-right">3</span></a>
                        <div class="dropdown-menu notifications">
                            <div class="topnav-dropdown-header">
                                <span>Notifications</span>
                            </div>
                            <div class="drop-scroll">
                                <ul class="notification-list">
                                    <li class="notification-message">
                                        <a href="activities.html">
                                            <div class="media">
                                                <span class="avatar">
                                                    <img alt="John Doe" src="assets/img/user.jpg" class="img-fluid rounded-circle">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">John Doe</span> added new task <span class="noti-title">Patient appointment booking</span></p>
                                                    <p class="noti-time"><span class="notification-time">4 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="activities.html">
                                            <div class="media">
                                                <span class="avatar">V</span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Tarah Shropshire</span> changed the task name <span class="noti-title">Appointment booking with payment gateway</span></p>
                                                    <p class="noti-time"><span class="notification-time">6 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="activities.html">
                                            <div class="media">
                                                <span class="avatar">L</span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Misty Tison</span> added <span class="noti-title">Domenic Houston</span> and <span class="noti-title">Claire Mapes</span> to project <span class="noti-title">Doctor available module</span></p>
                                                    <p class="noti-time"><span class="notification-time">8 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="activities.html">
                                            <div class="media">
                                                <span class="avatar">G</span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Rolland Webber</span> completed task <span class="noti-title">Patient and Doctor video conferencing</span></p>
                                                    <p class="noti-time"><span class="notification-time">12 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="activities.html">
                                            <div class="media">
                                                <span class="avatar">V</span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Bernardo Galaviz</span> added new task <span class="noti-title">Private chat module</span></p>
                                                    <p class="noti-time"><span class="notification-time">2 days ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="topnav-dropdown-footer">
                                <a href="activities.html">View all Notifications</a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item dropdown d-none d-sm-block">
                        <a href="javascript:void(0);" id="open_msg_box" class="hasnotifications nav-link"><i class="fa fa-comment-o"></i> <span class="badge badge-pill bg-danger float-right">8</span></a>
                    </li>
                    <li class="nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                            <span class="user-img"><img class="rounded-circle" src="assets/img/user.jpg" width="40" alt="Admin">
                                <span class="status online"></span></span>
                            <span>${sessionScope.employee.name}</span>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="profile">My Profile</a>
                            <a class="dropdown-item" href="edit-profile.html">Edit Profile</a>
                            <a class="dropdown-item" href="settings.html">Settings</a>
                            <a class="dropdown-item" href="Logout">Logout</a>
                        </div>
                    </li>
                </ul>
                <div class="dropdown mobile-user-menu float-right">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="profile">My Profile</a>
                        <a class="dropdown-item" href="edit-profile.html">Edit Profile</a>
                        <a class="dropdown-item" href="settings.html">Settings</a>
                        <a class="dropdown-item" href="Logout">Logout</a>
                    </div>
                </div>
            </div>
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="menu-title">Main</li>
                            <li>
                                <a href="dashboard"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a>
                            </li>
                            <li>
                                <a href="account"><i class="fa fa-users"></i> <span>Accounts</span></a>
                            </li>
                            <li>
                                <a href="employee"><i class="fa fa-id-card"></i> <span>Employees</span></a>
                            </li>
                            <li> 
                                <a href="department"><i class="fa fa-hospital-o"></i> <span>Departments</span></a>
                            </li>    
                            <li>
                                <a href="#"><i class="fa fa-flag-o"></i> <span>Attendance Report</span> </a>
                            </li>
                            <li> 
                                <a href="sendapplication"><i class="fa fa-paper-plane-o"></i> <span>Send Application</span> </a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-cog"></i> <span>Settings</span></a>
                            </li>    
                        </ul>
                    </div>
                </div>
            </div>
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-5 col-5">
                            <h4 class="page-title">Update Employee</h4>
                        </div>
                        <div class="col-sm-7 col-7 text-right m-b-30">

                        </div>

                        <div class="main">
                            <a href="employee">
                                <button type="button" class="btn btn-secondary" style="margin: 10px 0 ;">Back</button>
                            </a>
                            <c:set var="id" value="${requestScope.id}" />
                            <form action="update-employee" method="post" >
                                <input type="hidden" name="id" value="${id}"/>
                                <div class="main-text-table">
                                    <table>
                                        <tr>
                                            <td >
                                                Employee Name
                                            </td>
                                            <td>

                                                <div class = "left-input-table" >
                                                    <div class="input-group input-group-sm mb-3" >
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm" ></span>
                                                        </div>
                                                        <input type="text" class="form-control" aria-label="Small"
                                                               aria-describedby="inputGroup-sizing-sm" name="name" value="${employee.name}" style="width: 300px;">
                                                    </div>
                                                    <div style="color: red">
                                                        ${requestScope.messageErrorName}
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div  class = "right-text-table" >
                                                    Employee Image
                                                </div>

                                            </td>
                                            <td>

                                                <div class ="right-input-table" style= "width: 250px" >
                                                    <input type="file" 
                                                           name="image" class="btn btn-outline-secondary" accept=".jpg, .png"
                                                           style="margin:  0 30px; ">


                                                </div>

                                            </td>
                                        </tr>

                                        <tr >
                                            <td>Phone Number</td>
                                            <td>
                                                <div class = "left-input-table"  >
                                                    <div class="input-group input-group-sm mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm" ></span>
                                                        </div>
                                                        <input type="text" class="form-control" aria-label="Small"
                                                               aria-describedby="inputGroup-sizing-sm" value="${employee.phoneNumber}"  name="phoneNumber"  >
                                                    </div>
                                                    <div style="color: red">
                                                        ${requestScope.messageErrorPhoneNumber}
                                                    </div>

                                                </div>
                                            <td>
                                                <div class = "right-text-table">
                                                    Address
                                                </div>
                                            </td>
                                            <td>
                                                <div class ="right-input-table" style="margin-left: 40px">


                                                    <div class="input-group input-group-sm mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm" ></span>
                                                        </div>
                                                        <input type="text" class="form-control" aria-label="Small"
                                                               aria-describedby="inputGroup-sizing-sm" name="address" value="${employee.address}" style="width: 312px;">
                                                    </div>
                                                    <div style="color: red">
                                                        ${requestScope.messageErrorAddress}
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr  >
                                            <td>Email</td>
                                            <td>
                                                <div class = "left-input-table">
                                                    <div class="input-group input-group-sm mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm" ></span>
                                                        </div>
                                                        <input type="text" class="form-control" aria-label="Small"
                                                               aria-describedby="inputGroup-sizing-sm" name="email" value="${employee.email}" style="width: 300px;">
                                                    </div>
                                                </div>
                                            </td>
                                            <td> 
                                                <div class="right-text-table" >
                                                    Gender
                                                </div>
                                            </td>
                                            <td>
                                                <c:if test="${employee.gender eq 'false'}" >


                                                    <div class = "right-input-table" style="margin-left: 60px" >
                                                        <input class="form-check-input" type="radio" name="gender"
                                                               id="flexRadioDefault1" value = "male" checked >

                                                        <label class="form-check-label" for="flexRadioDefault1">
                                                            Male
                                                        </label>

                                                        <input class="form-check-input" type="radio" name="gender"
                                                               id="flexRadioDefault1" value = "female"style="margin-left: 20px"  >

                                                        <label class="form-check-label" for="flexRadioDefault1" style="margin-left: 40px">
                                                            Female
                                                        </label>
                                                    </div>
                                                </c:if>
                                                <c:if test="${employee.gender eq 'true'}" >
                                                    <div class = "right-input-table" style="margin-left: 60px" >
                                                        <input class="form-check-input" type="radio" name="gender"
                                                               id="flexRadioDefault1" value = "male" >

                                                        <label class="form-check-label" for="flexRadioDefault1">
                                                            Male
                                                        </label>

                                                        <input class="form-check-input" type="radio" name="gender"
                                                               id="flexRadioDefault1" value = "female" checked style="margin-left: 20px"  >

                                                        <label class="form-check-label" for="flexRadioDefault1" style="margin-left: 40px">
                                                            Female
                                                        </label>
                                                    </div>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Birth Date</td>
                                            <td>
                                                <div class = "left-input-table">
                                                    <div class="input-group input-group-sm mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm"></span>
                                                        </div>
                                                        <input type="date" class="form-control" aria-label="Small"
                                                               aria-describedby="inputGroup-sizing-sm" name="birthDate" value="${employee.birthDate}" style="width: 300px;">
                                                    </div>
                                                    <div style="color: red">
                                                        ${requestScope.messageErrorBirthDate}
                                                    </div>
                                                    <div style="color: red">
                                                        ${requestScope.messageErrorBirthday}
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="right-text-table">
                                                    Hire Date        
                                                </div>
                                            </td>
                                            <td>
                                                <div class = "right-input-table" style="margin-left: 40px" >
                                                    <div class="input-group input-group-sm mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm" ></span>
                                                        </div>
                                                        <input type="date" class="form-control" aria-label="Small"
                                                               aria-describedby="inputGroup-sizing-sm" name="hireDate" value="${employee.hireDate}" style="width: 300px;">
                                                    </div>
                                                    <div style="color: red">
                                                        ${requestScope.messageErrorHireDate}
                                                    </div>
                                                     <div style="color: red">
                                                        ${requestScope.messageErrorDate}
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="add-to-system">
                                        <button type="submit" class="btn btn-success" style="margin-top: 30px" >Add to
                                            system</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <div class="sidebar-overlay" data-reff=""></div>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/app.js"></script>

    </body>

</html>


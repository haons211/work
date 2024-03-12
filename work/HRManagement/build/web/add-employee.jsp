
<%@ page import="models.AccountDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <title>Add Employee</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/employeecss.css">
    </head>

    <body>
        
           <%
                     AccountDTO acc = (AccountDTO) session.getAttribute("account");
                     int role=     acc.getRole();
        %>

        <c:set var="em" value="${requestScope.emp}" />
        <div class="main-wrapper">
            <% if (role == 2) { %>
            <jsp:include page="SideBarforEm.jsp" />
            <% } else if (role == 3||role==1) { %>
            <jsp:include page="SideBarforManager.jsp" />
            <% } %>
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-5 col-5"     >
                            <h4 class="page-title" >Add Employee</h4>
                        </div>

                        <div class="main">
                            <a href="employee">
                                <button type="button" class="btn btn-secondary" style="margin: 10px 0 ;">Back</button>
                            </a>

                            <form action="add-employee" method="post">
                                <div class="main-text-table">
                                    <table>

                                        <tr >
                                            <td >
                                                Employee Name
                                            </td>
                                            <td>
                                                <div class = "left-input-table" >
                                                    <div class="input-group input-group-sm mb-3" >
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm"></span>
                                                        </div>
                                                        <input type="text" class="form-control" aria-label="Small"  placeholder="Employee Name"
                                                               aria-describedby="inputGroup-sizing-sm" name="name" value="${name}" style="width: 300px;">
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
                                                    <input type="file" id="fileInput"   
                                                           accept="image/*" class="btn btn-outline-secondary"
                                                           style="margin:  0 30px; "  name="image" placeholder="Employee Image" >

                                                </div>
                                            </td>
                                        </tr>

                                        <tr >
                                            <td>Phone Number</td>
                                            <td>
                                                <div class = "left-input-table"  >
                                                    <div class="input-group input-group-sm mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm"></span>
                                                        </div>
                                                        <input type="text" class="form-control" aria-label="Small"
                                                               value="${phoneNumber}"   aria-describedby="inputGroup-sizing-sm" name="phoneNumber" placeholder="Employee Phone Number"  >
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
                                                            <span class="input-group-text" id="inputGroup-sizing-sm"></span>
                                                        </div>
                                                        <input type="text" class="form-control" aria-label="Small" value="${address}"
                                                               aria-describedby="inputGroup-sizing-sm" name="address" placeholder="Employee Address" style="width: 312px;">
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
                                                            <span class="input-group-text" id="inputGroup-sizing-sm"></span>
                                                        </div>
                                                        <input type="text" class="form-control" aria-label="Small" value="${email}"
                                                               aria-describedby="inputGroup-sizing-sm" name="email" placeholder="Employee Email" style="width: 300px;">
                                                    </div>

                                                </div>
                                            </td>
                                            <td> 
                                                <div class="right-text-table" >
                                                    Gender
                                                </div>
                                            </td>
                                            <td>

                                                <c:if test="${gender != null}" >
                                                    <div class = "right-input-table" style="margin-left: 60px" >
                                                        <c:if test="${gender eq 'male'}" >
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
                                                        </c:if>
                                                    </div>
                                                    <div class = "right-input-table" style="margin-left: 60px" >
                                                        <c:if test="${gender eq 'female'}" >
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
                                                        </c:if>
                                                    </div>
                                                </c:if>

                                                <c:if test="${gender == null}" >
                                                    <div class = "right-input-table" style="margin-left: 60px" >
                                                        <input class="form-check-input" type="radio" name="gender"
                                                               id="flexRadioDefault1" value = "male"  >

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
                                                
                                                <div style="color: red; margin-left: 40px" >
                                                    ${requestScope.messageErrorGender}
                                                </div>

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
                                                        <input type="date" class="form-control" aria-label="Small" value="${birthDate}"
                                                               aria-describedby="inputGroup-sizing-sm" name="birthDate" placeholder="Employee Birth Date" style="width: 300px;">
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
                                                            <span class="input-group-text" id="inputGroup-sizing-sm"></span>
                                                        </div>
                                                        <input type="date" class="form-control" aria-label="Small" value="${hireDate}"
                                                               aria-describedby="inputGroup-sizing-sm" name="hireDate" placeholder="Employee Hire Date"  style="width: 300px;">
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
                <div class="notification-box">
                    <div class="msg-sidebar notifications msg-noti">
                        <div class="topnav-dropdown-header">
                            <span>Messages</span>
                        </div>
                        <div class="drop-scroll msg-list-scroll" id="msg_list">
                            <ul class="list-box">
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">R</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Richard Miles </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item new-message">
                                            <div class="list-left">
                                                <span class="avatar">J</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">John Doe</span>
                                                <span class="message-time">1 Aug</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">T</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Tarah Shropshire </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">M</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Mike Litorus</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">C</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Catherine Manseau </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">D</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Domenic Houston </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">B</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Buster Wigton </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">R</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Rolland Webber </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">C</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Claire Mapes </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">M</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Melita Faucher</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">J</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Jeffery Lalor</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">L</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Loren Gatlin</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">T</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Tarah Shropshire</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="topnav-dropdown-footer">
                            <a href="chat.html">See all messages</a>
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

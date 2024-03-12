<%-- 
    Document   : AttendanceReport
    Created on : Feb 17, 2024, 12:07:15 AM
    Author     : ThuyVy
--%>

<%@ page import="models.AccountDTO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <title>Attendance Report</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <style>
            /* Thiết lập độ rộng tối thiểu cho cột Name */
            th:nth-child(2),
            td:nth-child(2) {
                min-width: 150px; /* Điều chỉnh độ rộng tối thiểu của cột */
            }

            /* Thiết lập độ rộng tối thiểu cho cột Department */
            th:nth-child(3),
            td:nth-child(3) {
                min-width: 100px; /* Điều chỉnh độ rộng tối thiểu của cột */
            }

            /* Thiết lập độ rộng tối thiểu cho cột Date */
            th:nth-child(4),
            td:nth-child(4) {
                min-width: 120px; /* Điều chỉnh độ rộng tối thiểu của cột */
            }

            /* Thiết lập độ rộng tối thiểu cho cột Status */
            th:nth-child(5),
            td:nth-child(5) {
                min-width: 50px; /* Điều chỉnh độ rộng tối thiểu của cột */
            }

            /* Thiết lập độ rộng tối thiểu cho cột Message */
            th:nth-child(6),
            td:nth-child(6) {
                min-width: 200px; /* Điều chỉnh độ rộng tối thiểu của cột */
            }

            /* Thiết lập độ rộng tối thiểu cho cột Check In */
            th:nth-child(7), td:nth-child(7),
            th:nth-child(8), td:nth-child(8) ,
            th:nth-child(9), td:nth-child(9) ,
            th:nth-child(10), td:nth-child(10)  {
                min-width: 50px; /* Điều chỉnh độ rộng tối thiểu của cột */
            }

        </style>
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
                  <% } else if (role == 3||role == 1) { %>
            <jsp:include page="SideBarforManager.jsp" />
            <% } %>
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-5 col-5">
                            <h4 class="page-title">Attendance Report</h4>
                        </div>
                    </div>
                    <div class="main-option">
                        <div class="main-option-search">
                            <nav class="navbar navbar-light bg-light justify-content-between">
                                <form action="AttendanceReport" method="get" class="form-inline">
                                    <input class="form-control mr-sm-2" name="search" type="text" placeholder="Search" aria-label="Search" style="height: 30px;">
                                    <label class="focus-label">Department:</label>
                                    <select class="form-control mr-sm-2" name="departmentName">
                                        <option value="">Select Department</option>
                                        <c:forEach var="dep" items="${listDep}">
                                            <option value="${dep.name}">${dep.name}</option>
                                        </c:forEach>
                                    </select>
                                    <!--                                    <label>From:</label>
                                                                        <input type="date" name="fromDate" class="form-control mr-sm-2" style="height: 30px;">
                                                                        <label>To:</label>
                                                                        <input type="date" name="toDate" class="form-control mr-sm-2" style="height: 30px;">
                                                                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit" >Search</button>-->
                                    <label>From:</label>
                                    <input id="fromDate" type="date" name="fromDate" class="form-control mr-sm-2" style="height: 30px;">
                                    <label>To:</label>
                                    <input type="date" name="toDate" class="form-control mr-sm-2" style="height: 30px;">
                                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                                </form>
                            </nav>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive" style="overflow-x: auto;">
                                <table class="table table-striped custom-table mb-0 datatable">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Department</th>
                                            <th>Date</th>
                                            <th>Status</th>
                                            <th>Message</th>
                                            <th>Check In</th>
                                            <th>In Status</th>
                                            <th>Check Out</th>
                                            <th>Out Status</th>
                                            <th>Remain Day</th>
                                            <th class="text-right">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="o" items="${requestScope.list}">
                                            <tr class="table_row">
                                                <td class="column-1">${o.attendance_id}</td>    
                                                <td class="column-2">${o.em_name}</td>
                                                <td class="column-2">${o.dep_name}</td>
                                                <td>${o.date}</td>
                                                <td>${o.status}</td>
                                                <td>${o.notes}</td>
                                                <td>${o.in_time}</td>
                                                <td>${o.in_status}</td>
                                                <td>${o.out_time}</td>
                                                <td>${o.out_status}</td>
                                                <td>${o.remainDay}</td>
                                                <td class="text-right">
                                                    <div class="dropdown dropdown-action">
                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">

                                                            <a class="dropdown-item" href="editAttendance?id=${o.attendance_id}"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                            <a class="dropdown-item" href="deleteAttendance?id=${o.attendance_id}" data-toggle="modal" data-target="#delete_attendance"  onclick="doDelete('${o.attendance_id}')"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
    <script type="text/javascript">
                                                                function doDelete(id) {
                                                                    if (confirm("Are you sure to delete Attendance_ID = " + id)) {
                                                                        window.location = "deleteAttendance?id=" + id;
                                                                    }
                                                                }
    </script>
    <script>
    // Get today's date in the format YYYY-MM-DD
    function getCurrentDate() {
        let now = new Date();
        let year = now.getFullYear();
        let month = String(now.getMonth() + 1).padStart(2, '0');
        let day = String(now.getDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
    }

    // Set the default value of the "From" input field to today's date
    document.getElementById('fromDate').value = getCurrentDate();
</script>
</body>

</html>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="models.AccountDTO" %>
<%@ page import="models.Employee" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <title>Preclinic - Medical & Hospital - Bootstrap 4 Admin Template</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <!--[if lt IE 9]>
                    <script src="assets/js/html5shiv.min.js"></script>
                    <script src="assets/js/respond.min.js"></script>
            <![endif]-->
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
                        <div class="col-sm-7 col-6">
                            <h4 class="page-title">My Profile</h4>
                        </div>

                        <div class="col-sm-5 col-6 text-right m-b-30">
                            <form action="UpdateInformation" method="post">
                                <%
                                  int accid = acc.getUserID();// Lấy giá trị accid từ dữ liệu đăng nhập, chẳng hạn từ database
                                %>
                                <input type="hidden" name="idse" value="<%= accid %>">
                                <input class="btn btn-primary" type="submit" value="Edit profile" name="btAction"></form>
                            </a>
                        </div>
                    </div>
                    <div class="card-box profile-header">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="profile-view">
                                    <div class="profile-img-wrap">
                                        <div class="profile-img">
                                            <a href="#"><img class="avatar" src="assets/img/doctor-03.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="profile-basic">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="profile-info-left">
                                                    <h3 class="user-name m-t-0 mb-0">${em.name}</h3>
                                                    <small class="text-muted">Employee </small>
                                                    <div class="staff-id">Employee ID :${em.employeeId}</div>
                                                    <div class="staff-msg"><a href="chat.html" class="btn btn-primary">Send Message</a></div>
                                                </div>
                                            </div>
                                            <div class="col-md-7">
                                                <ul class="personal-info">
                                                    <li>
                                                        <span class="title">Phone:</span>
                                                        <span class="text"> ${em.phoneNumber}</span>
                                                    </li>
                                                    <li>
                                                        <span class="title">Email:</span>
                                                        <span class="text"> ${em.email}</span>
                                                    </li>
                                                    <li>
                                                        <span class="title">Birthday:</span>
                                                        <span class="text">${em.birthDate}</span>
                                                    </li>
                                                    <li>
                                                        <span class="title">Address:</span>
                                                        <span class="text">${em.address}</span>
                                                    </li>
                                                    <li>
                                                        <span class="title">Gender:</span>
                                                        <c:choose>
                                                            <c:when test="${em.gender}">

 <span>Male</span> 
                                                            

                                                            </c:when>
                                                            <c:otherwise>
                                                                   <span>Female</span> 
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>                        
                            </div>
                        </div>

                    </div>
                    <div class="profile-tabs">
                        <ul class="nav nav-tabs nav-tabs-bottom">
                            <li class="nav-item"><a class="nav-link active" href="#about-cont" data-toggle="tab">About</a></li>
                            <li class="nav-item"><a class="nav-link" href="#bottom-tab2" data-toggle="tab">Profile</a></li>
                            <li class="nav-item"><a class="nav-link" href="#bottom-tab3" data-toggle="tab">Messages</a></li>
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane show active" id="about-cont">

                            </div>
                            <div class="tab-pane" id="bottom-tab2">
                                Tab content 2
                            </div>
                            <div class="tab-pane" id="bottom-tab3">
                                Tab content 3
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="sidebar-overlay" data-reff=""></div>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/app.js"></script>
    </body>


</html>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.AccountDTO" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <title>Preclinic - Medical & Hospital - Bootstrap 4 Admin Template</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
            <% } else if (role == 3|| role == 1) { %>
            <jsp:include page="BarMessageForAdmin.jsp" />
            <% } %>
            <div class="main-wrapper">        
                <div class="sidebar" id="sidebar">
                    <div class="sidebar-inner slimscroll">
                        <div class="sidebar-menu">
                            <ul>
                                <li>
                                    <a href="index.html"><i class="fa fa-home back-icon"></i> <span>Back to Home</span></a>
                                </li>
                                <li class="menu-title">Chat Groups <a href="#" class="add-user-icon" data-toggle="modal" data-target="#add_group" ><i class="fa fa-plus"></i></a></li>
                                        <c:forEach items="${requestScope.listallgroupchat}" var="lgc">
                                    <li>
                                        <a href="OpenChat?ConverId=${lgc.conversation_id}">${lgc.name}</a>
                                    </li>
                                </c:forEach>

                                <li class="menu-title">Direct Chats <a href="#" class="add-user-icon" data-toggle="modal" data-target="#add_chat_user"><i class="fa fa-plus"></i></a></li>
                                <li>
                                    <a href="chat.html"><span class="chat-avatar-sm user-img"><img src="assets/img/user.jpg" alt="" class="rounded-circle"><span class="status online"></span></span> John Doe <span class="badge badge-pill bg-danger float-right">1</span></a>
                                </li>
                                <li>
                                    <a href="chat.html"><span class="chat-avatar-sm user-img"><img src="assets/img/user.jpg" alt="" class="rounded-circle"><span class="status offline"></span></span> Richard Miles <span class="badge badge-pill bg-danger float-right">18</span></a>
                                </li>
                                <li>
                                    <a href="chat.html"><span class="chat-avatar-sm user-img"><img src="assets/img/user.jpg" alt="" class="rounded-circle"><span class="status away"></span></span> John Smith</a>
                                </li>
                                <li class="active">
                                    <a href="chat.html"><span class="chat-avatar-sm user-img"><img src="assets/img/user.jpg" alt="" class="rounded-circle"><span class="status online"></span></span> Jennifer <span class="badge badge-pill bg-danger float-right">108</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="page-wrapper">
                    <div class="chat-main-row">
                        <div class="chat-main-wrapper">
                            <div class="col-lg-9 message-view chat-view">
                                <div class="chat-window">

                                    <div class="chat-contents">
                                        <div class="chat-content-wrap">
                                            <div class="chat-wrap-inner">
                                                <div class="chat-box">
                                                    <div class="chats">
                                                        <c:forEach items="${requestScope.listAllMessageinaConversation}" var="message">
                                                            <c:choose>
                                                                <c:when test="${message.sender_id eq currentId}">
                                                                    <div class="chat chat-right">
                                                                        <div class="chat-body">
                                                                            <div class="chat-bubble">
                                                                                <div class="chat-content">
                                                                                    <p>${message.content}</p>
                                                                                    <span class="chat-time">${message.formatTime}</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="chat chat-left">
                                                                        <div class="chat-avatar">
                                                                            <a href="profile.html" class="avatar">
                                                                                <img alt="Jennifer Robinson" src="assets/img/patient-thumb-02.jpg" class="img-fluid rounded-circle">
                                                                            </a>
                                                                        </div>
                                                                        <div class="chat-body">
                                                                            <div class="chat-bubble">
                                                                                <div class="chat-content">
                                                                                    <p>${message.content}</p>
                                                                                    <span class="chat-time">${message.formatTime}</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-footer"> 
                                        <div class="message-bar">
                                            <div class="message-inner">                                               
                                                <div class="message-area">
                                                    <form action="AddChat" method="post">
                                                        <div class="input-group">
                                                            <textarea class="form-control" placeholder="Type message..." name="content" required="" ></textarea>
                                                            <span class="input-group-append">
                                                                <button class="btn btn-primary" type="submit"><i class="fa fa-send"></i></button>
                                                            </span>
                                                        </div>
                                                        <input type="hidden" name="ConverId" value="${ConverId}">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
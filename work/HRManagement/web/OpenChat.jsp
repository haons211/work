<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.AccountDTO" %>
<%@ page import="dal.ApplicationDAO" %>
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
            ApplicationDAO ad= new ApplicationDAO();
                AccountDTO acc = (AccountDTO) session.getAttribute("account");
                int role=     acc.getRole();
                String sender_id= String.valueOf(ad.GetEmployeeIDbyUserID(acc));
                String sender_name=ad.getNamebyAccount(acc);
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
                                       
                                    <li>
                                        <a href="OpenChat">All</a>
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
                                    <div class="fixed-header">
                                        <div class="navbar">
                                            <div class="user-details mr-auto">
                                                <div class="float-left user-img m-r-10">
                                                    <a href="profile.html" title="Jennifer Robinson"><img src="assets/img/user.jpg" alt="" class="w-40 rounded-circle"><span class="status online"></span></a>
                                                </div>
                                                <div class="user-info float-left">
                                                    <a href="profile.html"><span class="font-bold">All</span> <i class="typing-text"></i></a>
                                                    
                                                </div>
                                            </div>
                                            <div class="search-box">
                                                <div class="input-group input-group-sm">
                                                    <input type="text" class="form-control" placeholder="Search">
                                                    <span class="input-group-append">
                                                        <button class="btn" type="button"><i class="fa fa-search"></i></button>
                                                    </span>
                                                </div>
                                            </div>
                                            <ul class="nav custom-menu">
                                                <li class="nav-item">
                                                    <a href="#chat_sidebar" class="nav-link task-chat profile-rightbar float-right" id="task_chat"><i class="fa fa-user"></i></a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="voice-call.html"><i class="fa fa-phone"></i></a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="video-call.html"><i class="fa fa-video-camera"></i></a>
                                                </li>
                                                <li class="nav-item dropdown dropdown-action">
                                                    <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-cog"></i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="javascript:void(0)">Delete Conversations</a>
                                                        <a class="dropdown-item" href="javascript:void(0)">Settings</a>
                                                        <a class="dropdown-item" data-toggle="modal" data-target="#add_people">Add People</a>
                                                        <a class="dropdown-item" href="javascript:void(0)">Delete People</a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="chat-contents">
                                        <div class="chat-content-wrap">
                                            <div class="chat-wrap-inner">
                                                <div class="chat-box">
                                                    <div class="chats">
                                                        
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-footer"> 
                                        <div class="message-bar">
                                            <div class="message-inner">                                               
                                                <div class="message-area">
                                                    <form>
                                                        <div class="input-group">
                                                            <textarea id="textMessage" class="form-control" placeholder="Type message..." name="content" required="" ></textarea>
                                                            
                                                            <input id="sender_id" type="hidden" value="<%= sender_id %>">
                                                            <input id="sender_name" type="hidden" value="<%= sender_name %>">
                                                            <span class="input-group-append">
                                                                <button id="sendMessage" class="btn btn-primary" type="submit" action="send()"><i class="fa fa-send"></i></button>
                                                            </span>
                                                        </div>
                                                    </form>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 message-view chat-profile-view chat-sidebar" id="chat_sidebar">
                                <div class="chat-window video-window">
                                    <div class="fixed-header">
                                        <ul class="nav nav-tabs nav-tabs-bottom">

                                            <li class="nav-item"><a class="nav-link active" href="#profile_tab" data-toggle="tab">Member</a></li>
                                        </ul>
                                    </div>
                                    <div class="tab-content chat-contents">
                                        <div class="content-full tab-pane" id="calls_tab">
                                            <div class="chat-wrap-inner">
                                                <div class="chat-box">
                                                    <div class="chats">
                                                        <div class="chat chat-left">
                                                            <div class="chat-avatar">
                                                                <a href="profile.html" class="avatar">
                                                                    <img alt="Cristina Groves" src="assets/img/doctor-thumb-03.jpg" class="img-fluid rounded-circle">
                                                                </a>
                                                            </div>
                                                            <div class="chat-body">
                                                                <div class="chat-bubble">
                                                                    <div class="chat-content">
                                                                        <span class="chat-user">You</span> <span class="chat-time">8:35 am</span>
                                                                        <div class="call-details">
                                                                            <i class="material-icons">phone_missed</i>
                                                                            <div class="call-info">
                                                                                <div class="call-user-details">
                                                                                    <span class="call-description">Jeffrey Warden missed the call</span>
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
                                        <div class="content-full tab-pane show active" id="profile_tab">
                                            <div class="chat-wrap-inner">
                                                <div class="chat-box">
                                                    <div class="chats">
                                                        <c:forEach items="${requestScope.listEmployeeFrom1Group}" var="listEmployeeFrom1Group">
                                                            <div class="chat chat-left">
                                                                <div class="chat-avatar">
                                                                    <a href="profile.html" class="avatar">
                                                                        <img alt="Cristina Groves" src="assets/img/user.jpg" class="img-fluid rounded-circle">
                                                                    </a>
                                                                </div>

                                                                <div class="chat-body">
                                                                    <div class="chat-bubble">
                                                                        <div class="chat-content">
                                                                            <span class="chat-user">${listEmployeeFrom1Group.name}</span> 

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>


                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="drag_files" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title">Drag and drop files upload</h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <form id="js-upload-form">
                                        <div class="upload-drop-zone" id="drop-zone">
                                            <i class="fa fa-cloud-upload fa-2x"></i> <span class="upload-text">Just drag and drop files here</span>
                                        </div>
                                        <h4>Uploading</h4>
                                        <ul class="upload-list">
                                            <li class="file-list">
                                                <div class="upload-wrap">
                                                    <div class="file-name">
                                                        <i class="fa fa-photo"></i> photo.png
                                                    </div>
                                                    <div class="file-size">1.07 gb</div>
                                                    <button type="button" class="file-close">
                                                        <i class="fa fa-close"></i>
                                                    </button>
                                                </div>
                                                <div class="progress progress-xs progress-striped">
                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 65%"></div>
                                                </div>
                                                <div class="upload-process">37% done</div>
                                            </li>
                                            <li class="file-list">
                                                <div class="upload-wrap">
                                                    <div class="file-name">
                                                        <i class="fa fa-file"></i> task.doc
                                                    </div>
                                                    <div class="file-size">5.8 kb</div>
                                                    <button type="button" class="file-close">
                                                        <i class="fa fa-close"></i>
                                                    </button>
                                                </div>
                                                <div class="progress progress-xs progress-striped">
                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 65%"></div>
                                                </div>
                                                <div class="upload-process">37% done</div>
                                            </li>
                                            <li class="file-list">
                                                <div class="upload-wrap">
                                                    <div class="file-name">
                                                        <i class="fa fa-photo"></i> dashboard.png
                                                    </div>
                                                    <div class="file-size">2.1 mb</div>
                                                    <button type="button" class="file-close">
                                                        <i class="fa fa-close"></i>
                                                    </button>
                                                </div>
                                                <div class="progress progress-xs progress-striped">
                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 65%"></div>
                                                </div>
                                                <div class="upload-process">Completed</div>
                                            </li>
                                        </ul>
                                    </form>
                                    <div class="m-t-30 text-center">
                                        <button class="btn btn-primary submit-btn">Add to upload</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="add_group" class="modal fade">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title">Create a group</h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <p>Groups are where your team communicates. They?re best when organized around a topic ? #leads, for example.</p>
                                    <form action="AddConversation">
                                        <div class="form-group">
                                            <label>Group Name <span class="text-danger">*</span></label>

                                            <input class="form-control" type="text" name="GroupName" required="">
                                            <input type="hidden" name="typeConversationID" value="1">
                                        </div>

                                        <div class="m-t-50 text-center">
                                            <button class="btn btn-primary submit-btn">Create Group</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="add_people" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title">Add People to Group Chat</h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">

                                    <form action="AddPeopletoGroup" method="post">
                                        <div>
                                            <h5>People</h5>
                                            <ul class="chat-user-list" style="overflow-y: auto; max-height: 300px;">
                                                <c:forEach items="${requestScope.listEmployeeChat}" var="listEmployeeChat">
                                                    <li>
                                                        <a href="#" class="user-item">
                                                            <div class="media">
                                                                <span class="avatar align-self-center">
                                                                    <img src="assets/img/user.jpg">
                                                                </span>
                                                                <div class="media-body text-nowrap align-self-center">
                                                                    <div class="user-name">${listEmployeeChat.name}</div>
                                                                    <span class="designation">${listEmployeeChat.departmentName}</span>
                                                                </div>
                                                                <div class="align-self-center text-nowrap">
                                                                    <div class="online-date">
                                                                        <input type="checkbox" name="selectedEmployees" value="${listEmployeeChat.employeeId}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <input type="hidden" name="ConverId" value="${ConverId}">
                                        <div class="m-t-50 text-center">
                                            <button class="btn btn-primary submit-btn">Add People</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="add_chat_user" class="modal fade " role="dialog">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title">Create Chat Group</h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <div class="input-group m-b-30">
                                        <input placeholder="Search to start a chat" class="form-control search-input" id="btn-input" type="text">
                                        <span class="input-group-append">
                                            <button class="btn btn-primary">Search</button>
                                        </span>
                                    </div>
                                    <div>
                                        <h5>Recent Conversations</h5>
                                        <ul class="chat-user-list">
                                            <li>
                                                <a href="#">
                                                    <div class="media">
                                                        <span class="avatar align-self-center">J</span>
                                                        <div class="media-body align-self-center text-nowrap">
                                                            <div class="user-name">Jeffery Lalor</div>
                                                            <span class="designation">Team Leader</span>
                                                        </div>
                                                        <div class="text-nowrap align-self-center">
                                                            <div class="online-date">1 day ago</div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="media ">
                                                        <span class="avatar align-self-center">B</span>
                                                        <div class="media-body align-self-center text-nowrap">
                                                            <div class="user-name">Bernardo Galaviz</div>
                                                            <span class="designation">Web Developer</span>
                                                        </div>
                                                        <div class="align-self-center text-nowrap">
                                                            <div class="online-date">3 days ago</div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="media">
                                                        <span class="avatar align-self-center">
                                                            <img src="assets/img/user.jpg" alt="John Doe">
                                                        </span>
                                                        <div class="media-body text-nowrap align-self-center">
                                                            <div class="user-name">John Doe</div>
                                                            <span class="designation">Web Designer</span>
                                                        </div>
                                                        <div class="align-self-center text-nowrap">
                                                            <div class="online-date">7 months ago</div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="m-t-50 text-center">
                                        <button class="btn btn-primary submit-btn">Create Group</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="share_files" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title">Share File</h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <div class="files-share-list">
                                        <div class="files-cont">
                                            <div class="file-type">
                                                <span class="files-icon"><i class="fa fa-file-pdf-o"></i></span>
                                            </div>
                                            <div class="files-info">
                                                <span class="file-name text-ellipsis">AHA Selfcare Mobile Application Test-Cases.xls</span>
                                                <span class="file-author"><a href="#">Bernardo Galaviz</a></span> <span class="file-date">May 31st at 6:53 PM</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Share With</label>
                                        <input class="form-control" type="text">
                                    </div>
                                    <div class="m-t-50 text-center">
                                        <button class="btn btn-primary submit-btn">Share</button>
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
            <script  type="text/javascript">
                        var ws= new WebSocket("ws://localhost:9999/HRManagement/chatEndpont");
                        ws.open= function (){
                            console.log('Web Socket connection established');
                        };
                        ws.onmessage=function(event){
                            showMessage(event.data, false);
                        };
                        ws.onclose=function (){
                            console.log('WebSocket connection closed');
                        };
                        ws.onerror=function (error){
                            console.log('Error occurred:${error}}');
                        };
                        function send()
                        {

        
                           var sender_id = document.getElementById("sender_id").value;
                            var sender_name = document.getElementById("sender_name").value;
                            var content = document.getElementById("textMessage").value;
                            var timestamp = getFormattedTimestamp();

                            // Tạo đối tượng JSON để gửi qua WebSocket
                            var json = {                              
                                'sender_id': sender_id,
                                'content': content,
                                'timestamp': timestamp,
                                'sender_name': sender_name
                            };

                            // Gửi dữ liệu JSON qua WebSocket
                            ws.send(JSON.stringify(json));
                            return false;
                        }

                        function getFormattedTimestamp() {
                            var now = new Date();
                            var year = now.getFullYear();
                            var month = padZero(now.getMonth() + 1); // Tháng bắt đầu từ 0 nên cộng thêm 1
                            var day = padZero(now.getDate());
                            var hour = padZero(now.getHours());
                            var minute = padZero(now.getMinutes());
                            var second = padZero(now.getSeconds());

                            return year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
                        }

                        function padZero(number) {
                            return (number < 10 ? '0' : '') + number;
                        }

            </script>
            <script src="assets/js/jquery-3.2.1.min.js"></script>
            <script src="assets/js/popper.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/js/jquery.slimscroll.js"></script>
            <script src="assets/js/app.js"></script>
    </body>

</html>
<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/8/16
  Time: 下午2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
    <div class="nano">
        <div class="nano-content">
            <ul>
                <li class="active">
                    <a class="sidebar-sub-toggle" href="${pageContext.request.contextPath}/index.jsp"><i class="ti-home"></i> 首页</a>
                </li>
                <li>
                    <a class="sidebar-sub-toggle"><i class="ti-layout"></i> 基础数据 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/product/findAll.do">产品管理</a></li>
                    </ul>
                </li>
                <li>
                    <a class="sidebar-sub-toggle"><i class="ti-panel"></i> 系统管理 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="uc-calendar.html">日历</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- /# sidebar -->
<div class="header">
    <div class="pull-left">
        <div class="logo">
            <a href="index.html">
                <img id="logoImg" src="${pageContext.request.contextPath}/logo/logo.png" data-logo_big="${pageContext.request.contextPath}/logo/logo.png" data-logo_small="${pageContext.request.contextPath}/logo/logoSmall.png" alt="Nixon" />
            </a>
        </div>
        <div class="hamburger sidebar-toggle">
            <span class="ti-menu"></span>
        </div>
    </div>
    <div class="pull-right p-r-15">
        <ul>
            <li class="header-icon dib">
                <i class="ti-bell"></i>
                <div class="note-count">2</div>
                <div class="drop-down">
                    <div class="dropdown-content-heading">
                        <span class="text-left">最近的通知</span>
                    </div>
                    <div class="dropdown-content-body">
                        <ul>
                            <li>
                                <a href="#">
                                    <img class="pull-left m-r-10 avatar-img" src="${pageContext.request.contextPath}/images/avatar/3.jpg" alt="" />
                                    <div class="notification-content">
                                        <small class="notification-timestamp pull-right">02:34 下午</small>
                                        <div class="notification-heading">简女士</div>
                                        <div class="notification-text">今天有5位成员加入 </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img class="pull-left m-r-10 avatar-img" src="${pageContext.request.contextPath}/images/avatar/3.jpg" alt="" />
                                    <div class="notification-content">
                                        <small class="notification-timestamp pull-right">02:34 下午</small>
                                        <div class="notification-heading">玛丽亚姆</div>
                                        <div class="notification-text">喜欢你的照片</div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img class="pull-left m-r-10 avatar-img" src="${pageContext.request.contextPath}/images/avatar/3.jpg" alt="" />
                                    <div class="notification-content">
                                        <small class="notification-timestamp pull-right">02:34下午</small>
                                        <div class="notification-heading">Tasnim</div>
                                        <div class="notification-text">嗨泰迪，只是想让你.....</div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img class="pull-left m-r-10 avatar-img" src="${pageContext.request.contextPath}/images/avatar/3.jpg" alt="" />
                                    <div class="notification-content">
                                        <small class="notification-timestamp pull-right">02:34 下午</small>
                                        <div class="notification-heading">简·罗</div>
                                        <div class="notification-text">嗨泰迪，只是想让你......</div>
                                    </div>
                                </a>
                            </li>
                            <li class="text-center">
                                <a href="#" class="more-link">查看全部</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>

            <li class="header-icon dib">
                <i class="ti-email"></i>
                <div class="note-count">21</div>
                <div class="drop-down">
                    <div class="dropdown-content-heading">
                        <span class="text-left">2 新消息</span>
                        <a href="app-email.html"><i class="ti-pencil-alt pull-right"></i></a>
                    </div>
                    <div class="dropdown-content-body">
                        <ul>
                            <li class="notification-unread">
                                <a href="#">
                                    <img class="pull-left m-r-10 avatar-img" src="${pageContext.request.contextPath}/images/avatar/1.jpg" alt="" />
                                    <div class="notification-content">
                                        <small class="notification-timestamp pull-right">02:34 下午</small>
                                        <div class="notification-heading">简·多伊</div>
                                        <div class="notification-text">嗨泰迪，只是想让你......</div>
                                    </div>
                                </a>
                            </li>
                            <li class="notification-unread">
                                <a href="#">
                                    <img class="pull-left m-r-10 avatar-img" src="${pageContext.request.contextPath}/images/avatar/2.jpg" alt="" />
                                    <div class="notification-content">
                                        <small class="notification-timestamp pull-right">02:34 下午</small>
                                        <div class="notification-heading">简·罗</div>
                                        <div class="notification-text">嗨泰迪，只是想让你......</div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img class="pull-left m-r-10 avatar-img" src="${pageContext.request.contextPath}/images/avatar/3.jpg" alt="" />
                                    <div class="notification-content">
                                        <small class="notification-timestamp pull-right">02:34 下午</small>
                                        <div class="notification-heading">简·多伊</div>
                                        <div class="notification-text">嗨泰迪，只是想让你......</div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img class="pull-left m-r-10 avatar-img" src="${pageContext.request.contextPath}/images/avatar/2.jpg" alt="" />
                                    <div class="notification-content">
                                        <small class="notification-timestamp pull-right">02:34 下午</small>
                                        <div class="notification-heading">简·罗</div>
                                        <div class="notification-text">嗨泰迪，只是想让你......</div>
                                    </div>
                                </a>
                            </li>
                            <li class="text-center">
                                <a href="#" class="more-link">查看全部</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="header-icon dib chat-sidebar-icon"><i class="ti-comments"></i></li>
            <li class="header-icon dib">
                <img class="avatar-img" src="${pageContext.request.contextPath}/images/avatar/1.jpg" alt="" /> <span class="user-avatar">简 <i class="ti-angle-down f-s-10"></i></span>
                <div class="drop-down dropdown-profile">
                    <div class="dropdown-content-heading">
                        <span class="text-left">现在升级</span>
                        <p class="trial-day">30天步道</p>
                    </div>
                    <div class="dropdown-content-body">
                        <ul>
                            <li><a href="#"><i class="ti-user"></i> <span>轮廓</span></a></li>
                            <li><a href="#"><i class="ti-wallet"></i> <span>我的平衡</span></a></li>
                            <li><a href="#"><i class="ti-write"></i> <span>我的任务</span></a></li>
                            <li><a href="#"><i class="ti-calendar"></i> <span>我的日历</span></a></li>
                            <li><a href="#"><i class="ti-email"></i> <span>收件箱</span></a></li>
                            <li><a href="#"><i class="ti-settings"></i> <span>设置</span></a></li>
                            <li><a href="#"><i class="ti-help-alt"></i> <span>帮助</span></a></li>
                            <li><a href="#"><i class="ti-lock"></i> <span>锁屏</span></a></li>
                            <li><a href="#"><i class="ti-power-off"></i> <span>登出</span></a></li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
<div class="chat-sidebar">
    <!-- BEGIN chat -->
    <div id="mmc-chat" class="color-default">
        <!-- BEGIN CHAT BOX -->
        <div class="chat-box">
            <!-- BEGIN CHAT BOXS -->
            <ul class="boxs"></ul>
            <!-- END CHAT BOXS -->
            <div class="icons-set">
                <div class="stickers">
                    <div class="had-container">
                        <div class="row">
                            <div class="s12">
                                <ul class="tabs" style="width: 100%;height: 60px;">
                                    <li class="tab col s3">
                                        <a href="#tab1" class="active">
                                            <img src="${pageContext.request.contextPath}/images/1.png" alt="" />
                                        </a>
                                    </li>
                                    <li class="tab col s3"><a href="#tab2">测试 2</a></li>
                                </ul>
                            </div>
                            <div id="tab1" class="s12 tab-content">
                                <ul>
                                    <li><img src="${pageContext.request.contextPath}/images/1.png" alt="" /></li>
                                    <li><img src="${pageContext.request.contextPath}/images/1.png" alt="" /></li>
                                    <li><img src="${pageContext.request.contextPath}/images/1.png" alt="" /></li>
                                    <li><img src="${pageContext.request.contextPath}/images/1.png" alt="" /></li>
                                    <li><img src="${pageContext.request.contextPath}/images/1.png" alt="" /></li>
                                    <li><img src="${pageContext.request.contextPath}/images/1.png" alt="" /></li>
                                    <li><img src="${pageContext.request.contextPath}/images/1.png" alt="" /></li>
                                    <li><img src="${pageContext.request.contextPath}/images/1.png" alt="" /></li>
                                    <li><img src="${pageContext.request.contextPath}/images/1.png" alt="" /></li>
                                    <li><img src="${pageContext.request.contextPath}/images/1.png" alt="" /></li>
                                    <li><img src="${pageContext.request.contextPath}/images/1.png" alt="" /></li>
                                    <li><img src="${pageContext.request.contextPath}/images/1.png" alt="" /></li>
                                    <li><img src="${pageContext.request.contextPath}/images/1.png" alt="" /></li>
                                </ul>
                            </div>
                            <div id="tab2" class="s12 tab-content">测试 2</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END CHAT BOX -->
        <!-- BEGIN SIDEBAR -->
        <div id="sidebar" class="right scroll">
            <div class="had-container">
                <!-- BEGIN USERS -->
                <div class="users">
                    <ul class="user-list">
                        <!-- BEGIN USER-->
                        <li class="user-tooltip" data-id="1" data-status="online" data-username="Rufat Askerov" data-position="left" data-filter-item data-filter-name="rufat askerov">
                            <!-- BEGIN USER IMAGE-->
                            <div class="user-image">
                                <img src="${pageContext.request.contextPath}/images/avatar/1.jpg" class="avatar" alt="Rufat Askerov" />
                            </div>
                            <!-- END USER IMAGE-->
                            <!-- BEGIN USERNAME-->
                            <span class="user-name">鲁法特阿斯科罗夫</span>
                            <span class="user-show"></span>
                            <!-- END USERNAME-->
                        </li>
                        <!-- END USER-->
                        <!-- BEGIN USER-->
                        <li class="user-tooltip" data-id="3" data-status="online" data-username="Alice" data-position="left" data-filter-item data-filter-name="alice">
                            <div class="user-image">
                                <img src="${pageContext.request.contextPath}/images/avatar/1.jpg" class="avatar" alt="Alice" />
                            </div>
                            <span class="user-name">爱丽丝</span>
                            <span class="user-show"></span>
                        </li>
                        <!-- BEGIN USER-->
                        <li class="user-tooltip" data-id="7" data-status="offline" data-username="Michael Scofield" data-position="left" data-filter-item data-filter-name="michael scofield">
                            <div class="user-image">
                                <img src="${pageContext.request.contextPath}/images/avatar/1.jpg" class="avatar" alt="Michael Scofield" />
                            </div>
                            <span class="user-name">迈克尔斯科菲尔德</span>
                            <span class="user-show"></span>
                        </li>
                        <!-- BEGIN USER-->
                        <li class="user-tooltip" data-id="5" data-status="online" data-username="Irina Shayk" data-position="left" data-filter-item data-filter-name="irina shayk">
                            <div class="user-image">
                                <img src="${pageContext.request.contextPath}/images/avatar/1.jpg" class="avatar" alt="Irina Shayk" />
                            </div>
                            <span class="user-name">伊琳娜谢伊克</span>
                            <span class="user-show"></span>
                        </li>
                        <!-- BEGIN USER-->
                        <li class="user-tooltip" data-id="6" data-status="offline" data-username="Sara Tancredi" data-position="left" data-filter-item data-filter-name="sara tancredi">
                            <div class="user-image">
                                <img src="${pageContext.request.contextPath}/images/avatar/1.jpg" class="avatar" alt="Sara Tancredi" />
                            </div>
                            <span class="user-name">Sara Tancredi</span>
                            <span class="user-show"></span>
                        </li>
                        <!-- BEGIN USER-->
                        <li class="user-tooltip" data-id="7" data-status="offline" data-username="Jane" data-position="left" data-filter-item data-filter-name="Jane">
                            <div class="user-image">
                                <img src="${pageContext.request.contextPath}/images/avatar/1.jpg" class="avatar" alt="Jane" />
                            </div>
                            <span class="user-name">简</span>
                            <span class="user-show"></span>
                        </li>
                    </ul>
                    <div class="chat-user-search">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="ti-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search" data-search />
                        </div>
                    </div>
                </div>
                <!-- END USERS -->
            </div>
        </div>
        <!-- END SIDEBAR -->
    </div>
    <!-- END chat -->
</div>
</body>
</html>

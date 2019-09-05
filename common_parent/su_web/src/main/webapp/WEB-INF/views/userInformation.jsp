<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/8/22
  Time: 下午10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin: Invoice</title>

    <!-- ================= Favicon ================== -->
    <!-- Standard -->
    <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
    <!-- Retina iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
    <!-- Retina iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
    <!-- Standard iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
    <!-- Standard iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff">

    <link href="${pageContext.request.contextPath}/fontAwesome/css/fontawesome-all.min.css"
           rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/themify-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/weather-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/mmc-chat.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/lib/sidebar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/sweetalert/sweetalert.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/nixon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/font-awesome.min.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/css/lib/jsgrid/jsgrid-theme.min.css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/lib/jsgrid/jsgrid.min.css" type="text/css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/lib/menubar/sidebar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/helper.css" rel="stylesheet">
    <!-- Styles -->
    <link href="${pageContext.request.contextPath}/css/lib/toastr/toastr.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <style type="text/css">
        th {
            text-align: center; /** 设置水平方向居中 */
            vertical-align: middle /** 设置垂直方向居中 */
        }

        td {
            text-align: center; /** 设置水平方向居中 */
            vertical-align: middle /** 设置垂直方向居中 */
        }
    </style>
</head>

<body class="bg-primary" onload="info()">
<div>
    <i class="ti-arrow-left"
       style="position: absolute;top: 50px;right: 150px;cursor: pointer;font-size: large;"
       onclick="window.location.href='${pageContext.request.contextPath}/user/findAll.do?page=1&size=5'"></i>
</div>
<div class="unix-invoice">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <div id="invoice" class="effect2 m-t-120">
                    <div id="invoice-top" style="min-height: 35px;">
                        <div class="invoice-info">
                            <h2 style="font-size: 20px">用户管理</h2>
                        </div>
                        <!--End Info-->
                        <div class="title">
                            <h4>用户详情</h4>
                        </div>
                        <!--End Title-->
                    </div>
                    <!--End InvoiceTop-->

                    <div id="invoice-mid">
                        <div class="card alert">
                            <div class="card-body">
                                <div class="user-profile">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="card alert">
                                                <div class="card-body">
                                                    <div class="user-profile">
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                <div class="user-photo m-b-30">
                                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/images/head/timg.jpg"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <div class="user-profile-name" style="color: #878787">
                                                                    ${user.userSex=="男"?"<i class=\"fas fa-mars\" style=\"color:#00b4ef\"></i>":"<i class=\"fas fa-venus\" style=\"color:#d44950\"></i>"}
                                                                    &nbsp;${user.userName}
                                                                </div>
                                                                <div class="user-Location" style="color:#878787;"><i class="ti-location-pin" style="color:#878787;"></i> 陕西西安</div>

                                                                <div class="user-job-title"><br>
                                                                    <c:if test="${user.role.size()==0}">
                                                                        闲人一枚
                                                                    </c:if>
                                                                    <c:if test="${user.role.size()>0}">
                                                                        <c:forEach items="${user.role}" begin="0" end="${user.role.size()}" varStatus="stat">
                                                                            ${user.role[stat.index].roleName}
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </div>
                                                                <div class="ratings">
                                                                    <h4>评级</h4>
                                                                    <div class="rating-star">
                                                                        <span style="color: #878787">8.9</span>
                                                                        <i class="ti-star color-primary"></i>
                                                                        <i class="ti-star color-primary"></i>
                                                                        <i class="ti-star color-primary"></i>
                                                                        <i class="ti-star color-primary"></i>
                                                                    </div>
                                                                </div>
                                                                <div style="color:#878787;"><span style="color: #00838F">职务描述:</span>
                                                                    <c:if test="${user.role.size()==0}">
                                                                        没有职务
                                                                    </c:if>
                                                                    <c:if test="${user.role.size()>0}">
                                                                        <c:forEach items="${user.role}" begin="0" end="${user.role.size()}" varStatus="stat">
                                                                            ${user.role[stat.index].roleDesc}
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <div class="custom-tab user-profile-tab">
                                                                    <ul class="nav nav-tabs" role="tablist">
                                                                        <li role="presentation" class="active"><a href="#1" aria-controls="1" role="tab" data-toggle="tab">详细信息</a></li>
                                                                    </ul>
                                                                    <div class="tab-content">
                                                                        <div role="tabpanel" class="tab-pane active" id="1">
                                                                            <div class="contact-information">
                                                                                <div class="phone-content">
                                                                                    <span class="contact-title">联系方式:</span>
                                                                                    <span class="phone-number">${user.phoneNum}</span>
                                                                                </div>
                                                                                <div class="skype-content">
                                                                                    <span class="contact-title">用户密码:</span>
                                                                                    <span class="contact-skype">${user.userPassword}</span>
                                                                                </div>
                                                                                <div class="email-content">
                                                                                    <span class="contact-title">邮箱:</span>
                                                                                    <span class="contact-email">${user.userEmail}</span>
                                                                                </div>
                                                                                <div class="skype-content">
                                                                                    <span class="contact-title">用户状态</span>
                                                                                    <c:if test="${user.userStatus==0}">
                                                                                        <span class="contact-skype">关闭</span>
                                                                                    </c:if>
                                                                                    <c:if test="${user.userStatus==1}">
                                                                                        <span class="contact-skype">打开</span>
                                                                                    </c:if>
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
                                        </div><!-- /# column -->
                                        <div class="col-lg-8">
                                            <div class="custom-tab user-profile-tab">
                                                <ul class="nav nav-tabs" role="tablist">
                                                    <li role="presentation" class="active"><a
                                                            href="#2" aria-controls="1" role="tab"
                                                            data-toggle="tab"
                                                            style="cursor: pointer">操作记录</a></li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div role="tabpanel" class="tab-pane active"
                                                         id="2">
                                                        <div class="contact-information"
                                                             style="margin: 10px 35px;">
                                                            <div class="phone-content">
                                                                <c:if test="${log.size==0}">
                                                                    <p style="text-align: center">该用户可能偷懒,没有操作记录</p>
                                                                </c:if>
                                                                <c:if test="${log.size!=0}">
                                                                    <table class="table table-responsive table-hover"
                                                                           style="text-align: center">
                                                                        <thead>
                                                                        <tr>
                                                                            <th>#</th>
                                                                            <th>日志ID</th>
                                                                            <th>操作时间</th>
                                                                            <th>操作用户</th>
                                                                            <th>ip地址</th>
                                                                            <th>资源路径</th>
                                                                            <th style="text-align: center;">请求方法</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <c:forEach items="${log.list}" varStatus="stat" begin="0"
                                                                                   end="${log.size}">
                                                                            <%----%>
                                                                            <tbody>
                                                                            <tr>
                                                                                <th scope="row" >${stat.index+1}</th>
                                                                                <td >${log.list[stat.index].logId}</td>
                                                                                <td ><fmt:formatDate value="${log.list[stat.index].visitTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                                                <td >${log.list[stat.index].userName}</td>
                                                                                <td >${log.list[stat.index].ip}</td>
                                                                                <td >${log.list[stat.index].url}</td>
                                                                                <td style="text-align: center">${log.list[stat.index].method}</td>
                                                                            </tr>
                                                                            </tbody>
                                                                        </c:forEach>
                                                                    </table>
                                                                    <hr style="margin-bottom: 10px;border-top: 0px solid;color: #ddd;">
                                                                    <div class="jsgrid-pager-container" style="display: block;">
                                                                        <div class="jsgrid-pager">
                                                                            <span class="jsgrid-pager-nav-button ">每页显示条数 <input type="text" onkeyup="size4()" id="size" style="border: solid 1px;BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none;BORDER-BOTTOM-STYLE: solid; outline: none;width: 3em;text-align:center" >条</span>
                                                                            <span class="jsgrid-pager-nav-button ">当前页数 :</span><span class="jsgrid-pager-page jsgrid-pager-current-page" >${log.pageNum}</span>
                                                                            <c:if test="${param.page>1}">
                                            <span class="jsgrid-pager-nav-button ">
                                            <a href="${pageContext.request.contextPath}/user/userInformation.do?id=${user.userId}&page=1&size=${log.pageSize}">首页</a>
                                        </span>
                                                                                <span class="jsgrid-pager-nav-button ">
                                            <a href="${pageContext.request.contextPath}/user/userInformation.do?id=${user.userId}&page=${log.pageNum-1}&size=${log.pageSize}">上一页</a>
                                        </span>
                                                                            </c:if>
                                                                            <c:if test="${param.page<log.pages}">
                                                                                <span class="jsgrid-pager-nav-button"><a href="${pageContext.request.contextPath}/user/userInformation.do?id=${user.userId}&page=${log.pageNum+1}&size=${log.pageSize}">下一页</a></span>
                                                                                <span class="jsgrid-pager-nav-button"><a href="${pageContext.request.contextPath}/user/userInformation.do?id=${user.userId}&page=${log.pages}&size=${log.pageSize}">尾页</a></span> &nbsp;&nbsp;
                                                                            </c:if>
                                                                            <span class="jsgrid-pager-nav-button " style="float: right;">跳转到<input type="text" onkeyup="page5()" id="page" style="border: solid 1px;BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none;BORDER-BOTTOM-STYLE: solid; outline: none;width: 3em;text-align:center" >页</span>
                                                                            <span class="jsgrid-pager-nav-button " style="float: right;">共 ${log.pages }页</span>
                                                                            <span class="jsgrid-pager-nav-button " style="float: right;">共 ${log.total} 条日志</span>
                                                                        </div>
                                                                    </div>
                                                                </c:if>

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
                    <!--End InvoiceBot-->
                </div>
                <!--End Invoice-->
            </div>
            <div class="col-lg-1"></div>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/js/lib/jquery.min.js"></script><!-- jquery vendor -->
<script src="${pageContext.request.contextPath}/js/lib/jquery.nanoscroller.min.js"></script><!-- nano scroller -->
<script src="${pageContext.request.contextPath}/js/lib/sidebar.js"></script><!-- sidebar -->
<script src="${pageContext.request.contextPath}/js/lib/bootstrap.min.js"></script><!-- bootstrap -->
<script src="${pageContext.request.contextPath}/js/lib/mmc-common.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/mmc-chat.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/toastr/toastr.min.js"></script><!-- scripit init-->
<script src="${pageContext.request.contextPath}/js/scripts.js"></script><!-- scripit init-->


<script type="text/javascript">
    function info() {
        toastr.info('该页面为用户信息展示页面,无法编辑哦','系统通知',{
            "positionClass": "toast-top-center",
            timeOut: 7000,
            "closeButton": true,
            "debug": false,
            "newestOnTop": true,
            "progressBar": true,
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut",
            "tapToDismiss": false
        })
    }
    function page5() {
        var val = document.getElementById("page").value;
        window.location.href="${pageContext.request.contextPath}/user/userInformation.do?id=${user.userId}&page="+val+"&size=${param.size}"
    }
    function size4() {
        var val= document.getElementById("size").value;
        console.log(val)
        window.location.href="${pageContext.request.contextPath}/user/userInformation.do?id=${user.userId}&page=1&size="+val
    }
</script>
</body>
</html>

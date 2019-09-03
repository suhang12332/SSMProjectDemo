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

    <!-- Styles -->
    <link href="${pageContext.request.contextPath}/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/themify-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/helper.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <!-- Styles -->
    <link href="${pageContext.request.contextPath}/fontAwesome/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/weather-icons.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/lib/mmc-chat.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/lib/sidebar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/toastr/toastr.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/nixon.css" rel="stylesheet">

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
       onclick="javascript:history.back()"></i>
</div>
<div class="unix-invoice">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
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
                                        <div class="col-lg-6">
                                            <div class="custom-tab user-profile-tab">
                                                <ul class="nav nav-tabs" role="tablist">
                                                    <li role="presentation" class="active"><a
                                                            href="#1" aria-controls="1" role="tab"
                                                            data-toggle="tab"
                                                            style="cursor: pointer">用户信息</a></li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div role="tabpanel" class="tab-pane active"
                                                         id="1">
                                                        <div class="contact-information"
                                                             style="margin: 10px 35px;">
                                                            <div class="phone-content">
                                                                <span class="contact-title">用户编号:</span>
                                                                <span class="phone-number">${user.userId}</span>
                                                            </div>
                                                            <div class="phone-content">
                                                                <span class="contact-title">用户姓名:</span>
                                                                <span class="phone-number">${user.userName}</span>
                                                            </div>
                                                            <div class="address-content">
                                                                <span class="contact-title">用户邮箱:</span>
                                                                <span class="mail-address">${user.userEmail} </span>
                                                            </div>
                                                            <div class="website-content">
                                                                <span class="contact-title">用户密码:</span>
                                                                <span class="contact-website">${user.userPassword}</span>
                                                            </div>
                                                            <div class="skype-content">
                                                                <span class="contact-title">用户状态:</span>
                                                                <span class="contact-skype">
                                                                    <c:if test="${user.userStatus==0}">
                                                                        关闭
                                                                    </c:if>
                                                                    <c:if test="${user.userStatus==1}">
                                                                        打开
                                                                    </c:if>
                                                                </span>
                                                            </div>
                                                            <c:if test="${user.role.size()<=0}">
                                                                当前用户没有任何角色信息
                                                            </c:if>
                                                            <c:if test="${user.role.size()>0}">
                                                                <div class="phone-content">
                                                                    <span class="contact-title">角色名称:</span>
                                                                    <c:forEach items="${user.role}" varStatus="stat" begin="0" end="${user.role.size()}">
                                                                        <span class="phone-number">${user.role[stat.index].roleName}</span>
                                                                    </c:forEach>
                                                                </div>
                                                                <div class="address-content">
                                                                    <span class="contact-title">角色描述:</span>
                                                                    <c:forEach items="${user.role}" varStatus="stat" begin="0" end="${user.role.size()}">
                                                                        <span class="phone-number">${user.role[stat.index].roleDesc}</span>
                                                                    </c:forEach>
                                                                </div>

                                                            </c:if>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
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
            <div class="col-lg-2"></div>
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
        toastr.info('该页面为订单展示页面,无法编辑哦','系统通知',{
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
</script>
</body>
</html>

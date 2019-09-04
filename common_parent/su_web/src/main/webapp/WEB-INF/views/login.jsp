<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/8/14
  Time: 下午11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Nixon : 管理系统</title>
    <!-- ================= Favicon ================== -->
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
</head>

<body class="bg-primary" onload="login()">

<div class="Nixon-login">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-lg-offset-3">
                <div class="login-content">
                    <div class="login-form">
                        <h4>管理员登录</h4>
                        <form:form modelAttribute="user" action="${pageContext.request.contextPath}/user/isLogin.do">
                            <div class="form-group">
                                <label>用户名</label>
                                <form:input path="userName" cssClass="form-control" placeholder="用户姓名" onkeyup="login()" id="username"/>
                                <label style="float: right" id="name"></label>
                            </div>
                            <div class="form-group">
                                <label>密码</label>
                                <form:password path="userPassword" cssClass="form-control" placeholder="用户密码" onkeyup="login()" id="password"/>
                                <label style="float: right" id="pass"></label>
                            </div>
                            <div class="checkbox">
                                <label class="pull-right">
                                    <a href="${pageContext.request.contextPath}/user/returnPassword.do">忘记密码?</a>
                                </label>
                            </div>
                            <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30" id="btn">登入</button>
                            <div class="register-link m-t-15 text-center">
                                <p>返回 <a href="${pageContext.request.contextPath}"> 首页</a></p>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
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
<script>
    function login() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        if(${requestScope.msg!=null}){
            toastr.error('你还没有登录,请登录','系统通知',{
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
        }else if(username == null || password == null || username == "" || password == "" || username == undefined || password == undefined) {
            document.getElementById("btn").disabled = true;
            toastr.warning('用户名或者密码不能为空', '系统通知', {
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
        } else  {
            document.getElementById("btn").disabled = false;
        }
    }
</script>
</body>
</html>



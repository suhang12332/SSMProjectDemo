<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/8/15
  Time: 下午2:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Nixon : Table</title>

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
    <link href="${pageContext.request.contextPath}/fontAwesome/css/fontawesome-all.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/themify-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/mmc-chat.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/lib/sidebar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/nixon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/bootstrap-datetimepicker.min.css" rel="stylesheet">

    <style type="text/css">
        th {
            text-align: center; /** 设置水平方向居中 */
            vertical-align: middle /** 设置垂直方向居中 */
        }
    </style>

</head>

<body>
<jsp:include page="head.jsp"/>
<!-- END chat Sidebar-->

<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <h1>用户管理</h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=1&size=5">用户信息</a></li>
                                <li class="active">增加用户信息表单</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-content">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <div class="card alert">
                        <div class="card-header">
                            <h4>添加用户信息表单</h4>
                            <div class="card-header-right-icon">
                                <ul>
                                    <%--                                    <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>--%>
                                    <li class="card-option drop-menu"><i class="ti-settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="link"></i>
                                        <ul class="card-option-dropdown dropdown-menu">
                                            <li><a href="${pageContext.request.contextPath}/user/toAdd.do"><i class="ti-loop"></i> 更新日志</a></li>
                                            <li><a href="#"><i class="ti-menu-alt"></i> 详细日志</a></li>
                                            <li><a href="#"><i class="ti-pulse"></i> 统计</a></li>
                                            <li><a href="#"><i class="ti-power-off"></i> 清楚的是</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div><br>
                        <div class="card-body">
                            <div class="horizontal-form-elements">
                                <form:form modelAttribute="user" method="post" action="${pageContext.request.contextPath}/user/addUser.do" cssClass="form-horizontal">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">用户姓名</label>
                                                <div class="col-sm-8">
                                                    <form:input path="userName" cssClass="form-control" value="${user.userName}" placeholder="用户姓名" id="userNameId" onkeyup="selectByUserName()"/>
                                                </div>
                                                <label class="col-sm-2 control-label" style="color: red" id="errorUserName"><form:errors path="userName"/> </label>
                                                <input value="${user.userName}" style="display: none" id="userName">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">用户密码</label>
                                                <div class="col-sm-8">
                                                    <form:password path="userPassword" cssClass="form-control" value="${user.userPassword}" placeholder="用户密码"/>
                                                </div>
                                                <label class="col-sm-2 control-label" style="color: red"><form:errors path="userPassword"/> </ label>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">用户邮箱</label>
                                                <div class="col-sm-8">
                                                    <form:input path="userEmail" cssClass="form-control" value="${user.userEmail}" placeholder="用户密码"/>
                                                </div>
                                                <label class="col-sm-2 control-label" style="color: red"><form:errors path="userEmail"/> </ label>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">联系方式</label>
                                                <div class="col-sm-8">
                                                    <form:input path="phoneNum" cssClass="form-control" value="${user.phoneNum}" placeholder="联系方式" id="phoneNumber" onkeyup="selectByPhoneNum()"/>
                                                </div>
                                                <label class="col-sm-2 control-label" style="color: red" id="errorPhoneNumber"><form:errors path="phoneNum"/> </label>
                                                <input value="${user.phoneNum}" style="display: none" id="phoneNum">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">用户状态</label>
                                                <div class="col-sm-8">
                                                    <form:select path="userStatus" cssClass="form-control btn btn-primary">
                                                        <label>请选择用户状态</label>
                                                        <form:option value="0" cssClass="form-control btn btn-primary">关闭</form:option>
                                                        <form:option value="1" cssClass="form-control btn btn-primary">打开</form:option>
                                                    </form:select>
                                                </div>
                                                <label class="col-sm-2 control-label" style="color: red"><form:errors path="userStatus" /> </label>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">用户性别</label>
                                                <div class="col-sm-8">
                                                    <form:select path="userSex" cssClass="form-control btn btn-primary">
                                                        <label>请选择用户性别</label>
                                                        <form:option value="男" cssClass="form-control btn btn-primary">男</form:option>
                                                        <form:option value="女" cssClass="form-control btn btn-primary">女</form:option>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-primary col-sm-offset-4">确认</button>
                                                <a class="btn btn-primary col-sm-offset-2" href="javascript:history.back()">返回</a>
                                            </div>
                                        </div><!-- /# column -->
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div><!-- /# column -->
                <div class="col-lg-2"></div>
            </div><!-- /# container-fluid -->

        </div><!-- /# main -->
    </div><!-- /# content wrap -->
</div>
<script src="${pageContext.request.contextPath}/js/lib/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/jquery.min.js"></script>
<!-- jquery vendor -->
<script src="${pageContext.request.contextPath}/js/lib/jquery.nanoscroller.min.js"></script>
<!-- nano scroller -->
<script src="${pageContext.request.contextPath}/js/lib/sidebar.js"></script><!-- sidebar -->
<script src="${pageContext.request.contextPath}/js/lib/bootstrap.min.js"></script><!-- bootstrap -->
<script src="${pageContext.request.contextPath}/js/lib/mmc-common.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/mmc-chat.js"></script>
<script src="${pageContext.request.contextPath}/js/scripts.js"></script><!-- scripit init-->
<script src="${pageContext.request.contextPath}/js/lib/bootstrap-datetimepicker.min.js"></script>

<script>
    function selectByPhoneNum() {
        $("#errorPhoneNumber").html("");
        var phoneNumber = document.getElementById("phoneNumber").value;
        var value = document.getElementById("phoneNum").value;
        var b1 = phoneNumber == value;
        if (!b1) {
            $.ajax({
                       //请求路径
                       url:"${pageContext.request.contextPath}/user/selectByPhoneNum.do?phoneNum="+phoneNumber,
                       //请求方式
                       type:"get",
                       //data表示发送的数据
                       data:{},
                       //定义回调响应的数据格式为JSON字符串,该字符串可以省略
                       dataType:"json",
                       //响应的结果
                       success:function (data) {
                           if (data !=0) {
                               $("#errorPhoneNumber").html("该联系方式已经存在");
                           }
                       }
                   });
        }
    }
    function selectByUserName() {
        $("#errorUserName").html("");
        var userNameId = document.getElementById("userNameId").value;
        var value = document.getElementById("userName").value;
        var b1 = userNameId == value;
        if (!b1) {
            $.ajax({
                       //请求路径
                       url:"${pageContext.request.contextPath}/user/selectByUserName.do?userName="+userNameId,
                       //请求方式
                       type:"get",
                       //data表示发送的数据
                       data:{},
                       //定义回调响应的数据格式为JSON字符串,该字符串可以省略
                       dataType:"json",
                       //响应的结果
                       success:function (data) {
                           if (data !=0) {
                               $("#errorUserName").html("该用户名已经存在");
                           }
                       }
                   });
        }
    }
</script>
</body>
</html>






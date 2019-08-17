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
                            <h1>仪表盘 1</h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="#">仪表盘</a></li>
                                <li class="active">添加产品信息表</li>

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
                            <h4>添加产品信息表单</h4>
                            <div class="card-header-right-icon">
                                <ul>
                                    <%--                                    <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>--%>
                                    <li class="card-option drop-menu"><i class="ti-settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="link"></i>
                                        <ul class="card-option-dropdown dropdown-menu">
                                            <li><a href="#"><i class="ti-loop"></i> 更新日志</a></li>
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
                                <form:form modelAttribute="product" method="post" action="${pageContext.request.contextPath}/product/addProduct.do" cssClass="form-horizontal">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" >产品id</label>
                                                <form:input path="productId" cssClass="form-control" value="${product.productId}" placeholder="产品名称" readonly=""/>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">产品名称</label>
                                                <div class="col-sm-8">
                                                    <form:input path="productName" cssClass="form-control" value="${product.productName}" placeholder="产品名称"/>
                                                </div>
                                                <label class="col-sm-2 control-label" style="color: red"><form:errors path="productName"/> </label>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">出发城市</label>
                                                <div class="col-sm-8">
                                                    <form:input path="cityName" cssClass="form-control" value="${product.cityName}" placeholder="出发城市"/>
                                                </div>
                                                <label class="col-sm-2 control-label" style="color: red"><form:errors path="cityName"/> </ label>
                                            </div>
                                            <c:set var="departureTime">
                                                <fmt:formatDate value="${product.departureTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </c:set>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">出发时间</label>
                                                <div class="col-sm-8">
                                                    <div class='input-group date'>
                                                        <form:input path="departureTime" autocomplete="off" id="form_datetime" cssClass="form-control" value="${departureTime}" placeholder="出发时间"/>
                                                        <span class="input-group-addon" style="background: transparent">
                                                            <span class="ti-calendar"></span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <label class="col-sm-2 control-label" style="color: red"><form:errors path="departureTime" /> </label>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">产品价格</label>
                                                <div class="col-sm-8">
                                                    <form:input path="productPrice" cssClass="form-control" value="${product.productPrice}" placeholder="产品价格"/>
                                                </div>
                                                <label class="col-sm-2 control-label" style="color: red"><form:errors path="productPrice"/> </label>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">产品状态</label>
                                                <div class="col-sm-8">
                                                    <form:select path="productStatus" cssClass="form-control btn btn-primary">
                                                        <label>请选择产品状态</label>
                                                        <form:option value="0" cssClass="form-control btn btn-primary">关闭</form:option>
                                                        <form:option value="1" cssClass="form-control btn btn-primary">打开</form:option>
                                                    </form:select>
                                                </div>
                                                <label class="col-sm-2 control-label" style="color: red"><form:errors path="productStatus" /> </label>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">产品描述</label>
                                                <div class="col-sm-8">
                                                    <form:textarea path="productDesc" cssClass="form-control" value="${product.productDesc}" placeholder="产品描述"/>
                                                </div>
                                                <label class="col-sm-2 control-label" style="color: red"><form:errors path="productDesc"/>  </label>
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
    $('#form_datetime').datetimepicker({
                                           format: 'yyyy-mm-dd hh:ii:ss',
                                           autoclose: true,
                                           // minView: "month",  //选择日期后，不会再跳转去选择时分秒
                                           language: 'zh-CN',
                                           dateFormat: 'yyyy-mm-dd',//日期显示格式
                                           timeFormat: 'HH:mm:ss',//时间显示格式
                                           todayBtn: 1,
                                           autoclose: 1,
                                           minView: 0,  //0表示可以选择小时、分钟   1只可以选择小时
                                           minuteStep: 1//分钟间隔1分钟
                                       });
</script>
</body>
</html>






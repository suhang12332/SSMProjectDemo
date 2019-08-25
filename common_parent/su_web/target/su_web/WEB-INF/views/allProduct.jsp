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

    <style type="text/css">
        th {
            text-align: center; /** 设置水平方向居中 */
            vertical-align: middle /** 设置垂直方向居中 */
        }
    </style>

</head>

<body>

<jsp:include page="head.jsp"/>

<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <h1>数据管理</h1>
                        </div>
                    </div>
                </div><!-- /# column -->
                <div class="col-lg-4 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="${pageContext.request.contextPath}/product/findAll.do?page=1&size=5">产品管理</a></li>
                                <li class="active">所有产品表</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /# column -->
            </div><!-- /# row -->
            <div class="main-content">
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>所有产品表 </h4>

                                <div class="card-header-right-icon">
                                    <button type="button" class="btn btn-default btn-outline m-b-10"
                                            onclick="window.location.href='${pageContext.request.contextPath}/product/toAdd.do'">
                                        增加产品
                                    </button>
                                    <ul>
                                        <%--                                        <li class="card-close" data-dismiss="alert"><i--%>
                                        <%--                                                class="ti-close"></i></li>--%>
                                        <li class="card-option drop-menu"><i class="ti-settings"
                                                                             data-toggle="dropdown"
                                                                             aria-haspopup="true"
                                                                             aria-expanded="true"
                                                                             role="link"></i>
                                            <ul class="card-option-dropdown dropdown-menu">
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/product/findAll.do?page=1&size=5"><i
                                                            class="ti-loop"></i> 更新数据</a>
                                                </li>
                                                <li><a href="#"><i class="ti-menu-alt"></i> 详细日志</a>
                                                </li>
                                                <li><a href="#"><i class="ti-pulse"></i> 统计</a>
                                                </li>
                                                <li><a href="#"><i class="ti-power-off"></i>
                                                    清楚的是</a></li>
                                            </ul>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <c:if test="${all.list.size()==0}">
                                    <p style="text-align: center">没有产品信息</p>
                                </c:if>
                                <c:if test="${all.list.size()!=0}">
                                    <table class="table table-responsive table-hover"
                                           style="text-align: center">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>产品id</th>
                                            <th>产品名称</th>
                                            <th>出发城市</th>
                                            <th>出发时间</th>
                                            <th>产品价格</th>
                                            <th>产品描述</th>
                                            <th>产品状态</th>
                                            <th style="text-align: center">产品操作</th>
                                        </tr>
                                        </thead>
                                        <c:forEach items="${all.list}" varStatus="stat" begin="0"
                                                   end="${all.size}" >
<%----%>
                                            <tbody>
                                            <tr>
                                                <th scope="row">${stat.index+1}</th>
                                                <td>${all.list[stat.index].productId}</td>
                                                <td>${all.list[stat.index].productName}</td>
                                                <td>${all.list[stat.index].cityName}</td>
                                                <td><fmt:formatDate
                                                        value="${all.list[stat.index].departureTime}"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                <td>￥${all.list[stat.index].productPrice}</td>
                                                <td>${all.list[stat.index].productDesc}</td>
                                                <td><c:if
                                                        test="${all.list[stat.index].productStatus==1}">
                                                    开启
                                                </c:if>
                                                    <c:if test="${all.list[stat.index].productStatus==0}">
                                                        关闭
                                                    </c:if></td>
                                                <td style="text-align: -webkit-center;">
                                                    <i onclick="window.location.href='${pageContext.request.contextPath}/product/toUpdate.do?id=${all.list[stat.index].productId}'"
                                                            class="ti-pencil"
                                                            style="cursor: pointer;z-index: 999"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <i class="ti-trash "
                                                            style="cursor: pointer;z-index: 999"
                                                            onclick="deletebyId2(${all.list[stat.index].productId})">
                                                    </i>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </c:forEach>
                                    </table>
                                </c:if>
                                <hr style="margin-bottom: 10px;border-top: 0px solid;color: #ddd;">
                                <div class="jsgrid-pager-container" style="display: block;">
                                    <div class="jsgrid-pager">
                                        <span class="jsgrid-pager-nav-button ">每页显示条数 <input type="text" onkeyup="size1()" id="size" style="border: solid 1px;BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none;BORDER-BOTTOM-STYLE: solid; outline: none;width: 3em;text-align:center" >条</span>
                                        <span class="jsgrid-pager-nav-button ">当前页数 :</span><span class="jsgrid-pager-page jsgrid-pager-current-page" >${all.pageNum}</span>
                                        <c:if test="${param.page>1}">
                                            <span class="jsgrid-pager-nav-button ">
                                            <a href="${pageContext.request.contextPath}/product/findAll.do?page=1&size=${all.pageSize}">首页</a>
                                        </span>
                                            <span class="jsgrid-pager-nav-button ">
                                            <a href="${pageContext.request.contextPath}/product/findAll.do?page=${all.pageNum-1}&size=${all.pageSize}">上一页</a>
                                        </span>
                                        </c:if>
                                        <c:if test="${param.page<all.pages}">
                                            <span class="jsgrid-pager-nav-button"><a href="${pageContext.request.contextPath}/product/findAll.do?page=${all.pageNum+1}&size=${all.pageSize}" onclick="page()">下一页</a></span>
                                            <span class="jsgrid-pager-nav-button"><a href="${pageContext.request.contextPath}/product/findAll.do?page=${all.pages}&size=${all.pageSize}">尾页</a></span> &nbsp;&nbsp;
                                        </c:if>
                                        <span class="jsgrid-pager-nav-button " style="float: right;">跳转到<input type="text" onkeyup="page()" id="page" style="border: solid 1px;BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none;BORDER-BOTTOM-STYLE: solid; outline: none;width: 3em;text-align:center" >页</span>
                                        <span class="jsgrid-pager-nav-button " style="float: right;">共${all.pages}页</span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div><!-- /# column -->
                    <div class="col-lg-1"></div>
                </div><!-- /# row -->
            </div><!-- /# container-fluid -->
        </div><!-- /# main -->
    </div>
</div><!-- /# content wrap -->

<script src="${pageContext.request.contextPath}/js/lib/jquery.min.js"></script>
<!-- jquery vendor -->
<script src="${pageContext.request.contextPath}/js/lib/jquery.nanoscroller.min.js"></script>
<!-- nano scroller -->
<script src="${pageContext.request.contextPath}/js/lib/sidebar.js"></script><!-- sidebar -->
<script src="${pageContext.request.contextPath}/js/lib/bootstrap.min.js"></script><!-- bootstrap -->
<script src="${pageContext.request.contextPath}/js/lib/mmc-common.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/mmc-chat.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/sweetalert/sweetalert.min.js"></script>
<!-- scripit init-->
<script src="${pageContext.request.contextPath}/js/scripts.js"></script><!-- scripit init-->

<script type="text/javascript">
    function deletebyId2(id){
        swal({
                 title: "你确定要删除吗 ?",
                 text: "你将永远失去,不能再被恢复 !!",
                 type: "warning",
                 showCancelButton: true,
                 confirmButtonColor: "#DD6B55",
                 confirmButtonText: "是的,删除它 !!",
                 cancelButtonText: "不，取消它 !!",
                 closeOnConfirm: false,
                 // closeOnCancel: false
             },
             function(isConfirm){
                 if (isConfirm) {
                     swal("删除成功 !!", "嘿 ,记录已被删除 !!", "success");
                     window.location.href='${pageContext.request.contextPath}/orders/selectOrdersIdByProductId.do?id='+id
                 }
                 else {
                     swal("已取消 !!", "嘿 ,记录很安全 !!", "error");
                 }
             });
    }
    function page() {
        var val = document.getElementById("page").value;
        window.location.href="${pageContext.request.contextPath}/product/findAll.do?page="+val+"&size=${param.size}"
    }
    function size1() {
        var val= document.getElementById("size").value;
        console.log(val)
        window.location.href="${pageContext.request.contextPath}/product/findAll.do?page=1&size="+val
    }
</script>
</body>
</html>
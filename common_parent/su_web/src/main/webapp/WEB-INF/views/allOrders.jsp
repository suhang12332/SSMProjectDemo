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
                                <li><a href="${pageContext.request.contextPath}/orders/findAllOrder.do?page=1&size=5">订单管理</a></li>
                                <li class="active">所有订单表</li>
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
                                <h4>所有订单表 </h4>

                                <div class="card-header-right-icon">
                                    <button type="button" class="btn btn-default btn-outline m-b-10"
                                            onclick="window.location.href='${pageContext.request.contextPath}/orders/toAdd.do'">
                                        增加订单
                                    </button>
                                    <ul>
                                        <li class="card-option drop-menu"><i class="ti-settings"
                                                                             data-toggle="dropdown"
                                                                             aria-haspopup="true"
                                                                             aria-expanded="true"
                                                                             role="link"></i>
                                            <ul class="card-option-dropdown dropdown-menu">
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/orders/findAllOrder.do?page=1&size=5"><i
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
                                <c:if test="${orders.list.size()==0}">
                                    <p style="text-align: center">没有订单信息</p>
                                </c:if>
                                <c:if test="${orders.list.size()!=0}">
                                    <table class="table table-responsive table-hover"
                                           style="text-align: center">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>订单id</th>
                                            <th>下单时间</th>
                                            <th>出游人数</th>
                                            <th>订单描述</th>
                                            <th>支付方式</th>
                                            <th>订单状态</th>
                                            <th>产品编号</th>
                                            <th>会员编号</th>
                                            <th style="text-align: center">订单操作</th>
                                        </tr>
                                        </thead>
                                        <c:forEach items="${orders.list}" varStatus="stat" begin="0"
                                                   end="${orders.size}">

                                            <tbody>
                                            <tr>
                                                <th scope="row" onclick="window.location.href='${pageContext.request.contextPath}/orders/orderInformation.do?id='+${orders.list[stat.index].orderId}">${stat.index+1}</th>
                                                <td onclick="window.location.href='${pageContext.request.contextPath}/orders/orderInformation.do?id='+${orders.list[stat.index].orderId}">${orders.list[stat.index].orderId}</td>
                                                <td onclick="window.location.href='${pageContext.request.contextPath}/orders/orderInformation.do?id='+${orders.list[stat.index].orderId}"><fmt:formatDate
                                                        value="${orders.list[stat.index].orderTime}"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                <td onclick="window.location.href='${pageContext.request.contextPath}/orders/orderInformation.do?id='+${orders.list[stat.index].orderId}">${orders.list[stat.index].peopleCount}</td>

                                                <td onclick="window.location.href='${pageContext.request.contextPath}/orders/orderInformation.do?id='+${orders.list[stat.index].orderId}">${orders.list[stat.index].orderDesc}</td>

                                                <td onclick="window.location.href='${pageContext.request.contextPath}/orders/orderInformation.do?id='+${orders.list[stat.index].orderId}">
                                                    <c:if test="${orders.list[stat.index].payType==1}">
                                                        微信
                                                    </c:if>
                                                    <c:if test="${orders.list[stat.index].payType==0}">
                                                        支付宝
                                                    </c:if>
                                                    <c:if test="${orders.list[stat.index].payType==2}">
                                                        其他
                                                    </c:if>
                                                </td>
                                                <td onclick="window.location.href='${pageContext.request.contextPath}/orders/orderInformation.do?id='+${orders.list[stat.index].orderId}">
                                                    <c:if test="${orders.list[stat.index].orderStatus==1}">
                                                        已支付
                                                    </c:if>
                                                    <c:if test="${orders.list[stat.index].orderStatus==0}">
                                                        未支付
                                                    </c:if>
                                                </td>
                                                <td onclick="window.location.href='${pageContext.request.contextPath}/orders/orderInformation.do?id='+${orders.list[stat.index].orderId}">${orders.list[stat.index].product.productId}</td>
                                                <td onclick="window.location.href='${pageContext.request.contextPath}/orders/orderInformation.do?id='+${orders.list[stat.index].orderId}">${orders.list[stat.index].memberid.memberidId}</td>
                                                <td style="text-align: -webkit-center;">
                                                    <i onclick="window.location.href='${pageContext.request.contextPath}/orders/toUpdate.do?id=${orders.list[stat.index].orderId}'"
                                                            class="ti-pencil"
                                                            style="cursor: pointer;"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <i class="ti-trash  "
                                                            style="cursor: pointer;z-index: 999"
                                                            onclick="deletebyId1(${orders.list[stat.index].orderId})">
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
                                        <span class="jsgrid-pager-nav-button ">每页显示条数 <input type="text" onkeyup="size2()" id="size" style="border: solid 1px;BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none;BORDER-BOTTOM-STYLE: solid; outline: none;width: 3em;text-align:center" >条</span>
                                        <span class="jsgrid-pager-nav-button ">当前页数 :</span><span class="jsgrid-pager-page jsgrid-pager-current-page" >${orders.pageNum}</span>
                                        <c:if test="${param.page>1}">
                                            <span class="jsgrid-pager-nav-button ">
                                            <a href="${pageContext.request.contextPath}/orders/findAllOrder.do?page=1&size=${orders.pageSize}">首页</a>
                                        </span>
                                            <span class="jsgrid-pager-nav-button ">
                                            <a href="${pageContext.request.contextPath}/orders/findAllOrder.do?page=${orders.pageNum-1}&size=${orders.pageSize}">上一页</a>
                                        </span>
                                        </c:if>
                                        <c:if test="${param.page<orders.pages}">
                                            <span class="jsgrid-pager-nav-button"><a href="${pageContext.request.contextPath}/orders/findAllOrder.do?page=${orders.pageNum+1}&size=${orders.pageSize}">下一页</a></span>
                                            <span class="jsgrid-pager-nav-button"><a href="${pageContext.request.contextPath}/orders/findAllOrder.do?page=${orders.pages}&size=${orders.pageSize}">尾页</a></span> &nbsp;&nbsp;
                                        </c:if>
                                        <span class="jsgrid-pager-nav-button " style="float: right;">跳转到<input type="text" onkeyup="page1()" id="page" style="border: solid 1px;BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none;BORDER-BOTTOM-STYLE: solid; outline: none;width: 3em;text-align:center" >页</span>
                                        <span class="jsgrid-pager-nav-button " style="float: right;">共 ${orders.pages} 页</span>
                                        <span class="jsgrid-pager-nav-button " style="float: right;">共 ${orders.total} 个订单</span>

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
<script src="${pageContext.request.contextPath}/js/lib/sweetalert/sweetalert.init.js"></script>
<!-- scripit init-->
<script src="${pageContext.request.contextPath}/js/scripts.js"></script><!-- scripit init-->

<script type="text/javascript">
    function deletebyId1(id){
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
                     window.location.href='${pageContext.request.contextPath}/orderstourist/deleteByOrdersId.do?id='+id
                 }
                 else {
                     swal("已取消 !!", "嘿 ,记录很安全 !!", "error");
                 }
             });
    };
    function page1() {
        var val = document.getElementById("page").value;
        window.location.href="${pageContext.request.contextPath}/orders/findAllOrder.do?page="+val+"&size=${param.size}"
    }
    function size2() {
        var val= document.getElementById("size").value;
        console.log(val)
        window.location.href="${pageContext.request.contextPath}/orders/findAllOrder.do?page=1&size="+val
    }
</script>
</body>

</html>
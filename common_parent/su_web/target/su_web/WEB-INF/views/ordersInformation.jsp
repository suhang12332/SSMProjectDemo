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

<body class="bg-primary" >
<div>
    <i class="ti-arrow-left" style="position: absolute;top: 50px;right: 150px;cursor: pointer;font-size: large;" onclick="javascript:history.back()"></i>
</div>
<div class="unix-invoice" >
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
                <div id="invoice" class="effect2 m-t-120">
                    <div id="invoice-top" style="min-height: 35px;">
                        <div class="invoice-info">
                            <h2 style="font-size: 20px">订单管理</h2>
                        </div>
                        <!--End Info-->
                        <div class="title">
                            <h4>订单详情</h4>
                            <p>下单日期: <fmt:formatDate value="${ordersInformation.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </p>
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
                                                    <li role="presentation" class="active" ><a href="#1" aria-controls="1" role="tab" data-toggle="tab" style="cursor: pointer">订单信息</a></li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div role="tabpanel" class="tab-pane active" id="1">
                                                        <div class="contact-information" style="margin: 10px 35px;">
                                                            <div class="phone-content" >
                                                                <span class="contact-title">订单编号:</span>
                                                                <span class="phone-number">${ordersInformation.orderId}</span>
                                                            </div>
                                                            <div class="address-content">
                                                                <span class="contact-title">下单时间:</span>
                                                                <span class="mail-address"><fmt:formatDate value="${ordersInformation.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
                                                            </div>
                                                            <div class="email-content">
                                                                <span class="contact-title">出游人数:</span>
                                                                <span class="contact-email">${ordersInformation.peopleCount}</span>
                                                            </div>
                                                            <div class="website-content">
                                                                <span class="contact-title">订单描述:</span>
                                                                <span class="contact-website">${ordersInformation.orderDesc}</span>
                                                            </div>
                                                            <div class="skype-content">
                                                                <span class="contact-title">支付方式:</span>
                                                                <span class="contact-skype">
                                                                    <c:if test="${ordersInformation.payType==0}">
                                                                        支付宝
                                                                    </c:if>
                                                                    <c:if test="${ordersInformation.payType==1}">
                                                                        微信
                                                                    </c:if>
                                                                    <c:if test="${ordersInformation.payType==2}">
                                                                        其他
                                                                    </c:if>
                                                                </span>
                                                            </div>
                                                            <div class="skype-content">
                                                                <span class="contact-title">订单状态:</span>
                                                                <span class="contact-skype">
                                                                    <c:if test="${ordersInformation.orderStatus==0}">
                                                                        未支付
                                                                    </c:if>
                                                                    <c:if test="${ordersInformation.orderStatus==1}">
                                                                        已支付
                                                                    </c:if>
                                                                </span>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="custom-tab user-profile-tab">
                                                <ul class="nav nav-tabs" role="tablist">
                                                    <li role="presentation" class="active"><a href="#2" aria-controls="1" role="tab" data-toggle="tab" style="cursor: pointer">产品信息</a></li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div role="tabpanel" class="tab-pane active" id="2">
                                                        <div class="contact-information" style="margin: 10px 35px;">
                                                            <div class="phone-content">
                                                                <span class="contact-title">产品编号:</span>
                                                                <span class="phone-number">${ordersInformation.product.productId}</span>
                                                            </div>
                                                            <div class="address-content">
                                                                <span class="contact-title">产品名称:</span>
                                                                <span class="mail-address">${ordersInformation.product.productName}</span>
                                                            </div>
                                                            <div class="email-content">
                                                                <span class="contact-title">出发城市:</span>
                                                                <span class="contact-email">${ordersInformation.product.cityName}</span>
                                                            </div>
                                                            <div class="website-content">
                                                                <span class="contact-title">出发时间:</span>
                                                                <span class="contact-website"><fmt:formatDate value="${ordersInformation.product.departureTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                                            </div>
                                                            <div class="skype-content">
                                                                <span class="contact-title">产品价格:</span>
                                                                <span class="contact-skype">${ordersInformation.product.productPrice}</span>
                                                            </div>
                                                            <div class="skype-content">
                                                                <span class="contact-title">产品描述:</span>
                                                                <span class="contact-skype">${ordersInformation.product.productDesc}</span>
                                                            </div>
                                                            <div class="skype-content">
                                                                <span class="contact-title">产品状态:</span>
                                                                <span class="contact-skype">
                                                                    <c:if test="${ordersInformation.product.productStatus==0}">
                                                                        关闭
                                                                    </c:if>
                                                                    <c:if test="${ordersInformation.product.productStatus==1}">
                                                                        打开
                                                                    </c:if>
                                                                </span>
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
                        <div class="card alert">
                            <div class="card-body">
                                <div class="user-profile">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="custom-tab user-profile-tab">
                                                <ul class="nav nav-tabs" role="tablist">
                                                    <li role="presentation" class="active" ><a href="#3" aria-controls="1" role="tab" data-toggle="tab" style="cursor: pointer">游客信息</a></li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div role="tabpanel" class="tab-pane active" id="3">
                                                        <div class="col-lg-12">
                                                            <div class="card alert">
                                                                <div class="card-body">
                                                                    <table class="table table-responsive">
                                                                        <thead>
                                                                        <tr>
                                                                            <th>#</th>
                                                                            <th>游客编号</th>
                                                                            <th>游客姓名</th>
                                                                            <th>游客性别</th>
                                                                            <th>联系方式</th>
                                                                            <th>证件类型</th>
                                                                            <th>证件号码</th>
                                                                            <th style="text-align: center;vertical-align: middle">游客类型</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <c:forEach items="${ordersInformation.tourists}" begin="0" end="${ordersInformation.tourists.size()}" varStatus="stat">
                                                                            <tbody>
                                                                            <tr>
                                                                                <th scope="row">${stat.index+1}</th>
                                                                                <td>${ordersInformation.tourists[stat.index].passengerId}</td>
                                                                                <td>${ordersInformation.tourists[stat.index].passengerName}</td>
                                                                                <td>${ordersInformation.tourists[stat.index].passengerSex}</td>
                                                                                <td>${ordersInformation.tourists[stat.index].passengerPhoneNumber}</td>
                                                                                <td>
                                                                                    <c:if test="${ordersInformation.tourists[stat.index].credentialsType==0}">
                                                                                        身份证
                                                                                    </c:if>
                                                                                    <c:if test="${ordersInformation.tourists[stat.index].credentialsType==1}">
                                                                                        护照
                                                                                    </c:if>
                                                                                    <c:if test="${ordersInformation.tourists[stat.index].credentialsType==2}">
                                                                                        军官证
                                                                                    </c:if>
                                                                                </td>
                                                                                <td>${ordersInformation.tourists[stat.index].credentialsNum}</td>
                                                                                <td style="text-align: center;vertical-align: middle">
                                                                                    <c:if test="${ordersInformation.tourists[stat.index].passengerType==0}">
                                                                                        成人
                                                                                    </c:if>
                                                                                    <c:if test="${ordersInformation.tourists[stat.index].passengerType==1}">
                                                                                        儿童
                                                                                    </c:if>
                                                                                </td>
                                                                            </tr>
                                                                            </tbody>
                                                                        </c:forEach>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div><!-- /# column -->

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card alert">
                            <div class="card-body">
                                <div class="user-profile">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="custom-tab user-profile-tab">
                                                <ul class="nav nav-tabs" role="tablist">
                                                    <li role="presentation" class="active"><a href="#4" aria-controls="1" role="tab" data-toggle="tab" style="cursor: pointer">会员信息</a></li>
                                                </ul>
                                                <div id="invoice-bot">

                                                    <div class="invoice-info" style="margin-left: 35px"><br>
                                                        <h2>会员编号: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ordersInformation.memberid.memberidId}</h2>
                                                        <h2>会员姓名: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ordersInformation.memberid.memberidName}</h2>
                                                        <h2>会员昵称: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ordersInformation.memberid.nickName}</h2>
                                                        <h2>联系方式: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ordersInformation.memberid.phoneNum}</h2>
                                                        <h2>邮箱地址: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ordersInformation.memberid.email}</h2>
                                                    </div>
                                                    <div id="project" style="padding-top: 70px">
                                                        <p style="font-family: 'DejaVu Sans Mono';font-size: 15px">The time that flows, all become the beautiful ornament that the road is, look at the sky, see snow, in quiet, unspoken words are good scenery.</p>
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
</body>

</html>

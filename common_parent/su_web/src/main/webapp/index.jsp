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
    <link href="${pageContext.request.contextPath}/fontAwesome/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/themify-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/mmc-chat.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/lib/sidebar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/nixon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/lobipanel/css/lobipanel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>

<body>
<jsp:include page="WEB-INF/views/head.jsp"/>
<!-- END chat Sidebar-->
<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <h1>仪表盘</h1>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
                <div class="col-lg-4 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="#">仪表盘</a></li>
                                <li class="active">主页</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <!-- /# row -->
            <div class="main-content">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="stat-widget-two">
                                <div class="widget-icon color-1">
                                    <i class="fas fa-bullseye"></i>
                                </div>
                                <div class="stat-content">
                                    <div class="stat-text">今天的费用 </div>
                                    <div class="stat-digit"> <i class="fa fa-dollar-sign"></i>8500</div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="stat-widget-two">
                                <div class="widget-icon color-2">
                                    <i class="fas fa-credit-card"></i>
                                </div>
                                <div class="stat-content">
                                    <div class="stat-text">收入细节</div>
                                    <div class="stat-digit"> <i class="fa fa-dollar-sign"></i>7800</div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" style="width: 78%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="stat-widget-two">
                                <div class="widget-icon color-3">
                                    <i class="fas fa-tasks"></i>
                                </div>
                                <div class="stat-content">
                                    <div class="stat-text">任务已完成</div>
                                    <div class="stat-digit"> 500</div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="stat-widget-two">
                                <div class="widget-icon color-4">
                                    <i class="fas fa-users"></i>
                                </div>
                                <div class="stat-content">
                                    <div class="stat-text">今日访客</div>
                                    <div class="stat-digit"> 650</div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100" style="width: 65%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>销售 </h4>
                                <div class="card-header-right-icon">
                                    <ul>
                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                        <li class="card-collapse"><i class="fa fa-window-restore"></i></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sales-chart  card-content">
                                <canvas id="sales-chart"></canvas>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-6">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>团队总数已完成 </h4>
                                <div class="card-header-right-icon">
                                    <ul>
                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                        <li class="card-collapse"><i class="fa fa-window-restore"></i></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sales-chart card-content">
                                <canvas id="team-chart"></canvas>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>销售店</h4>
                                <div class="card-header-right-icon">
                                    <ul>
                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                        <li class="card-collapse"><i class="fa fa-window-restore"></i></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="datamap card-content">
                                <div id="world-datamap"></div>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-6">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>最近的销售 </h4>
                                <div class="card-header-right-icon">
                                    <ul>
                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                        <li class="card-option drop-menu">
                                            <i class="ti-settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="link"></i>
                                            <ul class="card-option-dropdown dropdown-menu">
                                                <li><a href="#"><i class="ti-loop"></i> 更新数据</a></li>
                                                <li><a href="#"><i class="ti-menu-alt"></i> 详细日志</a></li>
                                                <li><a href="#"><i class="ti-pulse"></i> 统计</a></li>
                                                <li><a href="#"><i class="ti-power-off"></i> 清楚的是</a></li>
                                            </ul>
                                        </li>
                                        <li class="card-collapse"><i class="fa fa-window-restore"></i></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body  card-content">
                                <table class="table table-responsive table-hover ">
                                    <thead>
                                    <tr>
                                        <th>姓名</th>
                                        <th>状态</th>
                                        <th>日期</th>
                                        <th>价钱</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>男子Kolor茶衬衫</td>
                                        <td><span class="badge badge-primary">拍卖</span></td>
                                        <td>一月 22</td>
                                        <td class="color-primary">$21.56</td>
                                    </tr>
                                    <tr>
                                        <td>Kolor女士茶衬衫</td>
                                        <td><span class="badge badge-success">税</span></td>
                                        <td>一月 30</td>
                                        <td class="color-success">$55.32</td>
                                    </tr>
                                    <tr>
                                        <td>婴儿的蓝色背包</td>
                                        <td><span class="badge badge-danger">扩展</span></td>
                                        <td>一月 25</td>
                                        <td class="color-danger">$14.85</td>
                                    </tr>
                                    <tr>
                                        <td>男子Kolor茶衬衫</td>
                                        <td><span class="badge badge-primary">拍卖</span></td>
                                        <td>一月 22</td>
                                        <td class="color-primary">$21.56</td>
                                    </tr>
                                    <tr>
                                        <td>Kolor女士茶衬衫</td>
                                        <td><span class="badge badge-success">税</span></td>
                                        <td>一月 30</td>
                                        <td class="color-success">$55.32</td>
                                    </tr>
                                    <tr>
                                        <td>婴儿的蓝色背包</td>
                                        <td><span class="badge badge-danger">扩展</span></td>
                                        <td>一月 25</td>
                                        <td class="color-danger">$14.85</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-4">
                        <div id="lobipanel-custom-control" class="card alert panel panel-default">
                            <div class="card-header">
                                <h4>浏览器统计 </h4>
                                <div class="card-header-right-icon">
                                    <ul>
                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body panel-body">
                                <table class="table table-responsive table-hover ">
                                    <tbody>
                                    <tr>
                                        <td class="no-border">Google Chrome</td>
                                        <td class="no-border"><span class="badge badge-primary">45%</span></td>
                                    </tr>
                                    <tr>
                                        <td>Mozila Firefox</td>
                                        <td><span class="badge badge-success">65%</span></td>
                                    </tr>
                                    <tr>
                                        <td>Safari</td>
                                        <td><span class="badge badge-danger">10%</span></td>
                                    </tr>
                                    <tr>
                                        <td>Opera Mini</td>
                                        <td><span class="badge badge-primary">29%</span></td>
                                    </tr>
                                    <tr>
                                        <td>Microsoft Edge</td>
                                        <td><span class="badge badge-success">95%</span></td>
                                    </tr>
                                    <tr>
                                        <td>Internet Explorer</td>
                                        <td><span class="badge badge-danger">25%</span></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>所有清单</h4>
                                <div class="card-header-right-icon">
                                    <ul>
                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="todo-list">
                                <div class="tdl-holder">
                                    <div class="tdl-content">
                                        <ul>
                                            <li>
                                                <label>
                                                    <input type="checkbox"><i></i><span>起床</span>
                                                    <a href='#' class="ti-close"></a>
                                                </label>
                                            </li>
                                            <li>
                                                <label>
                                                    <input type="checkbox" checked><i></i><span>站起来</span>
                                                    <a href='#' class="ti-close"></a>
                                                </label>
                                            </li>
                                            <li>
                                                <label>
                                                    <input type="checkbox"><i></i><span>不要放弃战斗。</span>
                                                    <a href='#' class="ti-close"></a>
                                                </label>
                                            </li>
                                            <li>
                                                <label>
                                                    <input type="checkbox" checked><i></i><span>做点别的</span>
                                                    <a href='#' class="ti-close"></a>
                                                </label>
                                            </li>
                                            <li>
                                                <label>
                                                    <input type="checkbox" checked><i></i><span>站起来</span>
                                                    <a href='#' class="ti-close"></a>
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                    <input type="text" class="tdl-new form-control" placeholder="Write new item and hit 'Enter'...">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>最近的评论 </h4>
                                <div class="card-header-right-icon">
                                    <ul>
                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recent-comment m-t-15">
                                <div class="media">
                                    <div class="media-left">
                                        <a href="#"><img class="media-object" src="${pageContext.request.contextPath}/images/avatar/1.jpg" alt="..."></a>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">约翰·多伊</h4>
                                        <p>明天胡萝卜NIBH在非怀孕。没有巧克力或胁迫照顾方便。</p>
                                        <div class="comment-action">
                                            <div class="badge badge-success">批准</div>
                                            <span class="m-l-10">
                                                 <a href="#"><i class="ti-check color-success"></i></a>
                                                 <a href="#"><i class="ti-close color-danger"></i></a>
                                                 <a href="#"><i class="fa fa-reply color-primary"></i></a>
                                             </span>
                                        </div>
                                        <p class="comment-date">五月 20, 2018</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <div class="media-left">
                                        <a href="#"><img class="media-object" src="${pageContext.request.contextPath}/images/avatar/2.jpg" alt="..."></a>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">Jane Roe</h4>
                                        <p>明天胡萝卜NIBH在非怀孕。没有巧克力或胁迫照顾方便。 </p>
                                        <div class="comment-action">
                                            <div class="badge badge-warning">有待</div>
                                            <span class="m-l-10">
                                             <a href="#"><i class="ti-check color-success"></i></a>
                                                 <a href="#"><i class="ti-close color-danger"></i></a>
                                             <a href="#"><i class="fa fa-reply color-primary"></i></a>
                                         </span>
                                        </div>
                                        <p class="comment-date">五月 20, 2018</p>
                                    </div>
                                </div>
                                <div class="media no-border">
                                    <div class="media-left">
                                        <a href="#"><img class="media-object" src="${pageContext.request.contextPath}/images/avatar/3.jpg" alt="..."></a>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">简先生</h4>
                                        <p>明天胡萝卜NIBH在非怀孕。没有巧克力或胁迫照顾方便。</p>
                                        <div class="comment-action">
                                            <div class="badge badge-danger">被拒绝</div>
                                            <span class="m-l-10">
                                         <a href="#"><i class="ti-check color-success"></i></a>
                                         <a href="#"><i class="ti-close color-danger"></i></a>
                                         <a href="#"><i class="fa fa-reply color-primary"></i></a>
                                     </span>
                                        </div>
                                        <div class="comment-date">五月 20, 2018</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->     </div>
            <!-- /# main content -->
        </div>
        <!-- /# container-fluid -->
    </div>
    <!-- /# main -->
</div>
<!-- /# content wrap -->
<script src="${pageContext.request.contextPath}/js/lib/jquery.min.js"></script>
<!-- jquery vendor -->
<script src="${pageContext.request.contextPath}/js/lib/jquery.nanoscroller.min.js"></script>
<!-- nano scroller -->
<script src="${pageContext.request.contextPath}/js/lib/sidebar.js"></script>
<!-- sidebar -->
<script src="${pageContext.request.contextPath}/js/lib/bootstrap.min.js"></script>
<!-- bootstrap -->
<script src="${pageContext.request.contextPath}/js/lib/mmc-common.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/mmc-chat.js"></script>
<!--  Chart js -->
<script src="${pageContext.request.contextPath}/js/lib/chart-js/Chart.bundle.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/chart-js/chartjs-init.js"></script>
<!-- // Chart js -->
<!--  Datamap -->
<script src="${pageContext.request.contextPath}/js/lib/datamap/d3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/datamap/topojson.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/datamap/datamaps.world.min.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/datamap/datamap-init.js"></script>
<script src="${pageContext.request.contextPath}/lib/lobipanel/js/lobipanel.js"></script>
<!-- // Datamap -->
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
<!-- scripit init-->
<script>
    $(document).ready(function() {
        $('#lobipanel-custom-control').lobiPanel({
                                                     reload: false,
                                                     close: false,
                                                     editTitle: false
                                                 });
    });
</script>
</body>

</html>

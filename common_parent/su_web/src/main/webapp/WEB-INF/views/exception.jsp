<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/8/16
  Time: 下午7:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Nixon : Widget</title>

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
    <link href="../fontAwesome/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="../css/lib/themify-icons.css" rel="stylesheet">
    <link href="../css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="../css/lib/nixon.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
</head>

<body class="">

<div class="container">
    <div class="row">
        <div class="col-md-12 column">
            <div class="container text-center">
                <div style="font-family:Courier New;font-size: 1.7em;">发现异常</div>
                <h1 style="font-family: Courier New;font-size: 1.5em;">异常的内容是:${requestScope.exception}</h1><br>
                <a class="btn btn-primary" href="javascript:history.back()">
                    <i class=""></i>返回
                </a>
            </div>
        </div>
    </div>
</div>
</body>

</html>

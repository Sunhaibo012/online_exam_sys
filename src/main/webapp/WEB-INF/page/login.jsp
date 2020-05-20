<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="loginHtml">
<head>
    <meta charset="utf-8">
    <title>在线考试系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
<%--    <link rel="icon" href="https://static.mysiteforme.com/866ac55f-b471-40cf-a794-db73128c8fcd.ico">--%>
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="/static/css/login.css" media="all"/>
</head>
<body>
<div id="bg-body"></div>
<div class="login">
    <h1>在线考试系统登录</h1>
    <form class="layui-form" action="/login" method="post">
        <div class="layui-form-item">
            <input class="layui-input" name="username"  placeholder="请输入用户名" lay-verify="required"
                   type="text"
                   autocomplete="off">
        </div>
        <div class="layui-form-item">
            <input class="layui-input" name="password"  placeholder="请输入密码" lay-verify="required"
                   type="password" autocomplete="off">
        </div>
        <div class="layui-form-item form_code">
            <input class="layui-input" name="code" placeholder="验证码" lay-verify="required" type="text"
                   autocomplete="off">
            <div class="code"><img src="/genCaptcha" width="116" height="36" id="mycode"></div>
        </div>
        <div class="layui-form-item">
            <input type="checkbox" name="rememberMe" value="true" lay-skin="primary" checked title="记住帐号?">
        </div>
        <div class="layui-form-item">
            <input type="button" class="layui-btn fa-registered" value="去注册"  onclick="register()"></input>
            <button class="layui-btn fa-registered" lay-submit="" lay-filter="login"
                    style="margin-left: 90px; width: 74px">登录</button>
        </div>
    </form>
</div>
<script type="text/javascript" src="/static/layui/layui.js"></script>
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/login.js"></script>
<script>
    function register() {
        window.location.href ="/register";
    }
</script>
</body>
</html>
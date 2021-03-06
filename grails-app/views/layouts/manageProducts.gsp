<%@ page import="flying2.User" %>
<!doctype html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <asset:link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <title><g:layoutTitle/>  作品管理</title>
    <meta name="keywords" content="${keywords}">
    <meta name="description" content="${description}">
    <asset:stylesheet src="application.css"/>
    %{--<asset:stylesheet src="app/mySpace/mySpace.css"/>--}%
    <g:layoutHead/>
</head>

<body>
<div id="container">
    <div id="body">
        <nav class="navbar navbar-default fly-nav">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/">天空视角</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    %{--<ul class="nav navbar-nav">--}%
                        %{--<li ${params.action == "index" && params.type == "" ? "class=active" : ""}><a--}%
                                %{--href="/index">最新</a></li>--}%
                        %{--<li ${params.action == "index" && params.type == "Gif" ? "class=active" : ""}><a--}%
                                %{--href="/indexGif">动图</a></li>--}%
                        %{--<li><a href="/photoVs">起飞表情</a></li>--}%
                    %{--</ul>--}%
                    <ul class="nav navbar-nav">
                        <li ${params.action=="index"?"class=active":""}><g:link controller="show" action="index">首页 <span class="sr-only">(current)</span></g:link></li>
                        <li ${params.action=="productList"&&params.type=="photo"?"class=active":""}><g:link controller="show" action="productList" params="[type: 'photo']">图片</g:link></li>
                        <li ${params.action=="productList"&&params.type=="video"?"class=active":""}><g:link controller="show" action="productList" params="[type: 'video']">视频</g:link></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <g:if test="${session.user}">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-haspopup="true" aria-expanded="false">
                                    <g:set var="curUser" value="${flying2.User.get(session.user?.id)}"/>
                                    <g:if test="${curUser.headImg}">
                                        <img class="middle-thumb avatar" src="/show/headImg?img=${curUser.folder}/${curUser.headImg}"/>
                                    </g:if>
                                    <g:else>
                                        <asset:image class="middle-thumb avatar" id="userHead" src="header.jpg"/>
                                    </g:else>

                                    ${curUser.username}
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="${params.action=="home"?"active":""}"><g:link controller="mySpace" action="home"><span class="glyphicon glyphicon-user"></span> 我的空间</g:link></li>
                                    <li><g:link controller="creation" action="createProduct" params="[type: 'photo']"><span class="glyphicon glyphicon-picture"></span> 创建图片</g:link></li>
                                    <li><g:link controller="creation" action="createProduct" params="[type: 'video']"><span class="glyphicon glyphicon-film"></span> 创建视频</g:link></li>
                                    <li><g:link controller="account" action="logOut"><span class="glyphicon glyphicon-log-out"></span> 退出</g:link></li>
                                </ul>
                            </li>
                        </g:if>
                        <g:else>
                            <g:if test="${params.action != "login"}">
                                <g:if test="${params.action != "register"}">
                                    <li><a data-toggle="modal" data-target="#myModal" href="javascript:void(0)">登录</a>
                                    </li>
                                </g:if>
                                <g:else>
                                    <li><a href="/login">登录</a></li>
                                </g:else>
                            </g:if>
                            <li><a href="/register">注册</a></li>
                        </g:else>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <h3>作品管理</h3>
            <div class="row">
                <div class="col-md-2">
                    <div class="list-group box-shadow">
                        <g:link action="allProducts" class="list-group-item ${params.action=="allProducts"?"active":""}">所有作品</g:link>
                    </div>
                    <div class="panel panel-default box-shadow">
                        <div class="panel-heading">创建新作品</div>
                        <div class="list-group">
                            <g:link controller="creation" action="createProduct" params="[type: 'photo']" class="list-group-item ${params.action=="security"?"active":""}"><span class="glyphicon glyphicon-picture"></span> 创建图片</g:link>
                            <g:link controller="creation" action="createProduct" params="[type: 'video']" class="list-group-item ${params.action=="security"?"active":""}"><span class="glyphicon glyphicon-film"></span> 创建视频</g:link>
                        </div>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="panel panel-default box-shadow">
                        <div class="panel-body">
                            <g:layoutBody/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer" id="footer">
        <!--<p><strong>Footer</strong> (always at the bottom). View more <a href="http://matthewjamestaylor.com/blog/-website-layouts">website layouts</a> and <a href="http://matthewjamestaylor.com/blog/-web-design">web design articles</a>.</p>-->
        <div class="container">
            Copyright © 2016,www.flyttg.com ,All rights reserved 版权所有
        </div>
    </div>
    <g:if test="${!session.user && params.action != "login"}">
        <div class="modal fade" id="myModal">
            <div class="modal-dialog">
                <div class="row">
                    <div class="col-md-offset-2 col-md-8">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <g:render template="/account/login"/>
                    </div>
                </div>
            </div>
        </div>
    </g:if>
</div>
<asset:javascript src="application.js"/>
<asset:javascript src="jquery-validate-1.13.1/jquery.validate.js"/>
<g:if test="${!session.user && params.action != "login"}">
    <asset:javascript src="app/show/login.js"/>
</g:if>
<g:applyLayout name="footerLayout">
    <g:pageProperty name="page.footer"/>
</g:applyLayout>
</body>
</html>

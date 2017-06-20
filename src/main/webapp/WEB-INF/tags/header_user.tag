<%@tag import="br.edu.ifgoiano.modelo.Usuario"%>
<%@attribute name="title" required="true" %>
<%@attribute name="titlePage" required="true" %>
<%@attribute name="caminho" required="true"%>

<%
    Usuario usuarioLogado = (Usuario) session.getAttribute("user_logado");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>${title}</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="${caminho}/img/icons/favicon.ico">
        <link rel="apple-touch-icon" href="${caminho}/img/icons/favicon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="${caminho}/img/icons/favicon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="${caminho}/img/icons/favicon-114x114.png">
        <!--Loading bootstrap css-->
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/jquery-ui-1.10.4.custom.min.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/animate.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/all.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/main.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/style-responsive.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/zabuto_calendar.min.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/pace.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/jquery.news-ticker.css">
    </head>
    <body>
        <div>
            <!--BEGIN BACK TO TOP-->
            <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
            <!--END BACK TO TOP-->

            <!--BEGIN TOPBAR-->
            <div id="header-topbar-option-demo" class="page-header-topbar">
                <nav id="topbar" role="navigation" style="margin-bottom: 0" data-step="3" class="navbar navbar-default navbar-static-top">
                    <div class="topbar-main" style="background-color: #004200">
                        <a class="navbar-brand" href="#" style="padding: 8px">
                            <img alt="Brand" src="../resources/img/botanica/cropped-folha.png"
                                 style="width: 30px;height: 35px">
                        </a>                        
                        <p class="navbar-text navbar-left" style="color: white; margin-left: 10px">BotaniQuiz</p>
                        <p class="navbar-text navbar-right" style="color: white; margin-right: 10px">Olá, <%= usuarioLogado.getNome() %>!</p>
                    </div>
                </nav>
            </div>
            <!--END TOPBAR-->

            <div id="container">
                <!--BEGIN PAGE WRAPPER-->
                <div id="page-container">
                    <!--BEGIN TITLE & BREADCRUMB PAGE-->
                    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                        <div class="page-header pull-left">
                            <div class="page-title">${titlePage}</div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <!--END TITLE & BREADCRUMB PAGE-->

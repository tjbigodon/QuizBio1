<%@attribute name="title" required="true" %>
<%@attribute name="titlePage" required="true" %>
<%@attribute name="usuario" required="true" %>
<%@attribute name="caminho" required="true"%>

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
        <link type="text/css" rel="stylesheet" href="${caminho}styles/jquery-ui-1.10.4.custom.min.css">
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
                <nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3" class="navbar navbar-default navbar-static-top">
                    <div class="navbar-header">
                        <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                        <a id="logo" href="index.html" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">SisCoor</span><span style="display: none" class="logo-text-icon">µ</span></a></div>
                    <div class="topbar-main"><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a>

                        <form id="topbar-search" action="" method="" class="hidden-sm hidden-xs">
                            <div class="input-icon right text-white"><a href="#"><i class="fa fa-search"></i></a><input type="text" placeholder="Search here..." class="form-control text-white"/></div>
                        </form>
                        <ul class="nav navbar navbar-top-links navbar-right mbn">
                            <li class="dropdown topbar-user">
                                <a data-hover="dropdown" href="#" class="dropdown-toggle">
                                    <img src="${caminho}/img/avatar/48.jpg" alt="" class="img-responsive img-circle"/>&nbsp;
                                    <span class="hidden-xs">${usuario}</span>&nbsp;
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-user pull-right">
                                    <li><a href="#"><i class="fa fa-user"></i>My Profile</a></li>
                                    <li><a href="#"><i class="fa fa-calendar"></i>My Calendar</a></li>
                                    <li><a href="#"><i class="fa fa-envelope"></i>My Inbox<span class="badge badge-danger">3</span></a></li>
                                    <li><a href="#"><i class="fa fa-tasks"></i>My Tasks<span class="badge badge-success">7</span></a></li>
                                    <li class="divider"></li>
                                    <li><a href="#"><i class="fa fa-lock"></i>Lock Screen</a></li>
                                    <li><a href="Login.html"><i class="fa fa-key"></i>Log Out</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
                <!--BEGIN MODAL CONFIG PORTLET-->
                <div id="modal-config" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" data-dismiss="modal" aria-hidden="true" class="close">
                                    &times;</button>
                                <h4 class="modal-title">
                                    Modal title</h4>
                            </div>
                            <div class="modal-body">
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eleifend et nisl eget
                                    porta. Curabitur elementum sem molestie nisl varius, eget tempus odio molestie.
                                    Nunc vehicula sem arcu, eu pulvinar neque cursus ac. Aliquam ultricies lobortis
                                    magna et aliquam. Vestibulum egestas eu urna sed ultricies. Nullam pulvinar dolor
                                    vitae quam dictum condimentum. Integer a sodales elit, eu pulvinar leo. Nunc nec
                                    aliquam nisi, a mollis neque. Ut vel felis quis tellus hendrerit placerat. Vivamus
                                    vel nisl non magna feugiat dignissim sed ut nibh. Nulla elementum, est a pretium
                                    hendrerit, arcu risus luctus augue, mattis aliquet orci ligula eget massa. Sed ut
                                    ultricies felis.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" data-dismiss="modal" class="btn btn-default">
                                    Close</button>
                                <button type="button" class="btn btn-primary">
                                    Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--END MODAL CONFIG PORTLET-->
            </div>
            <!--END TOPBAR-->

            <div id="wrapper">
                <!--BEGIN SIDEBAR MENU-->
                <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
                     data-position="right" class="navbar-default navbar-static-side">
                    <div class="sidebar-collapse menu-scroll">
                        <ul id="side-menu" class="nav">

                            <div class="clearfix"></div>
                            <li class="active"><a href="../SisCoorWeb/logado.jsp"><i class="fa fa-tachometer fa-fw">
                                        <div class="icon-bg bg-orange"></div>
                                    </i><span class="menu-title">In�cio</span></a></li>

                            <li><a href="uso_laboratorio/uso_laboratorio_criar.jsp"><i class="fa fa-desktop fa-fw">
                                        <div class="icon-bg bg-pink"></div>
                                    </i><span class="menu-title">Uso de Laborat�rio</span></a></li>

                            <li><a href="horario_de_aulas/selecao_de_curso.jsp"><i class="fa fa-calendar fa-fw">
                                        <div class="icon-bg bg-green"></div>
                                    </i><span class="menu-title">Hor�rio de Aulas</span></a></li>

                            <li><a href="proposta_de_tc/menu_ptc.jsp"><i class="fa fa-file-text-o fa-fw">
                                        <div class="icon-bg bg-violet"></div>
                                    </i><span class="menu-title">Proposta de Trabalho de Curso</span></a></li>

                            <li><a href="defesa_de_tc/defesa_de_tc.jsp"><i class="fa fa-book fa-fw">
                                        <div class="icon-bg bg-violet"></div>
                                    </i><span class="menu-title">Defesa de Trabalho de Curso</span></a></li>
                                    
                            <li><a href="gerenciar_conteudo/menu_conteudo.jsp"><i class="fa fa-cogs fa-fw">
                                        <div class="icon-bg bg-violet"></div>
                                    </i><span class="menu-title">Gerenciar Conte�do</span></a></li>

                            <!--
                            <li><a href="Tables.html"><i class="fa fa-th-list fa-fw">
                                <div class="icon-bg bg-blue"></div>
                            </i><span class="menu-title">Tables</span></a>
                                  
                            </li>
                            <li><a href="DataGrid.html"><i class="fa fa-database fa-fw">
                                <div class="icon-bg bg-red"></div>
                            </i><span class="menu-title">Data Grids</span></a>
                              
                            </li>
                            <li><a href="Pages.html"><i class="fa fa-file-o fa-fw">
                                <div class="icon-bg bg-yellow"></div>
                            </i><span class="menu-title">Pages</span></a>
                               
                            </li>
                            <li><a href="Extras.html"><i class="fa fa-gift fa-fw">
                                <div class="icon-bg bg-grey"></div>
                            </i><span class="menu-title">Extras</span></a>
                              
                            </li>
                            <li><a href="Dropdown.html"><i class="fa fa-sitemap fa-fw">
                                <div class="icon-bg bg-dark"></div>
                            </i><span class="menu-title">Multi-Level Dropdown</span></a>
                              
                            </li>
                            <li><a href="Email.html"><i class="fa fa-envelope-o">
                                <div class="icon-bg bg-primary"></div>
                            </i><span class="menu-title">Email</span></a>
                              
                            </li>
                            <li><a href="Charts.html"><i class="fa fa-bar-chart-o fa-fw">
                                <div class="icon-bg bg-orange"></div>
                            </i><span class="menu-title">Charts</span></a>
                               
                            </li>
                            <li><a href="Animation.html"><i class="fa fa-slack fa-fw">
                                <div class="icon-bg bg-green"></div>
                            </i><span class="menu-title">Animations</span></a></li>
                            -->
                        </ul>
                    </div>
                </nav>
                <!--END SIDEBAR MENU-->

                <!--BEGIN PAGE WRAPPER-->
                <div id="page-wrapper">
                    <!--BEGIN TITLE & BREADCRUMB PAGE-->
                    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                        <div class="page-header pull-left">
                            <div class="page-title">${titlePage}</div>
                        </div>
                        <ol class="breadcrumb page-breadcrumb pull-right">
                            <li><i class="fa fa-home"></i>&nbsp;<a href="../SisCoorWeb/logado.jsp">In�cio</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                            <li class="hidden"><a href="#">Dashboard</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                            <li class="active">${titlePage}</li>
                        </ol>
                        <div class="clearfix">
                        </div>
                    </div>
                    <!--END TITLE & BREADCRUMB PAGE-->

                    <!--BEGIN CONTENT-->


                    <!-- Conte�do aqui -->


                    <!--END CONTENT-->


<%-- 
    Document   : index
    Created on : 17/062017, 21:39:17
    Author     : Tarcisio & Jehymison
--%>
<%@page import="br.edu.ifgoiano.modelo.Usuario"%>
<%if(session.getAttribute("user_logado")!=null){
    Usuario usr = (Usuario)session.getAttribute("user_logado");
    
    if(usr.getTipo()==0){
        response.sendRedirect("user/index.jsp");
    } else{
        response.sendRedirect("admin/index.jsp");
    }
}%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:header_inicio title="BotaniQuiz - Login" titlePage="BotaniQuiz | Login" caminho="resources"/>

<tag:conteudoInicio />
<%if (session.getAttribute("erro_login") != null) {
if (session.getAttribute("erro_login").equals("deslogado")) {%>
<div id="alert" class="alert alert-success col-lg-12" role="alert" style="text-align: center">
    <strong>Você saiu da sessão com sucesso.</strong>
    <%
        session.setAttribute("erro_login", null);
    %>
</div>
  
<%}else if (session.getAttribute("erro_login").equals("nao_existe")) {%>
<div id="alert_danger" class="alert alert-danger col-lg-12" role="alert" style="text-align: center">
    <strong>Usuário não cadastrado! Faça seu cadastro clicando <a href="cadastro.jsp">aqui!</a></strong>
    <%session.setAttribute("erro_login", null);%>
</div>
<%} else if (session.getAttribute("erro_login").equals("incorreto")) {%>
<div id="alert_danger" class="alert alert-danger col-lg-12" role="alert" style="text-align: center">
    <strong>Nome de usuário e/ou senha incorreto(s)!</strong>
    <%session.setAttribute("erro_login", null);%>
</div>
<%} else if (session.getAttribute("erro_login").equals("vazio")) {%>
<div id="alert_danger" class="alert alert-danger col-lg-12" role="alert" style="text-align: center">
    <strong>Preencha todos os campos!</strong>
    <%session.setAttribute("erro_login", null);%>
</div>
<%}
}%>
<tag:open_coluna tamanho="12"/>

<center>
    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" style="align-content: center">
        <img src="resources/img/botanica/cropped-folha.png" width="100">
    </div>
    <div class="row"></div>
    <br>

    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" style="align-content: center">
        <h2>Bem vindo(a)!</h2><br><br>

        <div class="col-lg-3 col-md-3 col-sm-0"></div>

        <div class="col-lg-6 col-md-6 col-sm-12">

            <div class="panel-body pan">
                <form action="UsuarioServlet" method="post" class="form-horizontal">
                    <div class="form-body pal">
                        <div class="form-group">
                            
                            <div class="col-md-12">
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input name="usuario" placeholder="Nome de Usuário" class="form-control" type="text"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12" style="text-align: right">
                                <div class="input-icon right">
                                    <i class="fa fa-lock"></i>
                                    <input name="senha" placeholder="Senha" class="form-control" type="password"></div>
                                    <span class="help-block mbn"><a href="cadastro.jsp"><strong>Cadastre-se!</strong></a></span>
                            </div>
                        </div>
                        
                        <div style="text-align: center" class="col-lg-12 col-md-6 col-sm-0">
                            <hr style="border-top-color: #cbcdcf"/>
                        </div>
                    </div>
                    
                    
                    <div class="form-actions pal" style="background-color: #f0f2f5">
                        <div class="form-group mbn" style="text-align: right; padding: 0; margin: 0">
                            <div class="col-md-offset-3 col-md-6">
                                <input type="submit" name="btn" value="Entrar" class="btn btn-primary"/>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

        </div>

        <div class="col-lg-3 col-md-3 col-sm-0"></div>
    </div>
</center>
<tag:close_coluna/>
<tag:conteudoFim />
<tag:footer ano="2017" versao="1.0" caminho="resources"
                desenvolvedores="Diego Fonseca Pereira, Jehymison Gil A. Oliveira, Naiane Maria de Sousa e Tarcísio Ribeiro Junior"/>

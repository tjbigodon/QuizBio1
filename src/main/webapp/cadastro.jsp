<%-- 
    Document   : index
    Created on : 17/062017, 21:39:17
    Author     : Tarcisio & Jehymison
--%>

<%if (session.getAttribute("nomeUsuario") != null) {
        response.sendRedirect("logado.jsp");
    }%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:header_inicio title="BioQuiz - Cadastro" titlePage="BioQuiz Web | Cadastro" caminho="resources"/>

<tag:conteudoInicio />
<%if (session.getAttribute("erro_cadastro") != null) {%>
<%if (session.getAttribute("erro_cadastro").equals("false")) {%>
<div id="alert" class="alert alert-success col-lg-12" role="alert" style="text-align: center">
    <strong>Cadastro efetuado com sucesso!</strong>
    <%
        session.setAttribute("erro_cadastro", null);
    %>
</div>
<%} else if (session.getAttribute("erro_cadastro").equals("bd")) {%>
<div id="alert_danger" class="alert alert-danger col-lg-12" role="alert" style="text-align: center">
    <strong>Erro no banco de dados! Entre em contato com os administradores.</strong>
    <%session.setAttribute("erro_cadastro", null);%>
</div>
<%} else if (session.getAttribute("erro_cadastro").equals("senha_dif")) {%>
<div id="alert_danger" class="alert alert-danger col-lg-12" role="alert" style="text-align: center">
    <strong>As senhas digitadas não conferem!</strong>
    <%session.setAttribute("erro_cadastro", null);%>
</div>
<%} else if (session.getAttribute("erro_cadastro").equals("email_inv")) {%>
<div id="alert_danger" class="alert alert-danger col-lg-12" role="alert" style="text-align: center">
    <strong>Digite um e-mail válido!</strong>
    <%session.setAttribute("erro_cadastro", null);%>
</div>
<%} else {%>
<div id="alert_danger" class="alert alert-danger col-lg-12" role="alert" style="text-align: center">
    <strong>Preencha todos os campos!</strong>
    <%session.setAttribute("erro_cadastro", null);%>
</div>
<%}%>
<%}%>
<tag:open_coluna tamanho="12"/>

<center>
    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" style="align-content: center">
        <img src="resources/img/botanica/cropped-folha.png" width="100">
    </div>
    <div class="row"></div>
    <br>

    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" style="align-content: center">
        <h2>Cadastre-se</h2><br><br>
        <div class="col-lg-3">            
        </div>
        <div class="col-lg-6">
            <form action="UsuarioServlet" method="POST">
                <div class="form-body pal">
                    <div class="form-group">
                        <div class="input-icon right">
                            <i class="fa fa-user"></i>
                            <input name="nickUsu" placeholder="Nome de Usuário" class="form-control" type="text"></div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon right">
                            <i class="fa fa-envelope"></i>
                            <input name="emailUsu" placeholder="Email" class="form-control" type="text"></div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon right">
                            <i class="fa fa-lock"></i>
                            <input name="senhaUsu" placeholder="Senha" class="form-control" type="password"></div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon right">
                            <i class="fa fa-lock"></i>
                            <input name="confSenhaUsu" placeholder="Confirme a senha" class="form-control" type="password"></div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input name="nomeUsu" placeholder="Primeiro Nome" class="form-control" type="text"></div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input name="sobrenomeUsu" placeholder="Último Nome" class="form-control" type="text"></div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-12 col-sm-0">
                        <hr style="border-top-color: #cbcdcf"/>
                    </div>
                    <div style="text-align: right">
                        <a href="index.jsp">Já possuo cadastro!</a>
                    </div>
                </div>                    
                <div class="form-actions text-right pal" style="background-color: #f0f2f5">
                    <input type="submit" class="btn btn-primary" name="btn" value="Cadastrar" />                        
                </div>
            </form>
        </div>

    </div>
    <div class="col-lg-3">            
    </div>
</center>

<tag:close_coluna/>
<tag:conteudoFim />
<tag:footer ano="2017" versao="1.0" caminho="resources"
            desenvolvedores="Diego Fonseca Pereira, Jehymison Gil A. Oliveira, Naiane Maria de Sousa e Tarcísio Ribeiro Junior"/>

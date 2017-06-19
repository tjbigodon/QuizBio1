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
<tag:headerHome_inicio title="BioQuiz - Login" titlePage="BioQuiz Web | Login" caminho="resources"/>

<tag:conteudoInicio />
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
                <form action="#" class="form-horizontal">
                    <div class="form-body pal">
                        <div class="form-group">
                            <label for="inputName" class="col-md-3 control-label">
                                Usuário: </label>
                            <div class="col-md-6">
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input id="inputName" name="usuario" placeholder="Nome de Usuário" class="form-control" type="text"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword" class="col-md-3 control-label">
                                Senha: </label>
                            <div class="col-md-6" style="text-align: right">
                                <div class="input-icon right">
                                    <i class="fa fa-lock"></i>
                                    <input id="inputPassword" name="senha" placeholder="Senha" class="form-control" type="password"></div>
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
                                <button type="submit" class="btn btn-primary">
                                    Entrar</button>
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
<tag:footerHome ano="2017" versao="1.0" caminho="resources"
                desenvolvedores="Diego Fonseca Pereira, Jehymison Gil A. Oliveira, Naiane Maria de Sousa e Tarcísio Ribeiro Junior"/>

<%-- 
    Document   : index
    Created on : 17/062017, 21:39:17
    Author     : Tarcisio & Jehymison
--%>

<%if(session.getAttribute("nomeUsuario")!=null){
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
        <div class="col-lg-3">            
        </div>
        <div class="col-lg-6">
        </div>
        <div class="col-lg-3">            
        </div>
    </div>
</center>
<tag:close_coluna/>
<tag:conteudoFim />
<tag:footerHome ano="2017" versao="1.0" caminho="resources"
                desenvolvedores="Diego Fonseca Pereira, Jehymison Gil A. Oliveira, Naiane Maria de Sousa e Tarcísio Ribeiro Junior"/>

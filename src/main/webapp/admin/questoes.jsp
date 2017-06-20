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
<tag:header_admin title="BioQuiz - Administração" titlePage="BioQuiz Web | Questões" caminho="../resources"/>

<tag:conteudoInicio />
<tag:open_coluna tamanho="12"/>

<!-- Tabela de Inserção -->
<div class="col-lg-6 col-md-6 col-sm-12">
    <div class="panel panel-green">
        <div class="panel-heading">
            Cadastro de Questões</div>
        <div class="panel-body pan">
            <form action="#">
                <div class="form-body pal">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-icon right">
                                    <i class="fa fa-ticket"></i>
                                    <input type="text" placeholder="Título da Questão" class="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputMessage" class="control-label">
                            Questão
                        </label>
                        <textarea rows="5" class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="inputSubject" class="control-label">
                            Alternativas</label>
                        <div class="input-icon right">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    A)
                                    <input type="radio" name="radio_quest"/></span>
                                <input type="text" placeholder="" class="form-control"/>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    B)
                                    <input type="radio" name="radio_quest"/></span>
                                <input type="text" placeholder="" class="form-control"/>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    C)
                                    <input type="radio" name="radio_quest"/></span>
                                <input type="text" placeholder="" class="form-control"/>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    D)
                                    <input type="radio" name="radio_quest"/></span>
                                <input type="text" placeholder="" class="form-control"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions text-right pal">
                        <button type="submit" class="btn btn-primary">
                            Cadastrar</button>
                    </div>
            </form>
        </div>
    </div>
</div>
</div>
<!-- Fim da Inserção -->

<!-- Tabela de RUD -->
<div class="col-lg-6 col-md-6 col-sm-12">

</div>
<!-- Fim da Inserção -->

<tag:close_coluna/>
<tag:conteudoFim />
<tag:footer ano="2017" versao="1.0" caminho="resources"
            desenvolvedores="Diego Fonseca Pereira, Jehymison Gil A. Oliveira, Naiane Maria de Sousa e Tarcísio Ribeiro Junior"/>

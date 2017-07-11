<%-- 
    Document   : index
    Created on : 17/062017, 21:39:17
    Author     : Tarcisio & Jehymison
--%>
<%@page import="java.util.Random"%>
<%@page import="br.edu.ifgoiano.modelo.Resposta"%>
<%@page import="br.edu.ifgoiano.modelo.Pergunta"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifgoiano.persistencia.RespostaDao"%>
<%@page import="br.edu.ifgoiano.persistencia.PerguntaDao"%>
<%@page import="br.edu.ifgoiano.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<%
    Usuario usr = (Usuario) session.getAttribute("user_logado");
    PerguntaDao pega_questão = new PerguntaDao();
    RespostaDao pega_resposta = new RespostaDao();
    String sessao = (String) session.getAttribute("NovoQuiz");
    String[] questoes = sessao.split("_");
    Pergunta pgt = new Pergunta();

    if (questoes[questoes.length - 1].contains("-") || sessao == null) {
        response.sendRedirect("QuizServlet");
    } else {
        pgt = pega_questão.getPergunta(Integer.parseInt(questoes[questoes.length - 1]));
    }
    List<Resposta> resposta = pega_resposta.pesquisarPergunta(Integer.parseInt(questoes[questoes.length - 1]));
%>
<%if (session.getAttribute("user_logado") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        if (usr.getTipo() == 1) {
            response.sendRedirect("../index.jsp");
        }
    }%>
<%if (usr.getTipo() == 0) {%>
<tag:header_user_root title="BotaniQuiz - Questões" titlePage="BotaniQuiz | Questões" caminho="resources" paramVolta="user/"/>
<%} else {%>
<tag:header_admin_root title="BotaniQuiz - Questões" titlePage="BotaniQuiz | Qusetões" caminho="resources"/>
<%}%>

<tag:conteudoInicio />


<!--Mostra Questão-->
<div class="col-lg-2"></div>
<div class="col-lg-8">


    <!-- Carrega a Questão na tela -->

    <div class="col-lg-12">
        <div class="panel panel-green">
            <div class="panel-heading">
                Questão</div>
            <div class="panel-body pan">
                <form action="QuizServlet" method="POST">
                    <div class="form-body pal">                    
                        <div class="form-group">
                            <div class="text-justify">
                                <strong>
                                    <h3>
                                        <%=pgt.getQuestao()%>                                        
                                    </h3>
                                </strong>
                            </div>                            
                        </div>
                        <% System.out.println(pgt.getId());%>
                        <br><br>
                        <div class="form-group text-left">
                            <div class="input-icon right">
                                <div class="input-group" style="margin: 5px;">
                                    <span class="input-group-addon " style="text-align: left; color: black; background-color: rgba(0,0,0,0)">
                                        <input id="opA" type="radio" name="resposta" value="<%= resposta.get(0).getId()%>" style="text-align: left"/>
                                        A)
                                        <label for="opA" class="control-label">
                                            <%=resposta.get(0).getResposta()%>
                                        </label>
                                    </span>                                    
                                </div>

                                <div class="input-group" style="margin: 5px">
                                    <span class="input-group-addon" style="text-align: left; color: black; background-color: rgba(0,0,0,0)">
                                        <input id="opB" type="radio" name="resposta" value="<%= resposta.get(1).getId()%>" style="text-align: left"/>
                                        B)
                                        <label for="opB" class="control-label">
                                            <%=resposta.get(1).getResposta()%>
                                        </label>

                                    </span>
                                </div>

                                <div class="input-group" style="margin: 5px">
                                    <span class="input-group-addon" style="text-align: left; color: black; background-color: rgba(0,0,0,0)">
                                        <input id="opC" type="radio" name="resposta" value="<%= resposta.get(2).getId()%>" style="text-align: left"/>
                                        C)
                                        <label for="opC" class="control-label">
                                            <%=resposta.get(2).getResposta()%>
                                        </label>

                                    </span>
                                </div>

                                <div class="input-group" style="margin: 5px">
                                    <span class="input-group-addon" style="text-align: left; color: black; background-color: rgba(0,0,0,0)">
                                        <input id="opD" type="radio" name="resposta" value="<%= resposta.get(3).getId()%>" style="text-align: left"/>
                                        D)
                                        <label for="opD" class="control-label">
                                            <%=resposta.get(3).getResposta()%>
                                        </label>

                                    </span>
                                </div>

                                <div class="input-group" style="margin: 5px; text-align: right">
                                    <span class="input-group-addon" style="text-align: left; align-items: flex-end; color: black; background-color: rgba(0,0,0,0)">
                                        <input id="opE" type="radio" name="resposta" value="<%= resposta.get(4).getId()%>" style="text-align: left"/>
                                        E)
                                        <label for="opE" class="control-label">
                                            <%=resposta.get(4).getResposta()%>
                                        </label>

                                    </span>
                                </div>
                                <div class="small" style="text-align: right">
                                    Obs.:Marque somente a resposta correta.
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12 col-sm-12 col-md-12">
                            <div class="col-lg-5 col-sm-12 col-md-3">
                            </div>                        
                            <div class="col-lg-3 col-sm-12 col-md-5">
                                <div class="form-actions text-center pal">
                                    <a href="QuizServlet">
                                        <button class="btn btn-danger" style="width: 18ch"
                                                value="proximo" name="btn">Próximo
                                        </button>  
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Carrega a Questão na tela -->

    <div class="col-lg-2">
    </div>
</div> 
<!--Mostra Questão-->

<tag:conteudoFim />

<%if (usr.getTipo() == 0) {%>
<tag:footer ano="2017" versao="1.0" caminho="resources"
            desenvolvedores="Diego Fonseca Pereira, Jehymison Gil A. Oliveira, Naiane Maria de Sousa e Tarcísio Ribeiro Junior"/>
<%} else {%>
<tag:footer ano="2017" versao="1.0" caminho="../resources"
            desenvolvedores="Diego Fonseca Pereira, Jehymison Gil A. Oliveira, Naiane Maria de Sousa e Tarcísio Ribeiro Junior"/>
<%}%>
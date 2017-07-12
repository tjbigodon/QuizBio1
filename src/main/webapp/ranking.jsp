<%-- 
    Document   : index
    Created on : 17/062017, 21:39:17
    Author     : Tarcisio & Jehymison
--%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifgoiano.persistencia.PontuacaoDao"%>
<%@page import="br.edu.ifgoiano.modelo.Pontuacao"%>
<%@page import="br.edu.ifgoiano.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<%
    Usuario usr = (Usuario) session.getAttribute("user_logado");
%>
<%if (usr.getTipo() == 0) {%>
<tag:header_user_root title="BotaniQuiz - Ranking" titlePage="BotaniQuiz | Ranking" caminho="resources" paramVolta="user/"/>
<%} else {%>
<tag:header_admin_root title="BotaniQuiz - Ranking" titlePage="BotaniQuiz | Ranking" caminho="resources"/>
<%}%>

<%
    PontuacaoDao pontos = new PontuacaoDao();
    List<Pontuacao> ranking = pontos.listar();
    List<Pontuacao> maior = pontos.pontuacaoUsuario(usr.getId());
    Integer olho = new Integer(0);
    Integer valorMaior = new Integer(0);
    int limite = ranking.size() - 1;
%>

<tag:conteudoInicio />
<div>
    <!-- Hall da Fama -->
    <%for (int j = 0; j < 1; j++) {
            for (int i = 0; i < ranking.size(); i++) {
                if (ranking.get(i).getId_usuario().getId() == usr.getId() && maior.get(j).getPontos() == ranking.get(i).getPontos()) {
                    olho = i;
                    valorMaior = 1;
                }
            }
        }%>

        
    <%if (ranking.size() != 0 && valorMaior == 1) {%> <!-- Já jogou o quiz? -->
    <%if (olho < 5) {%> <!-- if olho > 5 -->
    <div class="col-lg-5">
        <div class="col-lg-12">
            <div class="col-lg-12">
                <div class="note note-success">
                    <h4 class="box-heading"><strong>Parabéns <%= usr.getNome() + " " + usr.getSobrenome()%></strong></h4>
                    <p><strong>Você</strong> esta entre os 5 melhores jogadores deste quiz.<br>
                        Continue assim, na próxima talvez você chegue ao topo.</p>
                </div>
                <form action="RankingServlet" method="Post">
                    <div class="col-lg-12">
                        <div class="col-lg-12" style="text-align: right; margin-bottom: 3ch; padding: 0">
                            <input id="btn" type="submit" class="btn btn-blue" value="Voltar" name="btn"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div> <!-- mensagem de parabéns -->
    <div class="col-lg-7">
        <div class="page-content" style="margin-top: -3ch">
            <div class="row">
                <div class="col-lg-12">
                    <div class="portlet box">
                        <div class="portlet-header" style="background-color: gray">
                            <div class="caption center" style="color: white">
                                <strong>Hall da Fama</strong>
                            </div>
                            <div class="tools">
                                <a style="color: white">
                                    <i class="fa fa-refresh"></i>
                                </a>
                            </div>
                        </div>
                        <div class=" portlet-body col-lg-12 portlet box">
                            <!-- Ranking -->
                            <div class="timeline-centered timeline-sm">
                                <%Integer tamanho = new Integer(ranking.size());
                                  if(ranking.size() > 5){
                                    tamanho = 5;
                                }%>
                                
                                <%for (int i = 0; i < tamanho; i++) {%>
                                <%if ((i % 2) == 0) {%>
                                <article class="timeline-entry" style="color: black">
                                    <div class="timeline-entry-inner" style="color: black">
                                        <div class="timeline-icon" 
                                             style="color: black; border-color: #444; background-color: white">
                                            <i class="fa fa-user" style="color: black"></strong></i>
                                        </div>
                                        <div class="timeline-label bg-grey">
                                            <h4 class="timeline-title">
                                                <strong><%= i + 1%>º</strong> | <strong><%= ranking.get(i).getId_usuario().getNick()%></strong>
                                            </h4>
                                            <p>Pontuação: <%= ranking.get(i).getPontos()%></p>
                                            Nome: <%= ranking.get(i).getId_usuario().getNome() + " " + ranking.get(i).getId_usuario().getSobrenome()%>
                                        </div>
                                    </div>
                                </article>
                                <%} else {%>
                                <article class="timeline-entry left-aligned" style="color: black">
                                    <div class="timeline-entry-inner" style="color: black">
                                        <div class="timeline-icon" 
                                             style="color: black; border-color: #444; background-color: white">
                                            <i class="fa fa-user" style="color: black"></i>
                                        </div>
                                        <div class="timeline-label bg-dark">
                                            <h4 class="timeline-title">
                                                <strong><strong><%= i + 1%>º</strong> | <%= ranking.get(i).getId_usuario().getNick()%></strong>
                                            </h4>
                                            <p>Pontuação: <%= ranking.get(i).getPontos()%></p>
                                            Nome: <%= ranking.get(i).getId_usuario().getNome() + " " + ranking.get(i).getId_usuario().getSobrenome()%>
                                        </div>
                                    </div>
                                </article>
                                <%}}%>
                                <article class="timeline-entry">
                                    <div class="timeline-entry-inner">
                                        <div class="timeline-icon" 
                                             style="color: black; border-color: #444; background-color: white">
                                            <i class="fa fa-circle" style="color: #444"></i>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </div>
                        <!-- Fim do Ranking -->
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- Mostra ranking dos 5 melhores -->

    <%} else if (olho >= 5) {%> <!-- else olho > 5 -->
    <!-- Classíficação do Usuário -->
    <div class="col-lg-3"></div>
    <div class="col-lg-6">
        <div class="col-lg-12">
            <div class="col-lg-12">
                <div class="note note-warning">
                    <h4 class="box-heading"><strong>Continue Tentando <%= usr.getNome() + " " + usr.getSobrenome()%></strong></h4>
                    <p><strong>Você</strong> não atingiu os melhores jogadores deste quiz.<br>
                        Continue tentando, quem sabe na próxima você chegue ao topo.</p>
                </div>
                <form action="RankingServlet" method="Post">
                    <div class="col-lg-12">
                        <div class="col-lg-12" style="text-align: right; margin-bottom: 3ch; padding: 0">
                            <input id="btn" type="submit" class="btn btn-blue" value="Voltar" name="btn"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div> <!-- Mensagem continue tentando -->
    <div class="col-lg-3"></div>
    <div class="col-lg-12">
        <%if (olho == limite) {%>
        <%for (int x = olho - 2; x <= ranking.size() - 1; x++) {%>
        <%if ((x % 2) == 0) {%>
        <!-- Ranking -->
        <article class="timeline-entry" style="color: black">
            <div class="timeline-entry-inner" style="color: black">
                <div class="timeline-icon" 
                     style="color: black; border-color: #444; background-color: white">
                    <i class="fa fa-user" style="color: black"></strong></i>
                </div>
                <div class="timeline-label bg-grey">
                    <h4 class="timeline-title">
                        <strong><%= x + 1%>º</strong> | <strong><%= ranking.get(x).getId_usuario().getNick()%></strong>
                    </h4>
                    <p>Pontuação: <%= ranking.get(x).getPontos()%></p>
                    Nome: <%= ranking.get(x).getId_usuario().getNome() + " " + ranking.get(x).getId_usuario().getSobrenome()%>
                </div>
            </div>
        </article>
        <%} else {%>
        <article class="timeline-entry left-aligned" style="color: black">
            <div class="timeline-entry-inner" style="color: black">
                <div class="timeline-icon" 
                     style="color: black; border-color: #444; background-color: white">
                    <i class="fa fa-user" style="color: black"></i>
                </div>
                <div class="timeline-label bg-dark">
                    <h4 class="timeline-title">
                        <strong><strong><%= x + 1%>º</strong> | <%= ranking.get(x).getId_usuario().getNick()%></strong>
                    </h4>
                    <p>Pontuação: <%= ranking.get(x).getPontos()%></p>
                    Nome: <%= ranking.get(x).getId_usuario().getNome() + " " + ranking.get(x).getId_usuario().getSobrenome()%>
                </div>
            </div>
        </article>
        <%}%>
        <%}%>
        <article class="timeline-entry">
            <div class="timeline-entry-inner">
                <div class="timeline-icon" 
                     style="color: black; border-color: #444; background-color: white">
                    <i class="fa fa-circle" style="color: #444"></i>
                </div>
            </div>
        </article>
    </div>
</div> <!-- Mostra ranking da classificação do usuário -->
<div class="col-lg-5">
    <div class="page-content" style="margin-top: -3ch">
        <div class="row">
            <div class="col-lg-12">
                <div class="portlet box">
                    <div class="portlet-header" style="background-color: gray">
                        <div class="caption center" style="color: white">
                            <strong>Hall da Fama</strong>
                        </div>
                        <div class="tools">
                            <a style="color: white">
                                <i class="fa fa-refresh"></i>
                            </a>
                        </div>
                    </div>
                    <div class=" portlet-body col-lg-12 portlet box">
                        <!-- Ranking -->
                        <div class="timeline-centered timeline-sm">
                            <%Integer tamanho = new Integer(ranking.size());
                                  if(ranking.size() > 5){
                                    tamanho = 5;
                            }%>
                            <%for (int i = 0; i < tamanho; i++) {%>
                            <%if ((i % 2) == 0) {%>
                            <article class="timeline-entry" style="color: black">
                                <div class="timeline-entry-inner" style="color: black">
                                    <div class="timeline-icon" 
                                         style="color: black; border-color: #444; background-color: white">
                                        <i class="fa fa-user" style="color: black"></strong></i>
                                    </div>
                                    <div class="timeline-label bg-grey">
                                        <h4 class="timeline-title">
                                            <strong><%= i + 1%>º</strong> | <strong><%= ranking.get(i).getId_usuario().getNick()%></strong>
                                        </h4>
                                        <p>Pontuação: <%= ranking.get(i).getPontos()%></p>
                                        Nome: <%= ranking.get(i).getId_usuario().getNome() + " " + ranking.get(i).getId_usuario().getSobrenome()%>
                                    </div>
                                </div>
                            </article>
                            <%} else {%>
                            <article class="timeline-entry left-aligned" style="color: black">
                                <div class="timeline-entry-inner" style="color: black">
                                    <div class="timeline-icon" 
                                         style="color: black; border-color: #444; background-color: white">
                                        <i class="fa fa-user" style="color: black"></i>
                                    </div>
                                    <div class="timeline-label bg-dark">
                                        <h4 class="timeline-title">
                                            <strong><strong><%= i + 1%>º</strong> | <%= ranking.get(i).getId_usuario().getNick()%></strong>
                                        </h4>
                                        <p>Pontuação: <%= ranking.get(i).getPontos()%></p>
                                        Nome: <%= ranking.get(i).getId_usuario().getNome() + " " + ranking.get(i).getId_usuario().getSobrenome()%>
                                    </div>
                                </div>
                            </article>
                            <%}
                                }%>
                            <article class="timeline-entry">
                                <div class="timeline-entry-inner">
                                    <div class="timeline-icon" 
                                         style="color: black; border-color: #444; background-color: white">
                                        <i class="fa fa-circle" style="color: #444"></i>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                    <!-- Fim do Ranking -->
                </div>
            </div>
        </div>
    </div>
</div> <!-- Mostra ranking dos 5 melhores -->
<%} else {%>
<div class="col-lg-7">
    <div class="page-content" style="margin-top: -3ch">
        <div class="row">
            <div class="col-lg-12">
                <div class="portlet box">
                    <div class="portlet-header" style="background-color: gray">
                        <div class="caption center" style="color: white">
                            <strong>Sua Classíficação</strong>
                        </div>
                        <div class="tools">
                            <a style="color: white">
                                <i class="fa fa-refresh"></i>
                            </a>
                        </div>
                    </div>
                    <div class=" portlet-body col-lg-12 portlet box">
                        <!-- Ranking -->
                        <div class="timeline-centered timeline-sm">
                            <%for (int x = olho - 2; x <= ranking.size() - 2; x++) {%>
                            <%if ((x % 2) == 0) {%>
                            <article class="timeline-entry" style="color: black">
                                <div class="timeline-entry-inner" style="color: black">
                                    <div class="timeline-icon" 
                                         style="color: black; border-color: #444; background-color: white">
                                        <i class="fa fa-user" style="color: black"></strong></i>
                                    </div>
                                    <div class="timeline-label bg-grey">
                                        <h4 class="timeline-title">
                                            <strong><%= x + 1%>º</strong> | <strong><%= ranking.get(x).getId_usuario().getNick()%></strong>
                                        </h4>
                                        <p>Pontuação: <%= ranking.get(x).getPontos()%></p>
                                        Nome: <%= ranking.get(x).getId_usuario().getNome() + " " + ranking.get(x).getId_usuario().getSobrenome()%>
                                    </div>
                                </div>
                            </article>
                            <%} else {%>
                            <article class="timeline-entry left-aligned" style="color: black">
                                <div class="timeline-entry-inner" style="color: black">
                                    <div class="timeline-icon" 
                                         style="color: black; border-color: #444; background-color: white">
                                        <i class="fa fa-user" style="color: black"></i>
                                    </div>
                                    <div class="timeline-label bg-dark">
                                        <h4 class="timeline-title">
                                            <strong><strong><%= x + 1%>º</strong> | <%= ranking.get(x).getId_usuario().getNick()%></strong>
                                        </h4>
                                        <p>Pontuação: <%= ranking.get(x).getPontos()%></p>
                                        Nome: <%= ranking.get(x).getId_usuario().getNome() + " " + ranking.get(x).getId_usuario().getSobrenome()%>
                                    </div>
                                </div>
                            </article>
                            <%}%>
                            <%}%>
                            <article class="timeline-entry">
                                <div class="timeline-entry-inner">
                                    <div class="timeline-icon" 
                                         style="color: black; border-color: #444; background-color: white">
                                        <i class="fa fa-circle" style="color: #444"></i>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- Mostra ranking da classificação do usuário -->
<div class="col-lg-5">
    <div class="page-content" style="margin-top: -3ch">
        <div class="row">
            <div class="col-lg-12">
                <div class="portlet box">
                    <div class="portlet-header" style="background-color: gray">
                        <div class="caption center" style="color: white">
                            <strong>Hall da Fama</strong>
                        </div>
                        <div class="tools">
                            <a style="color: white">
                                <i class="fa fa-refresh"></i>
                            </a>
                        </div>
                    </div>
                    <div class=" portlet-body col-lg-12 portlet box">
                        <!-- Ranking -->
                        <div class="timeline-centered timeline-sm">
                            <%Integer tamanho = new Integer(ranking.size());
                                  if(ranking.size() > 5){
                                    tamanho = 5;
                                }%>
                            <%for (int i = 0; i < tamanho; i++) {%>
                            <%if ((i % 2) == 0) {%>
                            <article class="timeline-entry" style="color: black">
                                <div class="timeline-entry-inner" style="color: black">
                                    <div class="timeline-icon" 
                                         style="color: black; border-color: #444; background-color: white">
                                        <i class="fa fa-user" style="color: black"></strong></i>
                                    </div>
                                    <div class="timeline-label bg-grey">
                                        <h4 class="timeline-title">
                                            <strong><%= i + 1%>º</strong> | <strong><%= ranking.get(i).getId_usuario().getNick()%></strong>
                                        </h4>
                                        <p>Pontuação: <%= ranking.get(i).getPontos()%></p>
                                        Nome: <%= ranking.get(i).getId_usuario().getNome() + " " + ranking.get(i).getId_usuario().getSobrenome()%>
                                    </div>
                                </div>
                            </article>
                            <%} else {%>
                            <article class="timeline-entry left-aligned" style="color: black">
                                <div class="timeline-entry-inner" style="color: black">
                                    <div class="timeline-icon" 
                                         style="color: black; border-color: #444; background-color: white">
                                        <i class="fa fa-user" style="color: black"></i>
                                    </div>
                                    <div class="timeline-label bg-dark">
                                        <h4 class="timeline-title">
                                            <strong><strong><%= i + 1%>º</strong> | <%= ranking.get(i).getId_usuario().getNick()%></strong>
                                        </h4>
                                        <p>Pontuação: <%= ranking.get(i).getPontos()%></p>
                                        Nome: <%= ranking.get(i).getId_usuario().getNome() + " " + ranking.get(i).getId_usuario().getSobrenome()%>
                                    </div>
                                </div>
                            </article>
                            <%}
                                }%>
                            <article class="timeline-entry">
                                <div class="timeline-entry-inner">
                                    <div class="timeline-icon" 
                                         style="color: black; border-color: #444; background-color: white">
                                        <i class="fa fa-circle" style="color: #444"></i>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                    <!-- Fim do Ranking -->
                </div>
            </div>
        </div>
    </div>
</div> <!-- Mostra ranking dos 5 melhores -->
<%}%>
<%}%> <!-- else if olho > 5 -->
<%} else {%> <!-- Já jogou o quiz? -->
<div class="col-lg-3"></div>
<div class="col-lg-6">
    <div class="col-lg-12">
        <div class="note note-danger">
            <h4 class="box-heading"><strong>Ops! Parece que voce ainda não jogou este quiz.</strong></h4>
            <p>Jogue agora.<br>
                Conquiste o título do <strong>Hall da Fama</strong>.</p>
        </div>
        <form action="RankingServlet" method="Post">
            <div class="col-lg-12">
                <div class="col-lg-12" style="text-align: right">
                    <input id="btn" type="submit" class="btn btn-blue" value="Voltar" name="btn"/>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="col-lg-3"></div>
<%}%>


</div>


<tag:conteudoFim />

<%if (usr.getTipo() == 0) {%>
<tag:footer ano="2017" versao="1.0" caminho="resources"
            desenvolvedores="Diego Fonseca Pereira, Jehymison Gil A. Oliveira, Naiane Maria de Sousa e Tarcísio Ribeiro Junior"/>
<%} else {%>
<tag:footer ano="2017" versao="1.0" caminho="../resources"
            desenvolvedores="Diego Fonseca Pereira, Jehymison Gil A. Oliveira, Naiane Maria de Sousa e Tarcísio Ribeiro Junior"/>
<%}%>
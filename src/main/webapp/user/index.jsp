<%-- 
    Document   : index
    Created on : 17/062017, 21:39:17
    Author     : Tarcisio & Jehymison
--%>

<%@page import="br.edu.ifgoiano.servlets.SegurancaServlet"%>
<%@page import="br.edu.ifgoiano.modelo.Usuario"%>
<%
    Usuario usr = new Usuario();
    session.setAttribute("NovoQuiz", "");

    if (SegurancaServlet.kickUser(request, response, session) == 0) {
        response.sendRedirect("../index.jsp");
    } else if (SegurancaServlet.kickUser(request, response, session) == 1) {
        response.sendRedirect("../user/");
    } else if (SegurancaServlet.kickUser(request, response, session) == 2) {
        usr = (Usuario) session.getAttribute("user_logado");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:header_user title="BioQuiz - Início" titlePage="BioQuiz | Início" caminho="../resources"/>

<tag:conteudoInicio />
<tag:open_coluna tamanho="12"/>

<!-- Menu -->
<div id="sum_box" class="row mbl">
    <div class="col-sm-4 col-md-4">
            <a href="../QuizServlet" target="" style="color: black">
                <div class="panel profit db mbm">
                    <div class="panel-body">
                        <p class="icon">
                            <i class="icon fa fa-leaf" style="color: #333"></i>
                        </p>
                        <h4 class="value">
                            <span data-counter="" data-start="10" data-end="50" data-step="1" data-duration="0">
                            </span>
                            <span>
                                Quiz
                            </span>
                        </h4>
                        <br>
                        <p class="description">
                            Jogue agora uma nova partida.
                        </p>
                    </div>
                </div>
            </a>
    </div>
    <div class="col-sm-4 col-md-4">
        <a href="../ranking.jsp" style="color: black">
            <div class="panel profit db mbm">
                <div class="panel-body">
                    <p class="icon">
                        <i class="icon fa fa-signal" style="color: #333"></i>
                    </p>
                    <h4 class="value">
                        <span data-counter="" data-start="10" data-end="50" data-step="1" data-duration="0">
                        </span>
                        <span>
                            Ranking
                        </span>
                    </h4>
                    <br>
                    <p class="description">
                        Os melhores sempre no topo.
                    </p>
                </div>
            </div>
        </a>
    </div>
    <div class="hidden-sm col-md-1"></div>
    <div class="col-sm-4 col-md-3">
            <a href="../SegurancaServlet?btn=sair" id="sair" style="color: black" type="submit" >
            <div class="panel profit db mbm">
                <div class="panel-body">
                    <p class="icon">
                        <i class="icon fa fa-eject" style="color: #333"></i>
                    </p>
                    <h4 class="value">
                        <span data-counter="" data-start="10" data-end="50" data-step="1" data-duration="0">
                        </span>
                        <span>
                            Sair
                        </span>
                    </h4>
                    <br>
                    <p class="description">
                        Sair do BioQuiz.
                    </p>
                </div>
            </div>
        </a>
    </div>
</div>
<!-- Fim do Menu -->

<tag:close_coluna/>
<tag:conteudoFim />
<tag:footer ano="2017" versao="1.0" caminho="resources"
            desenvolvedores="Diego Fonseca Pereira, Jehymison Gil A. Oliveira, Naiane Maria de Sousa e Tarcísio Ribeiro Junior"/>

<%-- 
    Document   : index
    Created on : 17/062017, 21:39:17
    Author     : Tarcisio & Jehymison
--%>

<%@page import="br.edu.ifgoiano.modelo.Pergunta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%if (session.getAttribute("nomeUsuario") != null) {
        response.sendRedirect("logado.jsp");
    }%>

<%@page import="br.edu.ifgoiano.persistencia.PerguntaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:header_admin title="BioQuiz - Administração" titlePage="BioQuiz Web | Questões" caminho="../resources"/>

<tag:conteudoInicio />
<tag:open_coluna tamanho="12"/>

<%
    PerguntaDao questao = new PerguntaDao();
    List<Pergunta> lista_questao = questao.getLista();;
%>

<!-- Tabela de RUD -->
<div class="col-lg-6 col-md-6 col-sm-12">

    <%if (lista_questao.isEmpty()) {%>
    <form method="POST" action="#">
        <div class="col-md-12">
            <div class="note note-info">
                <h4 class="box-heading">Ops! Não há nada a ser visto aqui.</h4>
                <p>Parece que você ainda não submeteu nenhuma questão.</p>
            </div>
        </div>
    </form>
    <%} else {%>
    <div class="panel panel-grey">
        <div class="panel-heading">Propostas Submetidas</div>
        <div class="panel-body">
            <form action="#" method="POST">
                <table class="table table-hover table-hover-color table-condensed">
                    <thead>
                        <tr>
                            <th style="text-align: center">ID</th>
                            <th class="hidden">VALOR REAL</th>
                            <th style="text-align: center">Título</th>
                            <th style="text-align: center">Resposta Correta</th>
                            <th style="text-align: center">Opções</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < lista_questao.size(); i++) {%>
                        <tr>
                            <td class="hidden-xs hidden-sm"><%= i + 1%></td>
                            <td class="hidden"><%= lista_questao.get(i).getId()%></td>
                            <td><%= lista_questao.get(i).getTitulo()%></td>
                            <td><%= lista_questao.get(i).getResposta().get(i).isCorreta() == true%></td>
                            <td>
                                <div class="todo-actions" style="text-align: center">
                                    <div class="col-lg-4 col-sm-2" style="text-align: right">
                                        <button class="btn btn-square btn-xs" type="submit" style="background-color: rgba(255,255,255,0)"
                                                value="download_<%= lista_questao.get(i).getId()%>" name="btn">  
                                            <i class="fa fa-download" style="color: #007451"></i>
                                        </button>
                                    </div>
                                    <div class="col-md-4 col-sm-2">
                                        <button class="btn btn-square btn-xs" type="submit" style="background-color: rgba(255,255,255,0)"
                                                value="editar_<%= lista_questao.get(i).getId()%>" name="btn">  
                                            <i class="fa fa-edit" style="color: #444444"></i>
                                        </button>
                                    </div>
                                    <div class="col-md-4 col-sm-2">
                                        <button class="btn btn-square btn-xs" type="submit" style="background-color: rgba(255,255,255,0)"
                                                value="excluir_<%= lista_questao.get(i).getId()%>" name="btn">  
                                            <i class="fa fa-trash-o" style="color: red" ></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>                
                                <strong>Obs.:Marque somente a resposta correta.</strong>
                        <%}%>
                    </tbody>
                </table>
                <div class="col-lg-12">
                    <div class="col-lg-12" style="text-align: right; background-color: rgba(0,0,0,0)">
                        <input id="btn" type="submit" class="btn btn-blue" value="Voltar" name="btn"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%}%>
</div>
<!-- Fim da Inserção -->

<!-- Tabela de Inserção -->
<div class="col-lg-6 col-md-6 col-sm-12">
    <div class="panel panel-green">
        <div class="panel-heading">
            Cadastro de Questões</div>
        <div class="panel-body pan">
            <form action="#" method="POST">
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
                            Pergunta
                        </label>
                        <textarea rows="5" class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="inputSubject" class="control-label">
                            Alternativas</label>
                        <div class="input-icon right">
                            <div class="input-group" style="margin: 5px">
                                <span class="input-group-addon">
                                    A)
                                    <input type="checkbox" name="check_a"/></span>
                                <input type="text" placeholder="" class="form-control" name="resposta_a" />
                            </div>

                            <div class="input-group" style="margin: 5px">
                                <span class="input-group-addon">
                                    B)
                                    <input type="checkbox" name="check_b"/></span>
                                <input type="text" placeholder="" class="form-control" name="resposta_b" />
                            </div>

                            <div class="input-group" style="margin: 5px">
                                <span class="input-group-addon">
                                    C)
                                    <input type="checkbox" name="check_c"/></span>
                                <input type="text" placeholder="" class="form-control" name="resposta_c" />
                            </div>

                            <div class="input-group" style="margin: 5px">
                                <span class="input-group-addon">
                                    D)
                                    <input type="checkbox" name="check_d"/></span>
                                <input type="text" placeholder="" class="form-control" name="resposta_d" />
                            </div>
                            <div class="small" style="text-align: right">
                                Obs.:Marque somente a resposta correta.
                            </div>
                        </div>
                    </div>
                    <div class="form-actions text-right pal" style="background-color: rgba(0,0,0,0)">
                        <input type="submit" class="btn btn-primary" name="btn" value="Cadastrar" />                            
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Fim da Inserção -->

<tag:close_coluna/>
<tag:conteudoFim />
<tag:footer ano="2017" versao="1.0" caminho="resources"
            desenvolvedores="Diego Fonseca Pereira, Jehymison Gil A. Oliveira, Naiane Maria de Sousa e Tarcísio Ribeiro Junior"/>

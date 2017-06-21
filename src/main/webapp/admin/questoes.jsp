<%-- 
    Document   : index
    Created on : 17/062017, 21:39:17
    Author     : Tarcisio & Jehymison
--%>

<%@page import="br.edu.ifgoiano.modelo.Resposta"%>
<%@page import="br.edu.ifgoiano.persistencia.RespostaDao"%>
<%@page import="br.edu.ifgoiano.modelo.Pergunta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@page import="br.edu.ifgoiano.persistencia.PerguntaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:header_admin title="BioQuiz - Administração" titlePage="BioQuiz Web | Questões" caminho="../resources"/>

<tag:conteudoInicio />

<%if (session.getAttribute("erro_cadastro_quest") != null) {%>
<%if (session.getAttribute("erro_cadastro_quest").equals("false")) {%>
<div id="alert" class="alert alert-success col-lg-12" role="alert" style="text-align: center">
    <strong>Questão cadastrada com sucesso!</strong>
    <%
        session.setAttribute("erro_cadastro_quest", null);
    %>
</div>
<%}else if(session.getAttribute("erro_cadastro_quest").equals("resp_iguais")){%>
<div id="alert_danger" class="alert alert-danger col-lg-12" role="alert" style="text-align: center">
    <strong>Há duas ou mais respostas iguais!</strong>
    <%session.setAttribute("erro_cadastro_quest", null);%>
</div>
<%} else {%>
<div id="alert_danger" class="alert alert-danger col-lg-12" role="alert" style="text-align: center">
    <strong>Preencha todos os campos!</strong>
    <%session.setAttribute("erro_cadastro_quest", null);%>
</div>
<%}%>
<%}%>
<%if (session.getAttribute("deletou") != null) {%>
<%if (session.getAttribute("deletou").equals("sucesso")) {%>
<div id="alert" class="alert alert-success col-lg-12" role="alert" style="text-align: center">
    <strong>Questão removida com sucesso!</strong>
    <%
        session.setAttribute("deletou", null);
    %>
</div>
<%}}%>

<tag:open_coluna tamanho="12"/>

<%
    PerguntaDao questao = new PerguntaDao();
    RespostaDao resposta = new RespostaDao();
    List<Pergunta> lista_questao = questao.getLista();
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
        <div class="panel-heading">Questões Cadastradas</div>
        <div class="panel-body">
            <form action="../QuestoesServlet" method="POST">
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
                            <td class="hidden-xs hidden-sm" style="text-align: center"><%= i + 1%></td>
                            <td class="hidden" style="text-align: center"><%= lista_questao.get(i).getId()%></td>
                            <td style="text-align: center"><%= lista_questao.get(i).getTitulo()%></td>
                            <td style="text-align: center"><%= resposta.pesquisarPerguntaCerta(lista_questao.get(i).getId()).getResposta() %></td>
                            <td style="text-align: center">
                                <div class="todo-actions" style="text-align: center">
                                    <div class="col-md-6 col-sm-12">
                                        <button class="btn btn-square btn-xs" type="submit" style="background-color: rgba(255,255,255,0)"
                                                value="editar_<%= lista_questao.get(i).getId()%>" name="btn">  
                                            <i class="fa fa-edit" style="color: #444444"></i>
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <button class="btn btn-square btn-xs" type="submit" style="background-color: rgba(255,255,255,0)"
                                                value="excluir_<%= lista_questao.get(i).getId()%>" name="btn">  
                                            <i class="fa fa-trash-o" style="color: red" ></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>                
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
            <form action="../QuestoesServlet" method="POST">
                <div class="form-body pal">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-icon right">
                                    <i class="fa fa-ticket"></i>
                                    <input type="text" placeholder="Título da Questão" class="form-control" name="tituloQuest"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputMessage" class="control-label">
                            Pergunta
                        </label>
                        <textarea rows="5" class="form-control" name="questTexto"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="inputSubject" class="control-label">
                            Alternativas</label>
                        <div class="input-icon right">
                            <div class="input-group" style="margin: 5px">
                                <span class="input-group-addon">
                                    A)
                                    <input type="radio" name="check" value="0"/></span>
                                <input type="text" placeholder="" class="form-control" name="resposta_a" />
                            </div>

                            <div class="input-group" style="margin: 5px">
                                <span class="input-group-addon">
                                    B)
                                    <input type="radio" name="check" value="1"/></span>
                                <input type="text" placeholder="" class="form-control" name="resposta_b" />
                            </div>

                            <div class="input-group" style="margin: 5px">
                                <span class="input-group-addon">
                                    C)
                                    <input type="radio" name="check" value="2"/></span>
                                <input type="text" placeholder="" class="form-control" name="resposta_c" />
                            </div>

                            <div class="input-group" style="margin: 5px">
                                <span class="input-group-addon">
                                    D)
                                    <input type="radio" name="check" value="3"/></span>
                                <input type="text" placeholder="" class="form-control" name="resposta_d" />
                            </div>

                            <div class="input-group" style="margin: 5px">
                                <span class="input-group-addon">
                                    E)
                                    <input type="radio" name="check" value="4"/></span>
                                <input type="text" placeholder="" class="form-control" name="resposta_e" />
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

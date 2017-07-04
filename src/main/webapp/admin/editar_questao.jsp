<%@page import="com.sun.javafx.scene.control.skin.VirtualFlow.ArrayLinkedList"%>
<%@page import="br.edu.ifgoiano.modelo.Usuario"%>
<%if (session.getAttribute("user_logado") != null) {
        Usuario usr = (Usuario) session.getAttribute("user_logado");
        if (usr.getTipo() == 0) {
            response.sendRedirect("../index.jsp");
        }
    } else {
        response.sendRedirect("../index.jsp");
    }%>

<%@page import="java.util.List"%>
<%@page import="br.edu.ifgoiano.modelo.Resposta"%>
<%@page import="br.edu.ifgoiano.persistencia.RespostaDao"%>
<%@page import="br.edu.ifgoiano.persistencia.PerguntaDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifgoiano.modelo.Pergunta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:header_admin title="BioQuiz - Administração" titlePage="BioQuiz Web | Editar Questões" caminho="../resources"/>

<tag:conteudoInicio />
<tag:open_coluna tamanho="12"/>

<!-- Gerando Lista de Questões -->
<%
    PerguntaDao questao = new PerguntaDao();
    RespostaDao resp_quest = new RespostaDao();
    Pergunta questaoRetorno = questao.getPergunta(Integer.parseInt(String.valueOf(session.getAttribute("editarProposta"))));
    List<Resposta> respostaRetorno = resp_quest.pesquisarPergunta(Integer.parseInt(String.valueOf(session.getAttribute("editarProposta"))));

    String certa_a = "";
    String certa_b = "";
    String certa_c = "";
    String certa_d = "";
    String certa_e = "";

    for (int i = 0; i < respostaRetorno.size(); i++) {
        if (respostaRetorno.get(i).isCorreta()) {
            switch (i) {
                case 0:
                    certa_a = "checked=''";
                    break;
                case 1:
                    certa_b = "checked=''";
                    break;
                case 2:
                    certa_c = "checked=''";
                    break;
                case 3:
                    certa_d = "checked=''";
                    break;
                case 4:
                    certa_e = "checked=''";
                    break;
            }
        }
    }

%>


<!-- Tabela de Edição -->
<div class="col-lg-3 col-md-3 col-sm-3">
</div>
<div class="col-lg-6 col-md-6 col-sm-6">
    <div class="panel panel-green">
        <div class="panel-heading">
            Editar de Questão</div>
        <div class="panel-body pan">
            <form action="../QuestoesServlet" method="POST">
                <div class="form-body pal">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-icon right">
                                    <i class="fa fa-ticket"></i>
                                    <input type="text" value="<%= questaoRetorno.getTitulo()%>" class="form-control" name="questao_Titulo">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputMessage" class="control-label">
                            Pergunta
                        </label>
                        <textarea rows="5" class="form-control" name="questao_Pergunta"><%= questaoRetorno.getQuestao()%></textarea>
                    </div>
                    <div class="form-group">
                        <label for="inputSubject" class="control-label">
                            Alternativas</label>
                        <div class="input-icon right">
                            <div class="input-group" style="margin: 5px">
                                <span class="input-group-addon">
                                    A)
                                    <input type="radio" name="echeck" value="0" <%= certa_a%>/></span>
                                <input type="text" value="<%= respostaRetorno.get(0).getResposta()%>" class="form-control" name="resp_a" />
                            </div>

                            <div class="input-group" style="margin: 5px">
                                <span class="input-group-addon">
                                    B)
                                    <input type="radio" name="echeck" value="1" <%= certa_b%>/></span>
                                <input type="text" value="<%= respostaRetorno.get(1).getResposta()%>" class="form-control" name="resp_b" />
                            </div>

                            <div class="input-group" style="margin: 5px">
                                <span class="input-group-addon">
                                    C)
                                    <input type="radio" name="echeck" value="2" <%= certa_c%>/></span>
                                <input type="text" value="<%= respostaRetorno.get(2).getResposta()%>" class="form-control" name="resp_c" />
                            </div>

                            <div class="input-group" style="margin: 5px">
                                <span class="input-group-addon">
                                    D)
                                    <input type="radio" name="echeck" value="3" <%= certa_d%>/></span>
                                <input type="text" value="<%= respostaRetorno.get(3).getResposta()%>" class="form-control" name="resp_d" />
                            </div>

                            <div class="input-group" style="margin: 5px">
                                <span class="input-group-addon">
                                    E)
                                    <input type="radio" name="echeck" value="4" <%= certa_e%>/></span>
                                <input type="text" value="<%= respostaRetorno.get(4).getResposta()%>" class="form-control" name="resp_e" />
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
                                <a href="../admin/questoes.jsp">
                                    <button class="btn btn-danger" style="width: 18ch"
                                            value="voltar" name="btn">Voltar
                                    </button>  
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-12 col-md-4">
                            <div class="form-actions text-center pal">                                
                                <button class="btn btn-blue" type="submit" style="width: 18ch"
                                        value="editar_<%= (String) session.getAttribute("editarProposta")%>" name="btn">  
                                    Atualizar Questão
                                </button>  
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="col-lg-3 col-md-6 col-sm-6">
</div>
<!-- Fim da Edição -->

<tag:close_coluna/>
<tag:conteudoFim />
<tag:footer ano="2017" versao="1.0" caminho="resources"
            desenvolvedores="Diego Fonseca Pereira, Jehymison Gil A. Oliveira, Naiane Maria de Sousa e Tarcísio Ribeiro Junior"/>

<%-- 
    Document   : index
    Created on : 17/062017, 21:39:17
    Author     : Tarcisio & Jehymison
--%>
<%@page import="br.edu.ifgoiano.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<%
    Usuario usr = (Usuario) session.getAttribute("user_logado");
%>
<%if (usr.getTipo() == 0) {%>
<tag:header_user_root title="BotaniQuiz - Questões" titlePage="BotaniQuiz | Questões" caminho="resources" paramVolta="user/"/>
<%} else {%>
<tag:header_admin_root title="BotaniQuiz - Questões" titlePage="BotaniQuiz | Qusetões" caminho="resources"/>
<%}%>

<tag:conteudoInicio />

<script></script>


<tag:conteudoFim />

<%if (usr.getTipo() == 0) {%>
<tag:footer ano="2017" versao="1.0" caminho="resources"
            desenvolvedores="Diego Fonseca Pereira, Jehymison Gil A. Oliveira, Naiane Maria de Sousa e Tarcísio Ribeiro Junior"/>
<%} else {%>
<tag:footer ano="2017" versao="1.0" caminho="../resources"
            desenvolvedores="Diego Fonseca Pereira, Jehymison Gil A. Oliveira, Naiane Maria de Sousa e Tarcísio Ribeiro Junior"/>
<%}%>
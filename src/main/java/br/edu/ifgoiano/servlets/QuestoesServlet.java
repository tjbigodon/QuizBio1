/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.servlets;

import br.edu.ifgoiano.modelo.Pergunta;
import br.edu.ifgoiano.modelo.Resposta;
import br.edu.ifgoiano.persistencia.PerguntaDao;
import br.edu.ifgoiano.persistencia.RespostaDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jehymeson Gil
 */
@WebServlet(name = "QuestoesServlet", urlPatterns = {"/QuestoesServlet"})
public class QuestoesServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        int opCadastro = cadastroQuest(request, response);
        
        if (request.getParameter("btn").equalsIgnoreCase("cadastrar")) {
            if (opCadastro == 0) {
                session.setAttribute("erro_cadastro_quest", "false");
                response.sendRedirect("admin/questoes.jsp");
            } else if(opCadastro == 1){
                session.setAttribute("erro_cadastro_quest", "vazio");
                response.sendRedirect("admin/questoes.jsp");
            } else if(opCadastro == 2){
                session.setAttribute("erro_cadastro_quest", "resp_iguais");
                response.sendRedirect("admin/questoes.jsp");
            }
        }

        String[] edicoes = getValores(request, response);

        if (edicoes[0].trim().equals("editar")) {

            if (editarQuest(request, response, Integer.parseInt(edicoes[1]))) { //Botão Editar
                System.out.println("Editou");
            } else {
                System.out.println("Não Editou");
            }

        } else if (edicoes[0].trim().equals("excluir")) { //Botão Excluir
            boolean opExcluir = excluirQuest(request, response, Integer.parseInt(edicoes[1]));
            if (opExcluir) {
                session.setAttribute("deletou", "sucesso");
                response.sendRedirect("admin/questoes.jsp");
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    /**
     * Cadastro de Questões e Respostas
     *
     * @param request
     * @param response
     * @return
     */
    public static int cadastroQuest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        if (request.getParameter("tituloQuest")==null||request.getParameter("tituloQuest").isEmpty()||request.getParameter("questTexto")==null||request.getParameter("questTexto").isEmpty()||request.getParameter("resposta_a").isEmpty() || request.getParameter("resposta_b").isEmpty() || request.getParameter("resposta_c").isEmpty() || request.getParameter("resposta_d").isEmpty() || request.getParameter("resposta_e").isEmpty() || request.getParameter("resposta_a") == null || request.getParameter("resposta_b") == null || request.getParameter("resposta_c") == null || request.getParameter("resposta_d") == null || request.getParameter("resposta_e") == null || request.getParameter("check") == null || request.getParameter("check").isEmpty()) {
            return 1;
        } else if(request.getParameter("resposta_a").equalsIgnoreCase(request.getParameter("resposta_b"))||request.getParameter("resposta_a").equalsIgnoreCase(request.getParameter("resposta_c"))||request.getParameter("resposta_a").equalsIgnoreCase(request.getParameter("resposta_d"))||request.getParameter("resposta_a").equalsIgnoreCase(request.getParameter("resposta_e"))||request.getParameter("resposta_b").equalsIgnoreCase(request.getParameter("resposta_c"))||request.getParameter("resposta_b").equalsIgnoreCase(request.getParameter("resposta_d"))||request.getParameter("resposta_b").equalsIgnoreCase(request.getParameter("resposta_e"))||request.getParameter("resposta_c").equalsIgnoreCase(request.getParameter("resposta_d"))||request.getParameter("resposta_c").equalsIgnoreCase(request.getParameter("resposta_e"))||request.getParameter("resposta_d").equalsIgnoreCase(request.getParameter("resposta_e"))){
            return 2;
        } else {
            Pergunta quest = new Pergunta();
            Resposta[] alternativa = {
                new Resposta(request.getParameter("resposta_a"), (request.getParameter("check").equals("0")) ? true : false),
                new Resposta(request.getParameter("resposta_b"), (request.getParameter("check").equals("1")) ? true : false),
                new Resposta(request.getParameter("resposta_c"), (request.getParameter("check").equals("2")) ? true : false),
                new Resposta(request.getParameter("resposta_d"), (request.getParameter("check").equals("3")) ? true : false),
                new Resposta(request.getParameter("resposta_e"), (request.getParameter("check").equals("4")) ? true : false)
            };

            quest.setTitulo(request.getParameter("tituloQuest"));
            quest.setQuestao(request.getParameter("questTexto"));
            quest.setResposta_certa(alternativa);

            PerguntaDao daoPergunta = new PerguntaDao();
            RespostaDao daoResposta = new RespostaDao();

            int id_quest = daoPergunta.cadastrar(quest);

            if (id_quest != 0) {
                
                int cont = 0;

                //Cadastrando Resposta
                for (Resposta alternativas : alternativa) {
                    if (daoResposta.cadastrar(alternativas.getResposta(), id_quest, alternativas.isCorreta())) {
                        cont++;
                    }
                }
                if (cont == 5) {
                    //Cadastrou a Pergunta e as Alternativas
                    return 0;
                }

            } 
            return 1;
        }
    }

    public static boolean editarQuest(HttpServletRequest request, HttpServletResponse response, int id) {
        return false;
    }

    public static boolean excluirQuest(HttpServletRequest request, HttpServletResponse response, int id) {
        if (new RespostaDao().deletar(id)) {
            if (new PerguntaDao().deletar(id)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    /**
     * Separa String do ID
     *
     * @param request
     * @param response
     * @return
     */
    public static String[] getValores(HttpServletRequest request, HttpServletResponse response) {
        String[] valores;
        String btn = request.getParameter("btn");

        valores = btn.split("_|_\\s");
        return valores;
    }
}

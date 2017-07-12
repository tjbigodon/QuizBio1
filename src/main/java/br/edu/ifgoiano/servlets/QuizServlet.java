/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.servlets;

import br.edu.ifgoiano.modelo.Pergunta;
import br.edu.ifgoiano.modelo.Pontuacao;
import br.edu.ifgoiano.modelo.Resposta;
import br.edu.ifgoiano.modelo.Usuario;
import br.edu.ifgoiano.persistencia.PerguntaDao;
import br.edu.ifgoiano.persistencia.PontuacaoDao;
import br.edu.ifgoiano.persistencia.RespostaDao;
import java.io.IOException;
import java.util.List;
import java.util.Random;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "QuizServlet", urlPatterns = {"/QuizServlet"})
public class QuizServlet extends HttpServlet {

    String[] resposta = null;
    PerguntaDao pega_questão = new PerguntaDao();
    RespostaDao pega_resposta = new RespostaDao();
    List<Pergunta> pergunta = pega_questão.getLista();
    List<Resposta> alternativa = pega_resposta.listarPergunta();

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        if (request.getParameter("btn") != null && request.getParameter("btn").equals("proximo")) {

            if (request.getParameter("resposta") == null) {                
                session.setAttribute("quiz_erro", "erro");
                response.sendRedirect("quiz.jsp");
            } else {
                String sessao = (String) session.getAttribute("NovoQuiz");
                String[] questoes = sessao.split("_");
                Pergunta pgt = new Pergunta();

                if (questoes[questoes.length - 1].contains("-") || sessao == null) {
                    response.sendRedirect("QuizServlet");
                } else {
                    pgt = pega_questão.getPergunta(Integer.parseInt(questoes[questoes.length - 1]));
                }
                List<Resposta> resposta = pega_resposta.pesquisarPergunta(Integer.parseInt(questoes[questoes.length - 1]));

                Resposta respostaCerta = pega_resposta.pesquisarPerguntaCerta(Integer.parseInt(questoes[questoes.length - 1]));

                if (request.getParameter("resposta").equals(String.valueOf(respostaCerta.getId()))) {
                    session.setAttribute("NovoQuiz", session.getAttribute("NovoQuiz") + "-C_");
                } else {
                    session.setAttribute("NovoQuiz", session.getAttribute("NovoQuiz") + "-E_");
                }

                Pergunta pergunta = sorteiaPergunta(request, response, session);

                if (pergunta == null) {
                    contagemPontos(request, response, session);
                    response.sendRedirect("ranking.jsp");
                } else {
                    response.sendRedirect("quiz.jsp");
                }
            }
        } else {

            if (session.getAttribute("NovoQuiz") == null) {
                session.setAttribute("NovoQuiz", "");
            }

            Pergunta pgt = sorteiaPergunta(request, response, session);
            response.sendRedirect("quiz.jsp");
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

    public Pergunta sorteiaPergunta(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        String sessaoPerguntas = (String) session.getAttribute("NovoQuiz");

        int contadorPerguntas = 0;
        for (int i = 0; i < sessaoPerguntas.length(); i++) {
            if (sessaoPerguntas.charAt(i) == '_') {
                contadorPerguntas++;
            }
        }
        if (contadorPerguntas != 9) {
            Pergunta pgt = new Pergunta();
            PerguntaDao pdao = new PerguntaDao();
            List<Pergunta> perguntas = pdao.getLista();
            int idPergunta = new Random().nextInt(perguntas.size()) + 1;

            if (idPergunta > perguntas.size()) {
                idPergunta--;
            }

            while (sessaoPerguntas.contains(idPergunta + "-")) {
                idPergunta = new Random().nextInt(perguntas.size()) + 1;

                if (idPergunta > perguntas.size()) {
                    idPergunta--;
                }
            }

            pgt = pdao.getPergunta(idPergunta);
            String id = String.valueOf(pgt.getId());
            session.setAttribute("NovoQuiz", (String) session.getAttribute("NovoQuiz") + id);
            System.out.println("*************************");
            System.out.println("ID Pergunta: " + idPergunta);
            return pgt;
        } else {
            return null;
        }
    }

    public boolean contagemPontos(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Usuario userPontos = (Usuario) session.getAttribute("user_logado");
        String contaPontos = (String) session.getAttribute("NovoQuiz");
        int cont = 0;

        for (int i = 0; i < contaPontos.length(); i++) {
            if (contaPontos.charAt(i) == 'C') {
                cont++;
            }
        }

        int pontos = cont * 10;

        Pontuacao nPontos = new Pontuacao();
        nPontos.setId_usuario(userPontos);
        nPontos.setPontos(pontos);

        PontuacaoDao pUsu = new PontuacaoDao();

        if (pUsu.cadastrar(nPontos)) {
            return true;
        } else {
            return false;
        }

    }
}

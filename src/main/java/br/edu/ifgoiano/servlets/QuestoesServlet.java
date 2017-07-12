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
import java.util.List;
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

        if (request.getParameter("btn").equalsIgnoreCase("cadastrar")) {
            int opCadastro = cadastroQuest(request, response);
            if (opCadastro == 0) {
                session.setAttribute("erro_cadastro_quest", "false");
                response.sendRedirect("admin/questoes.jsp");
            } else if (opCadastro == 1) {
                session.setAttribute("erro_cadastro_quest", "vazio");
                response.sendRedirect("admin/questoes.jsp");
            } else if (opCadastro == 2) {
                session.setAttribute("erro_cadastro_quest", "resp_iguais");
                response.sendRedirect("admin/questoes.jsp");
            }
        } else if (request.getParameter("btn").equalsIgnoreCase("voltar")) {
            session.setAttribute("editarProposta", null);
            response.sendRedirect("admin/questoes.jsp");
        }

        String[] edicoes = getValores(request, response);

        if (edicoes[0].trim().equals("editar")) {

            if (editarQuest(request, response, Integer.parseInt(edicoes[1]))) { //Botão Editar
                session.setAttribute("editou", "sucesso");
                response.sendRedirect("admin/questoes.jsp");
            } else {
                //System.out.println("Não Editou");
            }

        } else if (edicoes[0].trim().equals("excluir")) { //Botão Excluir
            boolean opExcluir = excluirQuest(request, response, Integer.parseInt(edicoes[1]));
            if (opExcluir) {
                session.setAttribute("deletou", "sucesso");
                response.sendRedirect("admin/questoes.jsp");
            }
        } else if (edicoes[0].trim().equals("editarPre")) {
            session.setAttribute("editarProposta", edicoes[1]);
            response.sendRedirect("admin/editar_questao.jsp");
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

        if (request.getParameter("tituloQuest") == null || request.getParameter("tituloQuest").isEmpty() || request.getParameter("questTexto") == null || request.getParameter("questTexto").isEmpty() || request.getParameter("resposta_a").isEmpty() || request.getParameter("resposta_b").isEmpty() || request.getParameter("resposta_c").isEmpty() || request.getParameter("resposta_d").isEmpty() || request.getParameter("resposta_e").isEmpty() || request.getParameter("resposta_a") == null || request.getParameter("resposta_b") == null || request.getParameter("resposta_c") == null || request.getParameter("resposta_d") == null || request.getParameter("resposta_e") == null || request.getParameter("check") == null || request.getParameter("check").isEmpty()) {
            return 1;
        } else if (request.getParameter("resposta_a").equalsIgnoreCase(request.getParameter("resposta_b")) || request.getParameter("resposta_a").equalsIgnoreCase(request.getParameter("resposta_c")) || request.getParameter("resposta_a").equalsIgnoreCase(request.getParameter("resposta_d")) || request.getParameter("resposta_a").equalsIgnoreCase(request.getParameter("resposta_e")) || request.getParameter("resposta_b").equalsIgnoreCase(request.getParameter("resposta_c")) || request.getParameter("resposta_b").equalsIgnoreCase(request.getParameter("resposta_d")) || request.getParameter("resposta_b").equalsIgnoreCase(request.getParameter("resposta_e")) || request.getParameter("resposta_c").equalsIgnoreCase(request.getParameter("resposta_d")) || request.getParameter("resposta_c").equalsIgnoreCase(request.getParameter("resposta_e")) || request.getParameter("resposta_d").equalsIgnoreCase(request.getParameter("resposta_e"))) {
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
        Pergunta questao = new Pergunta();
        questao.setId(id);
        questao.setTitulo((String) request.getParameter("questao_Titulo"));
        questao.setQuestao((String) request.getParameter("questao_Pergunta"));
        Resposta[] alternativa = new Resposta[5];
        List<Resposta> resposta = new RespostaDao().listarPergunta();
        int olho = 0;
        for (int i = 0; i < resposta.size(); i++) {
            if (resposta.get(i).getId_pergunta() == id) {

                olho = resposta.get(i).getId();
                break;
            }
        }

        String valor = request.getParameter("echeck");
        
        //Valor de 0
        if (valor.equals("0")) {
            alternativa[0] = new Resposta(request.getParameter("resp_a"), true, olho);
            alternativa[1] = new Resposta(request.getParameter("resp_b"), false, (olho + 1));
            alternativa[2] = new Resposta(request.getParameter("resp_c"), false, (olho + 2));
            alternativa[3] = new Resposta(request.getParameter("resp_d"), false, (olho + 3));
            alternativa[4] = new Resposta(request.getParameter("resp_e"), false, (olho + 4));
        }
        
         //Valor de 1
        if (valor.equals("1")) {
            alternativa[1] = new Resposta(request.getParameter("resp_b"), true, (olho + 1));
            alternativa[0] = new Resposta(request.getParameter("resp_a"), false, olho);
            alternativa[2] = new Resposta(request.getParameter("resp_c"), false, (olho + 2));
            alternativa[3] = new Resposta(request.getParameter("resp_d"), false, (olho + 3));
            alternativa[4] = new Resposta(request.getParameter("resp_e"), false, (olho + 4));
        }
        
         //Valor de 2
        if (valor.equals("2")) {
            alternativa[2] = new Resposta(request.getParameter("resp_c"), true, (olho + 2));
            alternativa[0] = new Resposta(request.getParameter("resp_a"), false, olho);
            alternativa[1] = new Resposta(request.getParameter("resp_b"), false, (olho + 1));
            alternativa[3] = new Resposta(request.getParameter("resp_d"), false, (olho + 3));
            alternativa[4] = new Resposta(request.getParameter("resp_e"), false, (olho + 4));
        }
        
         //Valor de 3
        if (valor.equals("3")) {
            alternativa[3] = new Resposta(request.getParameter("resp_d"), true, (olho + 3));
            alternativa[0] = new Resposta(request.getParameter("resp_a"), false, olho);
            alternativa[1] = new Resposta(request.getParameter("resp_b"), false, (olho + 1));
            alternativa[2] = new Resposta(request.getParameter("resp_c"), false, (olho + 2));
            alternativa[4] = new Resposta(request.getParameter("resp_e"), false, (olho + 4));
        }
        
         //Valor de 4
        if (valor.equals("4")) {
            alternativa[4] = new Resposta(request.getParameter("resp_e"), true, (olho + 4));
            alternativa[0] = new Resposta(request.getParameter("resp_a"), false, olho);
            alternativa[1] = new Resposta(request.getParameter("resp_b"), false, (olho + 1));
            alternativa[2] = new Resposta(request.getParameter("resp_c"), false, (olho + 2));
            alternativa[3] = new Resposta(request.getParameter("resp_d"), false, (olho + 3));
        }
        
        questao.setResposta_certa(alternativa);

        //Mandando para o BD
        PerguntaDao editar = new PerguntaDao();
        if(editar.atualizar(questao)){
            RespostaDao editarResposta = new RespostaDao();
            int cont = 0;
            //Cadastrando Resposta
                for (Resposta alternativas : alternativa) {
                    if (editarResposta.atualizar(alternativas.getResposta(), id, alternativas.isCorreta(), alternativas.getId())) {
                        cont++;
                    }
                }
                if (cont == 5) {
                    //Cadastrou a Pergunta e as Alternativas
                    return true;
                }else{
                    return false;
                }
        }else{
            return false;
        }
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.servlets;

import br.edu.ifgoiano.modelo.Usuario;
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
@WebServlet(name = "SegurancaServlet", urlPatterns = {"/SegurancaServlet"})
public class SegurancaServlet extends HttpServlet {

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
        //System.out.println(request.getParameter("btn"));
        if (request.getParameter("btn").equals("sair")) {
            logout(session, request, response);
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

    public static int kickUser(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        Usuario user = (Usuario) session.getAttribute("user_logado");

        if (user == null) {
            //session.setAttribute("msg", "acesso_negado");
            session.setAttribute("erro_login", "acesso_negado");
            String url = String.valueOf(request.getRequestURL());
            if (url.contentEquals("/user/index.jsp") || url.contentEquals("/admin/index.jsp")
                    || url.contentEquals("/admin/editar_questao.jsp")
                    || url.contentEquals("/admin/questoes.jsp")
                    || url.contentEquals("ranking.jsp")
                    || url.contentEquals("quiz.jsp")) {
                //response.sendRedirect("index.jsp");
                return 0;
            }
            return 0;
        } else {
            if (user.getTipo() == 0) {
                //session.setAttribute("msg", "acesso_negado");
                session.setAttribute("erro_login", "acesso_negado");
                String url = String.valueOf(request.getRequestURL());
                if (url.contentEquals("/admin/index.jsp") || url.contentEquals("/admin/editar_questao.jsp")
                        || url.contentEquals("/admin/questoes.jsp")) {
                    //response.sendRedirect("../user/index.jsp");
                    return 1;
                }
            }else if(user.getTipo() == 1){
                return 3;
            }
            
            return 2;
        }
    }

    public static void logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        session.setAttribute("user_logado", null);
        session.setAttribute("NovoQuiz", null);
        session.setAttribute("erro_login", "deslogado");
        response.sendRedirect("index.jsp");

    }
}

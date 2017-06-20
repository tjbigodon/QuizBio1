/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.servlets;

import br.edu.ifgoiano.modelo.Usuario;
import br.edu.ifgoiano.persistencia.UsuarioDao;
import br.edu.ifgoiano.utilitarios.Criptografia;
import br.edu.ifgoiano.utilitarios.ValidacaoLogin;
import java.io.IOException;
import static java.lang.System.out;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tarcisio
 */
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

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

        String tipo_btn = request.getParameter("btn");

        if (tipo_btn != null && tipo_btn.equalsIgnoreCase("cadastrar")) {
            int opCad = cadastrarUsu(request, response);

            if (opCad == 0) {
                session.setAttribute("erro_cadastro", "false");
                response.sendRedirect("cadastro.jsp");
            } else if (opCad == 1) {
                session.setAttribute("erro_cadastro", "bd");
                response.sendRedirect("cadastro.jsp");
            } else if (opCad == 2) {
                session.setAttribute("erro_cadastro", "senha_dif");
                response.sendRedirect("cadastro.jsp");
            } else if (opCad == 3) {
                session.setAttribute("erro_cadastro", "vazio");
                response.sendRedirect("cadastro.jsp");
            } else if (opCad == 4) {
                session.setAttribute("erro_cadastro", "email_inv");
                response.sendRedirect("cadastro.jsp");
            }
        } else if (tipo_btn != null && tipo_btn.equalsIgnoreCase("entrar")) {
            

            if (request.getParameter("usuario").isEmpty() || request.getParameter("usuario")==null || request.getParameter("senha") == null || request.getParameter("senha").isEmpty()) {
                session.setAttribute("erro_login", "vazio");
                response.sendRedirect("index.jsp");
            } else {
                String username = request.getParameter("usuario");
                String senhaCrip = Criptografia.criptografar(request.getParameter("senha"));
                int opLogin = ValidacaoLogin.validaLogin(username, senhaCrip);

                if (opLogin == -1) {
                    session.setAttribute("user_logado", new UsuarioDao().buscarPorNick(username));
                    session.setAttribute("erro_login", null);
                    response.sendRedirect("admin/");
                } else if (opLogin == 0) {
                    session.setAttribute("user_logado", new UsuarioDao().buscarPorNick(username));
                    session.setAttribute("erro_login", null);
                    response.sendRedirect("user/");
                } else if (opLogin == 1) {
                    session.setAttribute("erro_login", "nao_existe");
                    response.sendRedirect("index.jsp");
                } else {
                    session.setAttribute("erro_login", "incorreto");
                    response.sendRedirect("index.jsp");
                }
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

    public static int cadastrarUsu(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Usuario usuario = new Usuario();
        if (!(request.getParameter("senhaUsu").equals(request.getParameter("confSenhaUsu")))) {
            return 2;
        } else if (request.getParameter("nickUsu").isEmpty() || request.getParameter("emailUsu").isEmpty() || request.getParameter("senhaUsu").isEmpty() || request.getParameter("confSenhaUsu").isEmpty()) {
            return 3;
        } else {
            usuario.setEmail(request.getParameter("emailUsu"));
            if (usuario.getEmail().contains("@") && usuario.getEmail().contains(".")) {
                if (usuario.getEmail().indexOf("@") >= usuario.getEmail().indexOf(".") || (usuario.getEmail().indexOf(".") - usuario.getEmail().indexOf("@") < 2)||(usuario.getEmail().indexOf("@")==0||usuario.getEmail().indexOf(".")==usuario.getEmail().length()-1)) {
                    return 4;
                } else {
                    usuario.setNome(request.getParameter("nomeUsu") + "_" + request.getParameter("sobrenomeUsu"));
                    usuario.setNick(request.getParameter("nickUsu"));
                    usuario.setSenha(Criptografia.criptografar(request.getParameter("senhaUsu")));
                    usuario.setTipo(0);
                    UsuarioDao usu = new UsuarioDao();
                    if (usu.cadastrar(usuario)) {
                        return 0;
                    }else{
                        return 1;
                    }
                }
            }else{
                return 4;
            }
        }
    }

}

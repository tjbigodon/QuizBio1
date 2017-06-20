/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.servlets;

import br.edu.ifgoiano.modelo.Usuario;
import br.edu.ifgoiano.persistencia.UsuarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tarcisio
 */
@WebServlet(name = "NewServlet", urlPatterns = {"/NewServlet"})
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
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String tipo_btn = request.getParameter("btn");
        
        if(tipo_btn.equalsIgnoreCase("cadastrar")){
            if(cadastrarUsu(request, response)){
                System.out.println("Cadastro Realizado");
                out.println("<br><p>Cadastrado Usuário</p>");
            }else{
                System.out.println("Não Cadastrado");
                out.println("<br><p>Não foi possível cadastrar o Usuário</p>");
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

    public static boolean cadastrarUsu(HttpServletRequest request, HttpServletResponse response) {
        Usuario usuario = new Usuario();
        
        usuario.setNome(request.getParameter("nomeUsu") + " " + request.getParameter("sobrenomeUsu"));
        usuario.setNick(request.getParameter("nickUsu"));
        usuario.setSenha(request.getParameter("senhaUsu"));
        usuario.setEmail(request.getParameter("emailUsu"));
        usuario.setTipo(0);
        
        if (request.getParameter("senhaUsu").equals(request.getParameter("confSenhaUsu"))) {
            UsuarioDao usu = new UsuarioDao();
            
            if(usu.cadastrar(usuario)){
                return true;
            }else{
                return false;
            }
            
        }else{
            System.out.println("Senhas diferentes");
            return false;
        }
    }
    
}

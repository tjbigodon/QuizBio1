package br.edu.ifgoiano.utilitarios;

import br.edu.ifgoiano.modelo.Usuario;
import br.edu.ifgoiano.persistencia.UsuarioDao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author livre
 */
public class ValidacaoLogin {
    public static int validaLogin(String username, String senhaCrip){
        UsuarioDao udao = new UsuarioDao();
        
        Usuario user = udao.buscarPorNick(username);
        
        if(user==null){
            return 1;
        }else{
            if(!username.equals(user.getNick())||!senhaCrip.equals(user.getSenha())){
                return 2;
            } else if(user.getTipo()==0){
                return 0;
            } else if(user.getTipo()==1){
                return -1;
            }else{
                return 15;
            }
        }
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.persistencia;

import br.edu.ifgoiano.modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Naiane
 */
public class UsuarioDao {
    Connection connection;

    public UsuarioDao() {
        this.connection = new ConnectionFactory().getConnection();
    }
    
    public boolean cadastrar(Usuario usuario){
        String sql = "INSERT INTO usuario(nome,email,senha, username, tipo) VALUES (?,?,?,?,?);";
        
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha());
            stmt.setString(4, usuario.getNick());
            stmt.setInt(5, usuario.getTipo());
            
            stmt.execute();
            stmt.close();
                        
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    //logar
    
}

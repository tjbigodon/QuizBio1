/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.persistencia;

import br.edu.ifgoiano.modelo.Pergunta;
import br.edu.ifgoiano.modelo.Resposta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Naiane
 */
public class PerguntaDao {
    Connection connection;

    public PerguntaDao() {
        this.connection = new ConnectionFactory().getConnection();
    }
    
    public boolean cadastrar(Pergunta pergunta){
        String sql = "INSERT INTO pergunta(pergunta,resp_certa) VALUES (?,?);";
        
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, pergunta.getPergunta());
            stmt.setInt(2, pergunta.getResposta_certa().getId());
            
            stmt.execute();
            stmt.close();
                        
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(PerguntaDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean atualizar(Pergunta pergunta){
        String sql = "UPDATE pergunta SET pergunta=?, resp_certa=? WHERE id=?;";
        
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, pergunta.getPergunta());
            stmt.setInt(2, pergunta.getResposta_certa().getId());
            stmt.setInt(3, pergunta.getId());
            
            stmt.execute();
            stmt.close();
                        
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(PerguntaDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
        
    public boolean deletar(Pergunta pergunta){
        String sql = "DELETE FROM pergunta WHERE id=?;";
        
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, pergunta.getId());
            
            stmt.execute();
            stmt.close();
                        
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(PerguntaDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
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
public class RespostaDao {
    Connection connection;

    public RespostaDao() {
        this.connection = new ConnectionFactory().getConnection();
    }
    
    public boolean cadastrar(Resposta resposta){
        String sql = "INSERT INTO resposta(resposta,id_pergunta) VALUES (?,?);";
        
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, resposta.getResposta());
            stmt.setInt(2, resposta.getId_pergunta().getId());
            
            stmt.execute();
            stmt.close();
                        
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RespostaDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean atualizar(Resposta resposta){
        String sql = "UPDATE resposta SET resposta=?, id_pergunta=? WHERE id=?;";
        
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, resposta.getResposta());
            stmt.setInt(2, resposta.getId_pergunta().getId());
            stmt.setInt(3, resposta.getId());
            
            stmt.execute();
            stmt.close();
                        
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RespostaDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
        
    public boolean deletar(Resposta resposta){
        String sql = "DELETE FROM resposta WHERE id=?;";
        
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, resposta.getId());
            
            stmt.execute();
            stmt.close();
                        
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RespostaDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public ArrayList<Resposta> pesquisarPorPergunta(int id){
        String sql = "SELECT * FROM resposta WHERE id_pergunta=?;";
        
        try {
            
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            ArrayList<Resposta> lista = new ArrayList();
            while(rs.next()){
                Resposta resposta = new Resposta();
                resposta.setId(rs.getInt("id"));
                resposta.setResposta(rs.getString("resposta"));
                
                Pergunta pergunta = new Pergunta();
                pergunta.setId(rs.getInt("id_pergunta"));
                resposta.setId_pergunta(pergunta);
                lista.add(resposta);
            }
            
            rs.close();
            stmt.close();
            
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(RespostaDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
}

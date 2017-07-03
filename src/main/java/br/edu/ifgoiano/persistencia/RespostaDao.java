/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.persistencia;

import br.edu.ifgoiano.modelo.Resposta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
    
    public boolean cadastrar(String resposta, int id_pergunta, boolean correta){
        String sql = "INSERT INTO resposta(resposta, certa, id_pergunta) VALUES (?,?,?);";
        
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setObject(1, resposta);
            stmt.setBoolean(2, correta);
            stmt.setInt(3, id_pergunta);
            
            stmt.execute();
            stmt.close();
                        
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RespostaDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean atualizar(String resposta, int id_pergunta, boolean correta, int id){
        String sql = "UPDATE resposta SET resposta = ?, certa = ? WHERE id_pergunta = ? AND id = ?;";
        
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setObject(1, resposta);
            stmt.setBoolean(2, correta);            
            stmt.setInt(3, id_pergunta);
            stmt.setInt(4, id);
            
            stmt.execute();
            stmt.close();
                        
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RespostaDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
        
    public boolean deletar(int id){
        String sql = "DELETE FROM resposta WHERE id_pergunta LIKE ?;";
        
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            
            stmt.execute();
            stmt.close();
                        
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RespostaDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public List<Resposta> pesquisarPergunta(int id){
        String sql = "SELECT * FROM resposta WHERE id_pergunta=?;";
        
        try {
            
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            ArrayList<Resposta> lista = new ArrayList();
            while(rs.next()){
                Resposta resposta = new Resposta();
                resposta.setId(rs.getInt("id"));
                resposta.setId_pergunta(rs.getInt("id_pergunta"));
                resposta.setResposta(rs.getString("resposta"));
                resposta.setCorreta(rs.getBoolean("certa"));
                
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
    
    public Resposta pesquisarPerguntaCerta(int id){
        String sql = "SELECT * FROM resposta WHERE id_pergunta = ? AND certa = 1;";
        
        try {
            
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            Resposta respostaCerta = new Resposta();
            while(rs.next()){
                respostaCerta.setId(rs.getInt("id"));
                respostaCerta.setId_pergunta(rs.getInt("id_pergunta"));
                respostaCerta.setResposta(rs.getString("resposta"));
                respostaCerta.setCorreta(rs.getBoolean("certa"));
            }
            
            rs.close();
            stmt.close();
            
            return respostaCerta;
        } catch (SQLException ex) {
            Logger.getLogger(RespostaDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
    
    public List<Resposta> listarPergunta(){
        String sql = "SELECT * FROM resposta";
        
        try {
            
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            List<Resposta> list_resposta = new ArrayList();
            while(rs.next()){
                Resposta resposta = new Resposta();
                resposta.setId(rs.getInt("id"));
                resposta.setResposta(rs.getString("resposta"));
                resposta.setCorreta(rs.getBoolean("certa"));
                resposta.setId_pergunta(rs.getInt("id_pergunta"));
                list_resposta.add(resposta);
            }
            
            rs.close();
            stmt.close();
            
            return list_resposta;
        } catch (SQLException ex) {
            Logger.getLogger(RespostaDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
}

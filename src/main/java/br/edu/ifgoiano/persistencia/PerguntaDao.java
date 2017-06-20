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
import java.util.List;
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
        String sql = "INSERT INTO questao(pergunta,resp_quest) VALUES (?,?);";
        
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, pergunta.getQuestao());
            stmt.setObject(2, pergunta.getResposta());
            
            stmt.execute();
            stmt.close();
                        
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(PerguntaDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean atualizar(Pergunta pergunta){
        String sql = "UPDATE questao SET pergunta=?, resp_quest=? WHERE id=?;";
        
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, pergunta.getQuestao());
            stmt.setObject(2, pergunta.getResposta().get(pergunta.getId()).getId());
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
        String sql = "DELETE FROM questao WHERE id=?;";
        
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
    
    /**
     * Pesquisa de dados na tabela Questao
     * @return
     */
    public List<Pergunta> getLista() {
        String sql = "SELECT * FROM pergunta";

        try {
            List<Pergunta> questao_retorno = new ArrayList();
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Pergunta nQuest = new Pergunta();
                
                nQuest.setTitulo(rs.getString("titulo"));
                nQuest.setId(rs.getInt("id"));
                nQuest.setQuestao(rs.getString("pergunta"));
                nQuest.setResposta((List<Resposta>) rs.getObject("resp_quest"));
                
                questao_retorno.add(nQuest);
                
            }
            rs.close();
            stmt.close();
            return questao_retorno;
        } catch (SQLException ex) {
            Logger.getLogger(PerguntaDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
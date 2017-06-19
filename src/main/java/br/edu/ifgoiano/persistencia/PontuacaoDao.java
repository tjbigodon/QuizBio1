/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.persistencia;

import br.edu.ifgoiano.modelo.Pontuacao;
import br.edu.ifgoiano.modelo.Resposta;
import br.edu.ifgoiano.modelo.Usuario;
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
public class PontuacaoDao {
    Connection connection;

    public PontuacaoDao() {
        this.connection = new ConnectionFactory().getConnection();
    }
    
    public boolean cadastrar(Pontuacao pontuacao){
        String sql = "INSERT INTO pontuacao(id_usuario,pontos) VALUES (?,?);";
        
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, pontuacao.getId_usuario().getId());
            stmt.setInt(2, pontuacao.getPontos());
            
            stmt.execute();
            stmt.close();
                        
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(PontuacaoDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public ArrayList<Pontuacao> listar(int id){
        String sql = "SELECT * FROM pontuacao WHERE id=?;";
        
        try {
            
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            ArrayList<Pontuacao> lista = new ArrayList();
            while(rs.next()){
                Pontuacao pontuacao = new Pontuacao();
                pontuacao.setId(rs.getInt("id"));
                pontuacao.setPontos(rs.getInt("pontos"));
                
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id_usuario"));
                pontuacao.setId_usuario(usuario);
                
                lista.add(pontuacao);
            }
            
            rs.close();
            stmt.close();
            
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(PontuacaoDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
}

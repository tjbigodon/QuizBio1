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
import java.sql.Statement;
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

    public int cadastrar(Pergunta pergunta) {
        String sql = "INSERT INTO questao(pergunta,titulo) VALUES (?,?);";

        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, pergunta.getQuestao());
            stmt.setString(2, pergunta.getTitulo());

            stmt.execute();

            ResultSet retornoID = stmt.getGeneratedKeys();

            int id = -1;

            if (retornoID.next()) {
                id = retornoID.getInt(1);
            } else {
                // throw an exception from here
            }

            stmt.close();

            return id;
        } catch (SQLException ex) {
            Logger.getLogger(PerguntaDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public boolean atualizar(Pergunta pergunta) {
        String sql = "UPDATE questao SET titulo = ?, pergunta = ? WHERE id=?;";

        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, pergunta.getTitulo());
            stmt.setString(2, pergunta.getQuestao());
            stmt.setInt(3, pergunta.getId());

            stmt.execute();
            stmt.close();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(PerguntaDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public boolean deletar(int id) {
        String sql = "DELETE FROM questao WHERE id LIKE ?;";

        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);

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
     *
     * @return
     */
    public List<Pergunta> getLista() {
        String sql = "SELECT * FROM questao";

        try {
            List<Pergunta> questao_retorno = new ArrayList();
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Pergunta nQuest = new Pergunta();
                RespostaDao resposta = new RespostaDao();
                List<Resposta> list_reposta = resposta.listarPergunta();

                nQuest.setTitulo(rs.getString("titulo"));
                nQuest.setId(rs.getInt("id"));
                nQuest.setQuestao(rs.getString("pergunta"));

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

    public Pergunta getPergunta(int idPergunta) {
        Pergunta questao_retorno = new Pergunta();
        String sql = "SELECT * FROM questao WHERE id = ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, idPergunta);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                questao_retorno.setTitulo(rs.getString("titulo"));
                questao_retorno.setId(rs.getInt("id"));
                questao_retorno.setQuestao(rs.getString("pergunta"));
            }
            rs.close();
            stmt.close();

        } catch (SQLException ex) {
            Logger.getLogger(PerguntaDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

        return questao_retorno;
    }
}

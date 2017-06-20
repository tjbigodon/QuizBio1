/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.modelo;

import java.util.List;
import javax.jws.WebService;

/**
 *
 * @author Naiane
 */
public class Pergunta {
    private int id;
    private String questao, titulo;
    private List<Resposta> resposta_certa;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestao() {
        return questao;
    }

    public void setQuestao(String questao) {
        this.questao = questao;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public List<Resposta> getResposta() {
        return resposta_certa;
    }

    public void setResposta(List<Resposta> resposta_certa) {
        this.resposta_certa = resposta_certa;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.modelo;

import java.util.List;

/**
 *
 * @author Naiane
 */
public class Pergunta {
    private int id;
    private String questao, titulo;
    private Resposta[] resposta_certa = new Resposta[5];

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

    public Resposta[] getResposta_certa() {
        return resposta_certa;
    }

    public void setResposta_certa(Resposta[] resposta_certa) {
        this.resposta_certa = resposta_certa;
    }
    
}

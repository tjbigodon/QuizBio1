/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.modelo;

/**
 *
 * @author Naiane
 */
public class Pergunta {
    private int id;
    private String pergunta;
    private int resposta_certa;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPergunta() {
        return pergunta;
    }

    public void setPergunta(String pergunta) {
        this.pergunta = pergunta;
    }

    public int getResposta_certa() {
        return resposta_certa;
    }

    public void setResposta_certa(int resposta_certa) {
        this.resposta_certa = resposta_certa;
    }
    
    
}

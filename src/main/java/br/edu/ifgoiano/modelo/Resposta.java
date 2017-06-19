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
public class Resposta {
    private int id;
    private Pergunta id_pergunta;
    private String resposta;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Pergunta getId_pergunta() {
        return id_pergunta;
    }

    public void setId_pergunta(Pergunta id_pergunta) {
        this.id_pergunta = id_pergunta;
    }

    public String getResposta() {
        return resposta;
    }

    public void setResposta(String resposta) {
        this.resposta = resposta;
    }
    
    
}

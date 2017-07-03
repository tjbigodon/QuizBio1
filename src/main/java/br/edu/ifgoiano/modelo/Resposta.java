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
    private int id_pergunta;
    private String resposta;
    private boolean correta;

    public Resposta(String resposta, boolean correta) {
        this.resposta = resposta;
        this.correta = correta;
    }
    
    public Resposta(String resposta, boolean correta, int id) {
        this.resposta = resposta;
        this.correta = correta;
        this.id = id;
    }
    
    public Resposta() {
        this.correta = false;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_pergunta() {
        return id_pergunta;
    }

    public void setId_pergunta(int id_pergunta) {
        this.id_pergunta = id_pergunta;
    }

    public String getResposta() {
        return resposta;
    }

    public void setResposta(String resposta) {
        this.resposta = resposta;
    }

    public boolean isCorreta() {
        return correta;
    }

    public void setCorreta(boolean correta) {
        this.correta = correta;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cadastros;

import br.edu.ifgoiano.modelo.Pergunta;
import br.edu.ifgoiano.modelo.Resposta;
import br.edu.ifgoiano.persistencia.PerguntaDao;
import br.edu.ifgoiano.persistencia.RespostaDao;

/**
 *
 * @author Jehymeson Gil
 */
public class TestesCadastros {

    public static void main(String[] args) {
        if (cadastrarQuestao()) {
            System.out.println("Cadastrou");
        } else {
            System.out.println("Não Cadastrou");
        }
    }

    public static boolean cadastrarQuestao() {
        Pergunta perg = new Pergunta();
        Resposta[] resp = {
            new Resposta("As Winx", false),
            new Resposta("Guitarra Humana", false),
            new Resposta("Homem Cama", false),
            new Resposta("MC Kekeu", false),
            new Resposta("Papa Capim dos Meu Sonho", true)
        };

        PerguntaDao daoPergunta = new PerguntaDao();
        RespostaDao daoResposta = new RespostaDao();

        //Insere a Questão
        perg.setQuestao("O que é muita melodia?");
        perg.setTitulo("Papa Capim");
        perg.setResposta_certa(resp);
        int id_quest = daoPergunta.cadastrar(perg);
        if (id_quest != 0) {
            System.out.println("|--- Cadastro de Questão ---|");
            System.out.println("|---------------------------|");
            System.out.println("|-> Cadastrado              |");
            System.out.println("|'''''''''''''''''''''''''''|");
            System.out.println("|-- Cadastro de Resposta  --|");

            int cont = 0;
            //Cadastrando Resposta
            for (int i = 0; i < resp.length; i++) {
                if (daoResposta.cadastrar(resp[i].getResposta(), id_quest, resp[i].isCorreta())) {
                    cont++;
                }
            }
            if (cont == 5) {
                System.out.println("|-> Cadastrado a resposta   |");
                System.out.println("|'''''''''''''''''''''''''''|");
                return true;
            } else {
                System.out.println("|-> Falha ao cadastrar resp |");
                System.out.println("|'''''''''''''''''''''''''''|");
            }

        } else {
            System.out.println("|--- Cadastro de Questão ---|");
            System.out.println("|---------------------------|");
            System.out.println("|-> Falha ao cadastrar      |");
            System.out.println("|'''''''''''''''''''''''''''|");
        }

        return false;
    }
}

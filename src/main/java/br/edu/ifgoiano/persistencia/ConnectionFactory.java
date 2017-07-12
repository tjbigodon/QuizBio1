/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Naiane
 */
public class ConnectionFactory {
    /*
    private final String host = "jdbc:mysql://localhost:3306/quiz_bd?zeroDateTimeBehavior=convertToNull";
    private final String user = "root";
    private final String password = "";
    private final String driver = "com.mysql.jdbc.Driver";
    //*/
    ///*
    private final String host = "jdbc:mysql://node155520-botaniquiz.j.layershift.co.uk/quiz_bd";
    private final String user = "quiz_bd";
    private final String password = "Snk8TxKkX0jWd4CN";
    private final String driver = "com.mysql.jdbc.Driver";
    //*/
    public Connection getConnection() {
        try {
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException e) {
                System.out.println(e);
            }
            return DriverManager.getConnection(host, user, password);
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
    public void closeConnection(){
        try {
            ConnectionFactory.super.finalize();
        } catch (Throwable ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

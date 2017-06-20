/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Naiane
 */
public class ConnectionFactory {
     public Connection getConnection(){
        try {
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz_bd","root","");
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}

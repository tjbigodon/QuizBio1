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
    private final String host = 	"https://node154737-12345.j.layershift.co.uk";
	private final String login = 	"admin";
	private final String password = "7jV30nIvDM5QJsS7";
	private	final String bd = 	"quiz_bd";
	private final String driver =	"jdbc:mysql";

     public Connection getConnection(){
        try {
            return DriverManager.getConnection(driver+"/"+host+"/"+bd,login,password);
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}

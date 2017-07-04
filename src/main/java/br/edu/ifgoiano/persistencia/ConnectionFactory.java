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

    private final String host = "node154847-connection-bio01.j.layershift.co.uk/quiz_bd";
    private final String user = "user_quiz";
    private final String password = "CCPVIg78uh5srKI0";
    private final String driver = "com.mysql.jdbc.Driver";

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
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.infox.dal;
import java.sql.*;

/**
 *
 * @author Winy
 */
public class ModuloConexao {
    //metodo para estabelecer conexao com o banco
    public static Connection conector(){
        java.sql.Connection conexao = null;
        //chama o driver atribui o connector que esta na biblioteca tipo de bd
        String driver = "com.mysql.jdbc.Driver";
        //Armazenando info referente ao banco
        String url = "jdbc:mysql://localhost:3306/dbordemservico?useSSL=false";
        String user = "root";
        String password = "1234";
        
        //estabelecendo a conexao com o bd
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);
            return conexao;
        } catch (Exception e){
            //System.out.println(e);
            return null;
            
        } 
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author LuckyCharm
 */
public class database {

    public static boolean validate(String email, String password) {
        boolean status = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/secure", "root", "");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM data_owner WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static boolean uservalidate(String email, String pass) {
        boolean status = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/secure", "root", "");
            PreparedStatement ps = con.prepareStatement(
                    "select * from data_user where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static boolean CloudProvidervalidate(String email, String pass) {
        boolean status = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/secure", "root", "");
            PreparedStatement ps = con.prepareStatement(
                    "select * from cloudprovider where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return status;
    }
}

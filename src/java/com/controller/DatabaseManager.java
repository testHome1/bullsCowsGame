package com.controller;

import com.model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DatabaseManager {

    private Connection connection = null;
    private Statement statement = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private String url = "";
    private String dbName = "";
    private String driver = "";
    private String userName = "";
    private String password = "";

    public DatabaseManager(String url, String dbName, String driver, String userName, String password) {
        this.url = url;
        this.dbName = dbName;
        this.userName = userName;
        this.password = password;
        init();
    }

    private void init() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.url = url + dbName;
            this.connection = (Connection) DriverManager.getConnection(this.url, this.userName, this.password);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void closeConnection() {
        try {
            if(preparedStatement != null)
                preparedStatement.close();
            if(statement != null)    
                statement.close();
            if(connection != null)
                connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //Todo потом в дао запихнуть

    public User getUserFromDatabase(String userName, String password) {
        try {
            String query = "SELECT * FROM users WHERE userName = '" + userName + "' AND password = '" + password + "'";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                User user = new User(resultSet.getString(1), resultSet.getString(2));
                return user;
            }            
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public Statement getStatement() {
        return statement;
    }

    public void setStatement(Statement statement) {
        this.statement = statement;
    }

    public PreparedStatement getPreparedStatement() {
        return preparedStatement;
    }

    public void setPreparedStatement(PreparedStatement preparedStatement) {
        this.preparedStatement = preparedStatement;
    }

    public ResultSet getResultSet() {
        return resultSet;
    }

    public void setResultSet(ResultSet resultSet) {
        this.resultSet = resultSet;
    }
}

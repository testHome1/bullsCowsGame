package com.dao;

import com.controller.DatabaseManager;
import com.model.User;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDaoImpl implements UserDao{
    private DatabaseManager db = null;
    
    public UserDaoImpl(DatabaseManager db) {
        this.db = db;
    }
    
    @Override
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<User>();
        try {
            db.setPreparedStatement(db.getConnection().prepareStatement("SELECT * FROM users"));
            db.setResultSet(db.getPreparedStatement().executeQuery());
            while(db.getResultSet().next()) {
                users.add(new User(db.getResultSet().getString("userName"), db.getResultSet().getString("password")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    @Override
    public User getUser(int id) {
        User user = null;
        try {
            db.setPreparedStatement(db.getConnection().prepareStatement("SELECT * FROM city WHERE id = ?"));
            db.getPreparedStatement().setInt(1, id);
            db.setResultSet(db.getPreparedStatement().executeQuery());
        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    @Override
    public void updateUser(User user) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void deleteUser(User user) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}

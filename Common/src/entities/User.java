package entities;

import java.io.Serializable;

import enums.UserType;

/**
 * Represents a user in the system. Implements {@link Serializable} to allow instances to be serialized.
 */
public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private String password;
	private int isLoggedIn;
	private UserType type;
	private int registered;

    // Constructor
    public User(String userName, String password, int isLoggedIn, UserType type, int registered) {
        this.userName = userName;
        this.password = password;
        this.isLoggedIn = isLoggedIn;
        this.type = type;
        this.registered = registered;
    }

    public User(String userName, String password) {
    	this.userName = userName;
        this.password = password;
    }
    
    public User(String userName, String password, UserType type) {
    	this.userName = userName;
        this.password = password;
        this.type = type;
    }
    
    // userName getter and setter
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    // password getter and setter
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public int getisLoggedIn() {return isLoggedIn;}
    public void setisLoggedIn(int isLoggedIn) {this.isLoggedIn = isLoggedIn;}
    
    public UserType getUserType() { return type; }
    public void setUserType(UserType type) { this.type = type; }
    
    public int getRegistered() { return registered; }
    public void setRegistered(int registered) { this.registered = registered; }
    
}

package org.andy.kmap.model.entity;

/**
 * Created by li on 2015/9/27.
 */
public class LoginViewModel {

    private String userEmail;

    private String userRole;

    private String userName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public LoginViewModel(String userEmail, String userRole,String userName){

        this.userEmail=userEmail;
        this.userRole=userRole;
        this.userName=userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }
}

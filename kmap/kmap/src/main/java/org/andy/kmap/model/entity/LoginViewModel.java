package org.andy.kmap.model.entity;

/**
 * Created by li on 2015/9/27.
 */
public class LoginViewModel {

    private String userEmail;

    private String userRole;

    public LoginViewModel(String userEmail,String userRole){

        this.userEmail=userEmail;
        this.userRole=userRole;
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

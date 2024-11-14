/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ptit.library.model;

/**
 *
 * @author Admin
 */
public class ValidationResponse {
    private boolean valid;
    private String usernameMessage;
    private String emailMessage;
    private String passwordMessage;
    private String retypePasswordMessage;
    private String globalMessage;

    public ValidationResponse() {
        this.valid = true; // Giả sử mặc định là hợp lệ
        this.usernameMessage = "valid";
        this.emailMessage = "valid";
        this.passwordMessage = "valid";
        this.retypePasswordMessage = "valid";
        this.globalMessage = "valid";
    }

    // Getters and setters
    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public String getUsernameMessage() {
        return usernameMessage;
    }

    public void setUsernameMessage(String usernameMessage) {
        this.usernameMessage = usernameMessage;
    }

    public String getEmailMessage() {
        return emailMessage;
    }

    public void setEmailMessage(String emailMessage) {
        this.emailMessage = emailMessage;
    }

    public String getPasswordMessage() {
        return passwordMessage;
    }

    public void setPasswordMessage(String passwordMessage) {
        this.passwordMessage = passwordMessage;
    }

    public String getRetypePasswordMessage() {
        return retypePasswordMessage;
    }

    public void setRetypePasswordMessage(String retypePasswordMessage) {
        this.retypePasswordMessage = retypePasswordMessage;
    }

    public void setGlobalMessage(String globalMessage) {
        this.globalMessage = globalMessage;
    }

    public String getGlobalMessage() {
        return globalMessage;
    }
    
    

}

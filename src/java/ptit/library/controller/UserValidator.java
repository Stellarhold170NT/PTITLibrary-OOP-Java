/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ptit.library.controller;

import ptit.library.model.ValidationResponse;

/**
 *
 * @author Admin
 */
public class UserValidator {
    // Kiểm tra username chỉ chứa ký tự và số
    public static boolean isValidUsername(String username) {
        String regex = "^[a-zA-Z0-9]+$";
        return username != null && username.matches(regex);
    }

    // Kiểm tra email hợp lệ và có đuôi @stu.ptit.edu.vn
    public static boolean isValidEmail(String email) {
        String regex = "^[a-zA-Z0-9.]+@stu\\.ptit\\.edu\\.vn$";
        return email != null && email.matches(regex);
    }

    // Kiểm tra mật khẩu hợp lệ, chỉ chứa các ký tự đặc biệt trong giới hạn cho phép
    public static boolean isValidPassword(String password) {
        // Quy tắc cho phép ký tự đặc biệt
        String regex = "^[a-zA-Z0-9!@#$%^&*]{8,20}$";
        return password != null && password.matches(regex);
    }

    // Kiểm tra mật khẩu nhập lại có khớp không
    public static boolean doPasswordsMatch(String password, String retypePassword) {
        return retypePassword != null && password.equals(retypePassword);
    }

    // Kiểm tra độ mạnh yếu của mật khẩu
    public static String checkPasswordStrength(String password) {
        if (password.length() < 8) {
            return "Mật khẩu quá yếu (phải có ít nhất 8 ký tự)";
        }
        
        if (password.length() > 20) {
            return "Mật khẩu quá dài (tối đa 20 ký tự)";
        }
       
        
        String specialCharacter = "!@#$%^&*";
        
        if (!isValidPassword(password)) {
            return "Mật khẩu chỉ được chứa các ký tự đặc biệt như !@#$%^&*";
        }

        boolean hasUpperCase = false;
        boolean hasLowerCase = false;
        boolean hasDigit = false;
        boolean hasSpecialChar = false;

        for (char c : password.toCharArray()) {
            if (Character.isUpperCase(c)) hasUpperCase = true;
            else if (Character.isLowerCase(c)) hasLowerCase = true;
            else if (Character.isDigit(c)) hasDigit = true;
            else if (specialCharacter.contains(String.valueOf(c))) hasSpecialChar = true;
        }
        
        int cnt = 0;
        cnt += hasUpperCase ? 1 : 0;  
        cnt += hasLowerCase ? 1 : 0;  
        cnt += hasDigit ? 1 : 0;  
        cnt += hasSpecialChar ? 1 : 0; 

        if (cnt >= 3) {
            return "Mật khẩu mạnh";
        } else if (cnt >= 2 || password.length() >= 10) {
            return "Mật khẩu trung bình";
        } else {
            return "Mật khẩu yếu";
        }
    }
    
    // Validate Register
    public static ValidationResponse validateUser(String username, String email, String password, String retypePassword) {
        ValidationResponse result = new ValidationResponse();
        if (!isValidUsername(username)) {
            result.setValid(false);
            result.setUsernameMessage("Mã sinh viên không hợp lệ");
        }
        if (!isValidEmail(email)) {
            result.setValid(false);
            if (!email.endsWith("@stu.ptit.edu.vn")) {
                result.setEmailMessage("Bạn phải sử dụng email do Học Viện cung cấp");
            }
            else {
                result.setEmailMessage("Email không hợp lệ");
            }
        }
        if (!isValidPassword(password)) {
            result.setValid(false);
        }
        result.setPasswordMessage(checkPasswordStrength(password));

        if (!doPasswordsMatch(password, retypePassword)) {
            result.setValid(false);
            result.setRetypePasswordMessage("Mật khẩu nhập lại không khớp" + " " + password + " " + retypePassword);
        }
        
        return result;
    }
    
    
    // Validate Login
}

package com.sonht.springmvc.ultilities;

import javax.servlet.http.Part;

public class Ultilies {
	protected static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
	protected static final String PHONE_REGEX = "^\\+?[0-9]{10,15}$";
	
	public static boolean checkInputNullOrEmpty(String input) {
		return input != null && !input.trim().isEmpty() ;
	}
	public static boolean isValidEmail(String email) {
		return email.matches(EMAIL_REGEX);
	}
	
	public static boolean isValidPassword(String password) {
        // Kiểm tra độ dài tối thiểu 8 ký tự
        if (password.length() < 8) {
            return false;
        }

        // Sử dụng phương thức matches của String để kiểm tra các điều kiện
        boolean hasUpperCase = password.matches(".*[A-Z].*");          // Ít nhất 1 chữ cái in hoa
        boolean hasLowerCase = password.matches(".*[a-z].*");          // Ít nhất 1 chữ cái thường
        boolean hasDigit = password.matches(".*[0-9].*");              // Ít nhất 1 chữ số
        boolean hasSpecialChar = password.matches(".*[!@#$%^&*()\\-+=<>?{}\\[\\]~_].*"); // Ít nhất 1 ký tự đặc biệt

        // Trả về true nếu tất cả các điều kiện đều thỏa mãn
        return hasUpperCase && hasLowerCase && hasDigit && hasSpecialChar;
    }
	
	public static String getFileName(Part part) {
		String contentDisposition = part.getHeader("content-disposition");
		for (String cd : contentDisposition.split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
	
	
}

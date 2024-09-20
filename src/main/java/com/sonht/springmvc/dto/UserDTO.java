package com.sonht.springmvc.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

public class UserDTO {

	@NotEmpty(message = "Hãy nhập email")
	@Email(message = "Email không đúng định dạng")
	private String emailSignUp;

	@NotEmpty(message = "Hãy nhập họ và tên")
	private String fullName;

	@NotEmpty(message = "Hãy nhập mật khẩu")
	@Length(min = 8, message = "Độ dài của mật khẩu từ 8 ký tự trở lên")
	@Pattern(regexp = ".*[A-Z].*", message = "Mật khẩu có ít nhất một chữ cái viết Hoa")
	@Pattern(regexp = ".*[a-z].*", message = "Mật khẩu có ít nhất một chữ cái viết thường")
	@Pattern(regexp = ".*[0-9].*", message = "Mật khẩu có ít nhất một chữ cái viết thường")
	@Pattern(regexp = ".*[!@#$%^&*()\\-+=<>?{}\\[\\]~_].*", message = "Mật khẩu có ít nhất một kí tự đặc biệt")
	private String passwordSignup;

	@NotEmpty(message = "Hãy xác nhận lại mật khẩu")
	private String repassword;

	@NotEmpty(message = "Hãy chọn vai trò")
	private String roleName; // Tên role

	// Getters and Setters


	public String getFullName() {
		return fullName;
	}

	public String getEmailSignUp() {
		return emailSignUp;
	}

	public void setEmailSignUp(String emailSignUp) {
		this.emailSignUp = emailSignUp;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPasswordSignup() {
		return passwordSignup;
	}

	public void setPasswordSignup(String passwordSignup) {
		this.passwordSignup = passwordSignup;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	// Custom validation method for password confirmation
	public boolean isPasswordMatching() {
		return this.passwordSignup != null && this.passwordSignup.equals(this.repassword);
	}
	
	
	
}
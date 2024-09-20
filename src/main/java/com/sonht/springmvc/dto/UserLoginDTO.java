package com.sonht.springmvc.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

public class UserLoginDTO {
	@NotEmpty(message = "Hãy nhập email")
	@Email(message = "Email không đúng định dạng")
	private String emailLogin;

	@NotEmpty(message = "Hãy nhập mật khẩu")
	@Length(min = 8, message = "Độ dài của mật khẩu từ 8 ký tự trở lên")
	@Pattern(regexp = ".*[A-Z].*", message = "Mật khẩu có ít nhất một chữ cái viết Hoa")
	@Pattern(regexp = ".*[a-z].*", message = "Mật khẩu có ít nhất một chữ cái viết thường")
	@Pattern(regexp = ".*[0-9].*", message = "Mật khẩu có ít nhất một chữ cái viết thường")
	@Pattern(regexp = ".*[!@#$%^&*()\\-+=<>?{}\\[\\]~_].*", message = "Mật khẩu có ít nhất một kí tự đặc biệt")
	private String passwordLogin;

	public String getEmailLogin() {
		return emailLogin;
	}

	public void setEmailLogin(String emailLogin) {
		this.emailLogin = emailLogin;
	}

	public String getPasswordLogin() {
		return passwordLogin;
	}

	public void setPasswordLogin(String passwordLogin) {
		this.passwordLogin = passwordLogin;
	}

}

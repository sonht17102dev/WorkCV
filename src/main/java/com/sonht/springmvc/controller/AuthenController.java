package com.sonht.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sonht.springmvc.dto.UserDTO;
import com.sonht.springmvc.dto.UserLoginDTO;
import com.sonht.springmvc.entity.Role;
import com.sonht.springmvc.entity.User;
import com.sonht.springmvc.service.UserService;

@Controller
public class AuthenController {

	@Autowired
	private UserService authService;
	
	@ModelAttribute("userDTO")
    public UserDTO userDTO() {
        return new UserDTO();
    }

    @ModelAttribute("userLoginDTO")
    public UserLoginDTO userLoginDTO() {
        return new UserLoginDTO();
    }

    @GetMapping("/auth")
    public String showAuthPage(@RequestParam(name = "action", required = false, defaultValue = "login") String action, Model model) {
        // Các thuộc tính "userDTO" và "userLoginDTO" đã được cung cấp bởi @ModelAttribute ở trên.
    	if ("signup".equals(action)) {
            model.addAttribute("userDTO", new UserDTO());
        } else {
            model.addAttribute("userLoginDTO", new UserLoginDTO());
        }
        model.addAttribute("action", action);
        return "authenPage";
    }
	@PostMapping("/login")
	public String loginPost(@Valid @ModelAttribute("userLoginDTO") UserLoginDTO userLoginDTO, BindingResult result, Model model,
			HttpServletRequest request) {
		User user = authService.getUserByEmail(userLoginDTO.getEmailLogin());
		// nếu email không tồn tại
		if(user == null) {
			// trả về lỗi trên form và điều hướng về trang login
			result.rejectValue("emailLogin", "error.userLoginDTO", "Email không tồn tại trong hệ thống");
			model.addAttribute("msg_login_error", "error");
			request.setAttribute("action", "login");
			return "authenPage";
		}
		// nếu password không đúng 
		if (user != null && !userLoginDTO.getPasswordLogin().equals(user.getPassword())) {
			// trả về lỗi trên form và điều hướng về trang login
			result.rejectValue("passwordLogin", "error.userLoginDTO", "Password không đúng");
			model.addAttribute("msg_login_error", "error");
			request.setAttribute("action", "login");
			return "authenPage";
		}
		// nếu có lỗi nhập liệu
		if (result.hasErrors()) {
			// trả về lỗi trên form và điều hướng về trang login
			model.addAttribute("userLoginDTO", userLoginDTO);
			request.setAttribute("action", "login");
			model.addAttribute("msg_register_error", "error");
			return "authenPage";
		} 
		
		// Cài đặt phiên đăng nhập người dùng
		HttpSession session  = request.getSession();
		session.setAttribute("userLogin", user); // Đặt đối tượng vào session
//		session.setMaxInactiveInterval(15*60);  // phiên 15 phút
		return "redirect:/";
		
	}

	@PostMapping("/signup")
	public String registerPost(@Valid @ModelAttribute("userDTO") UserDTO userDTO, BindingResult result, Model model,
			HttpServletRequest request) {
		// Tuỳ chỉnh lỗi người dùng nhập lại mật khẩu không đúng
        if (!userDTO.isPasswordMatching()) {
            result.rejectValue("repassword", "error.userDTO", "Xác nhận mật khẩu không khớp");
            request.setAttribute("action", "signup");
            return "authenPage";
        }
		
        // Nếu có lỗi nhập liệu
		if (result.hasErrors()) {
			// thông báo lỗi và điều hướng về form signup
			model.addAttribute("userDTO", userDTO);
			model.addAttribute("msg_register_error", "error");
			request.setAttribute("action", "signup");
			return "authenPage";
		} 
		// Nếu có tồn tại usermail trong hệ thống 
		if(authService.getUserByEmail(userDTO.getEmailSignUp()) != null) {
			result.rejectValue("emailSignUp", "error.userDTO", "Vui lòng sử dụng tài khoản email khác, tài khoản đã tồn tại");
			request.setAttribute("action", "signup");
            return "authenPage";
		}
		// Khởi tạo đối tượng Role và User
		Role role = new Role(userDTO.getRoleName());
		User user = new User(userDTO.getEmailSignUp(), userDTO.getFullName(), userDTO.getPasswordSignup(), "active", role);
		
		// Lưu vào cơ sở dữ liệu
		authService.saveUser(user);
		model.addAttribute("msg_register_success", "success");
		
		// Điều hướng về trang login
		request.setAttribute("action", "login");
		return "authenPage";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		// Xoá đối tượng user trong session
		HttpSession session  = request.getSession();
		session.removeAttribute("userLogin"); 
		return "redirect:/";
	}
}

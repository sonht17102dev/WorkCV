package com.sonht.springmvc.dao;

import java.util.List;

import com.sonht.springmvc.entity.User;

public interface UserDAO {
	
	public List<User> getUsers();

	public void saveUser(User user);

	public User getUser(int id);

	public void deleteUser(int id);

	public User getUserByEmail(String email);

	public void updateImage(String photo, int id);

}

package cn.it.service;

import java.util.List;

import cn.it.model.User;

public interface UserService {
	public User findLogin(User u);

	public String addUser(User user);

	public String deleteUser(int userId);

	public String updateUser(User user);

	public User findUserById(int userId);

	public User findUserByAccount(String account);

	public List<User> findUserLikeName(String userName);

	public List<User> findAll();
}

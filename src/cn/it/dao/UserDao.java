package cn.it.dao;

import java.util.List;

import cn.it.model.User;

public interface UserDao {
	public int addUser(User user);

	public int deleteUser(int id);

	public int updateUser(User user);

	public User findUserById(int userId);

	public User findUserByAccount(String account);

	public List<User> findUserLikeName(String userName);

	public List<User> findAll();

	public User findByUserAccountAndPassword(User u);
}

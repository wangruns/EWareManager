package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.UserDao;
import cn.it.model.User;
import cn.it.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	public User findLogin(User u) {
		User user = userDao.findByUserAccountAndPassword(u);
		return user;
	}

	public String addUser(User user) {
		if (userDao.addUser(user) > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String deleteUser(int userId) {
		int i = -1;
		try {
			i = userDao.deleteUser(userId);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String updateUser(User user) {
		int i = -1;
		try {
			i = userDao.updateUser(user);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";
	}

	public User findUserById(int userId) {
		return userDao.findUserById(userId);
	}

	public User findUserByAccount(String account) {
		return userDao.findUserByAccount(account);
	}

	public List<User> findUserLikeName(String userName) {
		return userDao.findUserLikeName(userName);
	}

	public List<User> findAll() {
		return userDao.findAll();
	}

}

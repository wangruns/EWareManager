package cn.it.test;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.it.dao.UserDao;
import cn.it.model.User;
import cn.it.service.UserService;

public class TestDataSources {
	@Test
	public void Test1() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		DataSource dataSource = (DataSource) ac.getBean("dataSource");
		System.out.println(dataSource.toString());
	}

	@Test
	public void Test2() {
		//
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		System.out.println(ac.getBean("sqlSessionFactory"));

	}

	@Test
	public void Test3() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// 初始化容器
		UserDao userDao = (UserDao) ac.getBean("userDao");
		System.out.println(userDao.toString());
	}

	@Test
	public void Test4() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// 初始化容器
		UserDao userDao = (UserDao) ac.getBean("userDao");
		User u = new User();
		u.setUserAccount("t");
		u.setUserPassword("t");
		u.setUserName("t");
		u.setUserLevel(1);
		userDao.addUser(u);
		System.out.println("======Create ok=====");

	}

	@Test
	public void Test6() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// 初始化容器
		UserDao userDao = (UserDao) ac.getBean("userDao");
		List<User> res = userDao.findAll();
		for (User u : res)
			System.out.println(u.getUserAccount());
	}

	@Test
	public void Test7() {

	}

	@Test
	public void Test5() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// 初始化容器
		UserService userService = (UserService) ac.getBean("userService");
		User u = new User();
		u.setUserAccount("t");
		u.setUserPassword("t");
		u.setUserName("t");
		u.setUserLevel(1);
		User user = userService.findLogin(u);
		System.out.println(user.getUserId());
	}

}

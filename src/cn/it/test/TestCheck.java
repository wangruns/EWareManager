package cn.it.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.it.dao.ChecktbDao;
import cn.it.model.Checktb;

public class TestCheck {
	@Test
	public void Test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// 初始化容器
		ChecktbDao checktbDao = (ChecktbDao) ac.getBean("checktbDao");
		System.out.println(checktbDao.toString() + "checktbDao创建成功");

		Checktb check = new Checktb();
		check.setUserId(1);
		check.setShelfId(29);
		check.setProductId(5);
		check.setCheckNumber(56);
		checktbDao.addCheck(check);
		System.out.println("添加成功");

		checktbDao.deleteCheck(1);
		System.out.println("删除成功");

		List<Checktb> listCheck = checktbDao.findAll();
		for (Checktb c : listCheck) {
			System.out.println(c.getCheckDate());
		}
	}

}

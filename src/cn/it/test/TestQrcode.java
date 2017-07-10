package cn.it.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.it.dao.QrcodeDao;

public class TestQrcode {
	@Test
	public void Test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// ³õÊ¼»¯ÈÝÆ÷
		QrcodeDao qrcodeDao = (QrcodeDao) ac.getBean("qrcodeDao");
		System.out.println(qrcodeDao.toString() + "qrcodeDao");
	}

}

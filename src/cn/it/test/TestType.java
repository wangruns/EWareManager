package cn.it.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.it.dao.TypeDao;
import cn.it.model.Type;

public class TestType {
	@Test
	public void Test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// ³õÊ¼»¯ÈÝÆ÷
		TypeDao typeDao = (TypeDao) ac.getBean("typeDao");
		System.out.println(123);
		Type type4 = typeDao.findTypeBytypeId(18);
		System.out.println(895);
		type4.setFatherTypeId(1000);
		typeDao.updateType(type4);
		System.out.println("89");
	}

}

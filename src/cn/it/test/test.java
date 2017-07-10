package cn.it.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class test {
	@Test
	public void Test2(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("bean.xml");
		System.out.println(ac.getBean("sqlSessionFactory"));
		
	}


}

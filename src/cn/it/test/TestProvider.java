package cn.it.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.it.dao.ProviderDao;
import cn.it.model.Provider;

public class TestProvider {
	@Test
	public void Test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// 初始化容器
		ProviderDao providerDao = (ProviderDao) ac.getBean("providerDao");
		System.out.println(providerDao.toString() + "providerDao创建成功");

		Provider provider1 = new Provider();
		provider1.setProviderName("provider1");
		provider1.setProviderSex("Male");
		provider1.setProviderPhone("1");
		provider1.setProviderEmail("123@mail");
		provider1.setProviderAddress("重庆大学");

		Provider provider2 = new Provider();
		provider2.setProviderName("provider2");
		provider2.setProviderSex("Female");
		provider2.setProviderPhone("2");
		provider2.setProviderEmail("234@mail");
		provider2.setProviderAddress("重庆");

		providerDao.addProvider(provider1);
		providerDao.addProvider(provider2);
		System.out.println("添加成功");

		Provider provider3 = new Provider();
		provider3 = providerDao.findProviderByProviderId(5);
		provider3.setProviderPhone("456");
		provider3.setProviderSex("FMale and Male");
		providerDao.updateProvider(provider3);
		System.out.println("修改成功");

		List<Provider> listProvider = providerDao.findAll();
		for (Provider p : listProvider) {
			System.out.println(p.getProviderName());
		}

	}

}

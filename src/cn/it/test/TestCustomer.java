package cn.it.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.it.dao.CustomerDao;
import cn.it.model.Customer;

public class TestCustomer {
	@Test
	public void Test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// 初始化容器
		CustomerDao customerDao = (CustomerDao) ac.getBean("customerDao");
		System.out.println(customerDao.toString() + "customerDao创建成功");

		Customer customer1 = new Customer();
		customer1.setCustomerName("customer1");
		customer1.setCustomerSex("Male");
		customer1.setCustomerPhone("1");
		customer1.setCustomerEmail("123@mail");
		customer1.setCustomerAddress("重庆大学");

		Customer customer2 = new Customer();
		customer2.setCustomerName("customer2");
		customer2.setCustomerSex("FeMale");
		customer2.setCustomerPhone("2");
		customer2.setCustomerEmail("34@mail");
		customer2.setCustomerAddress("重庆");
		customerDao.addCustomer(customer1);
		customerDao.addCustomer(customer2);
		System.out.println("添加成功");

		Customer customer3 = new Customer();
		customer3 = customerDao.findCustomerByCustomerId(1);
		customer3.setCustomerPhone("456");
		customer3.setCustomerSex("FMale and Male");
		customerDao.updateCustomer(customer3);
		System.out.println("修改成功");

		List<Customer> listCustomer = customerDao.findAll();
		for (Customer c : listCustomer) {
			System.out.println(c.getCustomerName());
		}

	}

}

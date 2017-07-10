package cn.it.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.it.dao.ProductDao;
import cn.it.model.Product;

public class TestProduct {
	@Test
	public void Test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// 初始化容器
		ProductDao productDao = (ProductDao) ac.getBean("productDao");
		System.out.println(productDao.toString() + "productDao创建成功");

		/*Product product1 = new Product();
		product1.setProductName("product1");
		product1.setProductNumber(1);
		product1.setTypeId(1);
		product1.setBrandId(9);
		product1.setShelfId(29);
		product1.setProductAlertValue(6);

		Product product2 = new Product();
		product2.setProductName("product2");
		product2.setProductNumber(2);
		product2.setTypeId(1);
		product2.setBrandId(9);
		product2.setShelfId(29);
		product2.setProductAlertValue(7);
		productDao.addProduct(product1);
		productDao.addProduct(product2);
		System.out.println("添加成功");

		Product product3 = new Product();
		product3 = productDao.findProductByProductId(5);
		product3.setProductName("product3");
		productDao.updateProduct(product3);
		System.out.println("修改成功");

		productDao.deleteProduct(6);
		System.out.println("删除成功");

		List<Product> listProduct = productDao.findAll();
		for (Product p : listProduct) {
			System.out.println(p.getProductName());
		}*/
	}

}

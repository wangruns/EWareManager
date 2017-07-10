package cn.it.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.it.dao.BrandDao;
import cn.it.model.Brand;

public class TestBrand {

	@Test
	public void Test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// 初始化容器
		BrandDao brandDao = (BrandDao) ac.getBean("brandDao");
		System.out.println(brandDao.toString() + "brandDao创建成功");

		// brandDao.deleteBrand(11);

		/*
		 * Brand brand1=new Brand(); brand1.setBrandName("brand1"); Brand brand2=new
		 * Brand(); brand2.setBrandName("brand2"); brandDao.addBrand(brand1);
		 * brandDao.addBrand(brand2); System.out.println("添加Brand成功");
		 * 
		 * Brand brand3=brandDao.findBrandByBrandName("brand1");
		 * brand3.setBrandName("brand3"); System.out.println("修改成功");
		 * 
		 * brandDao.deleteBrand("brand2"); System.out.println("删除成功");
		 * 
		 * 
		 * List<Brand> listBrand=brandDao.findAll(); for(Brand s:listBrand) {
		 * System.out.println(s.getBrandName()); }
		 */
		

	}

}

package cn.it.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.it.dao.BrandDao;
import cn.it.model.Brand;

public class TestBrand {

	@Test
	public void Test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// ��ʼ������
		BrandDao brandDao = (BrandDao) ac.getBean("brandDao");
		System.out.println(brandDao.toString() + "brandDao�����ɹ�");

		// brandDao.deleteBrand(11);

		/*
		 * Brand brand1=new Brand(); brand1.setBrandName("brand1"); Brand brand2=new
		 * Brand(); brand2.setBrandName("brand2"); brandDao.addBrand(brand1);
		 * brandDao.addBrand(brand2); System.out.println("���Brand�ɹ�");
		 * 
		 * Brand brand3=brandDao.findBrandByBrandName("brand1");
		 * brand3.setBrandName("brand3"); System.out.println("�޸ĳɹ�");
		 * 
		 * brandDao.deleteBrand("brand2"); System.out.println("ɾ���ɹ�");
		 * 
		 * 
		 * List<Brand> listBrand=brandDao.findAll(); for(Brand s:listBrand) {
		 * System.out.println(s.getBrandName()); }
		 */
		

	}

}

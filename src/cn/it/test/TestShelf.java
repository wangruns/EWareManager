package cn.it.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.it.dao.ShelfDao;

public class TestShelf {
	@Test
	public void Test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// 初始化容器
		ShelfDao shelfDao = (ShelfDao) ac.getBean("shelfDao");
		System.out.println(shelfDao.toString() + "shelfDao创建成功");

		/*
		 * Shelf shelf3 = shelfDao.findShelfByShelfNumber(shelf1.getShelfNumber());
		 * shelf3.setShelfNumber("shelf3"); shelfDao.updateShelf(shelf3);
		 * System.out.println("修改成功");
		 * 
		 * shelfDao.deleteShelf("shelf3"); System.out.println("删除成功");
		 */

		/*
		 * List<Shelf> listShelf = shelfDao.findAll(); for (Shelf s : listShelf) {
		 * System.out.println(s.getShelfNumber()); } Shelf shelf3 = listShelf.get(0);
		 * shelf3.setShelfNumber("测试"); shelfDao.updateShelf(shelf3);
		 * 
		 * Shelf shelf1 = new Shelf(); shelf1.setShelfNumber("shelf7"); Shelf shelf2 =
		 * new Shelf(); shelf2.setShelfNumber("shelf8"); shelfDao.addShelf(shelf1);
		 * shelfDao.addShelf(shelf2); System.out.println("添加shelf成功");
		 * shelfDao.deleteShelf("测试");
		 */
		int i = -1;
		try {
			i = shelfDao.deleteShelf("SA100341");
		} catch (Exception e) {
			System.out.println(i);
		}

		// if(i);
		// System.err.println();
		System.out.println(i);

	}

}

package cn.it.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.it.dao.OuttbDao;
import cn.it.model.ActiveID;

public class TestOut {
	@Test
	public void Test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// 初始化容器
		OuttbDao outtbDao = (OuttbDao) ac.getBean("outtbDao");
		System.out.println(outtbDao.toString() + "outtbDao创建成功");
		/*
		 * Outtb out1 = new Outtb(); out1.setProductId(5); out1.setCustomerId(1);
		 * out1.setShelfId(29); out1.setOutNumber(56); outtbDao.addOut(out1);
		 * System.out.println("添加成功");
		 * 
		 * outtbDao.deleteOut(1); System.out.println("删除成功");
		 * 
		 * List<Outtb> listOuttb = outtbDao.findAll(); for (Outtb o : listOuttb) {
		 * System.out.println(o.getOutDate()); }
		 */
		/*
		 * String temp = "2018-05"; List<Outtb> tr = outtbDao.findOutByDate(temp); for
		 * (Outtb i : tr) { System.out.println(i.getOutNumber()); }
		 */
		String outDate = "2017-07";
		List<ActiveID> listd = outtbDao.getActiveIdAndIdCount(outDate);
		for (ActiveID i : listd) {
			System.out.println(i.getId());
		}
	}

}

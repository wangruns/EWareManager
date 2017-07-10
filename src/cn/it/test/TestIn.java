package cn.it.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.it.dao.IntbDao;
import cn.it.model.ActiveID;

public class TestIn {
	@Test
	public void Test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");// 初始化容器
		IntbDao intbDao = (IntbDao) ac.getBean("intbDao");
		System.out.println(intbDao.toString() + "intbDao创建成功");

		// Intb in1 = new Intb();
		// in1.setProductId(5);
		// in1.setProviderId(5);
		// in1.setShelfId(29);
		// in1.setInNumber(78);
		// intbDao.addIn(in1);
		// System.out.println("添加成功");
		//
		// intbDao.deleteIn(1);
		// System.out.println("删除成功");
		//
		// Intb in2 = new Intb();
		// in2 = intbDao.findInByInId(3);
		// in2.setInNumber(89898);
		// intbDao.updateIn(in2);
		// System.out.println("修改成功");
		//
		// List<Intb> listIntb = intbDao.findAll();
		// for (Intb i : listIntb) {
		// System.out.println(i.getInDate());
		// }

		/*
		 * String str0 = "2017-07"; List<Map<Integer, Integer>> tr =
		 * intbDao.findInByDate(str0); for (Map<Integer, Integer> k : tr) { Set<Integer>
		 * td = k.keySet(); for (Integer i : td) { System.out.println(tr.get(i));
		 * 
		 * }
		 * 
		 * }
		 */
		String inDate = "2017-07";
		List<ActiveID> listd = intbDao.getActiveIdAndIdCount(inDate);
		for (ActiveID i : listd) {
			System.out.println(i.getId());
		}

	}

}

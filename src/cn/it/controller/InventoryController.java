package cn.it.controller;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.CheckShowAll;
import cn.it.model.Checktb;
import cn.it.model.Product;
import cn.it.model.Shelf;
import cn.it.model.User;
import cn.it.service.ChecktbService;
import cn.it.service.ProductService;
import cn.it.service.ShelfService;
import cn.it.service.UserService;

@Controller
public class InventoryController {
	@Autowired
	private ProductService productService;

	@Autowired
	private ShelfService shelfService;

	@Autowired
	private UserService userService;

	@Autowired
	private ChecktbService checktbService;

	/*
	 * ģ��ҳ��
	 */

	// �̵�ҳ��
	@RequestMapping(value = "Checktb.do")
	public ModelAndView Checktb() {
		ModelAndView modelAndView = new ModelAndView();

		// shelfId
		List<Shelf> listShelf = shelfService.findAll();
		modelAndView.addObject("resshelfIdQuery", listShelf);
		// userId
		List<User> listUser = userService.findAll();
		modelAndView.addObject("resQueryUserLikeName", listUser);

		// productId
		List<Product> listProduct = productService.findAll();
		modelAndView.addObject("resproductIdQuery", listProduct);
		modelAndView.setViewName("checktb");
		return modelAndView;
	}

	// ��汨��ҳ��
	@RequestMapping(value = "Inventoryalarm.do")
	public ModelAndView Inventoryalarm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("inventoryAlarm");
		return modelAndView;
	}

	/*
	 * ���ҳ��
	 */
	// ����̵����ҳ��
	@RequestMapping(value = "checktbAddPage.do")
	public ModelAndView checktbAddPage() {
		ModelAndView modelAndView = new ModelAndView();

		// shelfId
		List<Shelf> listShelf = shelfService.findAll();
		modelAndView.addObject("resshelfIdQuery", listShelf);
		// userId
		List<User> listUser = userService.findAll();
		modelAndView.addObject("resQueryUserLikeName", listUser);

		// productId
		List<Product> listProduct = productService.findAll();
		modelAndView.addObject("resproductIdQuery", listProduct);
		modelAndView.setViewName("checktb");
		return modelAndView;
	}

	/*
	 * ��汨��ģ��
	 */
	// ��汨��
	@RequestMapping(value = "Inventory_alarm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Inventory_alarm(Product product) {
		// ����ͨ�����ֽ�����������ȡ����
		
		System.out.println(product.getProductId());
		String productName = product.getProductName();
		int productAlertValue = product.getProductAlertValue();
		Product product1 = productService.findProductbyName(productName);
		// ���������ʾ��ȡ����Ʒ������
		
		System.out.println(product1==null);
		int Number = product1.getProductNumber();
		String result = productService.updateAlarmValue(product);
		if (productAlertValue > Number) {
			// �����ʾ��治������ʼ��ķ���
			try {
				sendemail(productName + "����֪ͨ", "��Ʒ�ĳ��ⲻ�㣬�뾡�������µĿ�档");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		ModelAndView modelAndView = new ModelAndView();
		List<Product> listProduct = productService.findAll();
		modelAndView.addObject("resFindAllProductName", listProduct);
		modelAndView.setViewName("inventoryAlarm");
		return modelAndView;
	}

	// �����ʼ��ķ���
	public void sendemail(String theme, String messages) throws Exception {
		Properties prop = new Properties();
		prop.put("mail.transport.protocol", "smtp");
		prop.put("mail.host", "smtp.163.com");
		prop.put("mail.smtp.auth", "true");
		Session session = Session.getInstance(prop);
		session.setDebug(true);
		Message message = createSimpleMail(session, theme, messages);
		Transport ts = session.getTransport();
		ts.connect("15178945588@163.com", "abc123456");
		ts.sendMessage(message, message.getAllRecipients());
		ts.close();
	}

	// ��̬����Ϣ
	public static MimeMessage createSimpleMail(Session session, String theme, String messages) throws Exception {
		// �����ʼ�����
		MimeMessage message = new MimeMessage(session);
		// ָ���ʼ��ķ�����
		message.setFrom(new InternetAddress("15178945588@163.com"));
		// ָ���ʼ����ռ���
		message.addRecipients(Message.RecipientType.TO, "1004519755@qq.com");
		// �ʼ��ı���
		message.setSubject(theme);
		// �ʼ����ı�����
		message.setText(messages);
		message.saveChanges();
		// ���ش����õ��ʼ�����
		return message;
	}

	// ������Ʒ���Ʋ�ѯ��Ʒ
	@RequestMapping(value = "findProductByProductName.do")
	public ModelAndView findProductByProductName() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("inventoryAlarm");
		return modelAndView;
	}

	// ��ȡ���е�productName
	@RequestMapping(value = "findAllProductName.do")
	public ModelAndView findAllProductName() {
		ModelAndView modelAndView = new ModelAndView();
		List<Product> listProduct = productService.findAll();
		modelAndView.addObject("resFindAllProductName", listProduct);
		modelAndView.setViewName("inventoryAlarm");
		return modelAndView;
	}

	/*
	 * ��Ʒ�̵�ģ��
	 */
	// ��ѯ�����̵��
	@RequestMapping(value = "checktbQuery.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView checktbQuery() {
		ModelAndView modelAndView = new ModelAndView();
		// ��ȡǰ̨��Ҫչʾ�ĵ�����
		List<CheckShowAll> checkShowAllList = checktbService.getCheckShow();
		modelAndView.addObject("resQuerychecktb", checkShowAllList);

		// shelfId
		List<Shelf> listShelf = shelfService.findAll();
		modelAndView.addObject("resshelfIdQuery", listShelf);
		// userId
		List<User> listUser = userService.findAll();
		modelAndView.addObject("resQueryUserLikeName", listUser);

		// productId
		List<Product> listProduct = productService.findAll();
		modelAndView.addObject("resproductIdQuery", listProduct);
		modelAndView.setViewName("checktb");
		return modelAndView;
	}

	// ����̵��
	@RequestMapping(value = "addChecktb.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addChecktb(Checktb checktb) {
		ModelAndView modelAndView = new ModelAndView();
		String result = checktbService.addCheck(checktb);

		// ��ȡǰ̨��Ҫչʾ�ĵ�����
		List<CheckShowAll> checkShowAllList = checktbService.getCheckShow();
		modelAndView.addObject("resQuerychecktb", checkShowAllList);

		modelAndView.addObject("resAddChecktb", result);
		// shelfId
		List<Shelf> listShelf = shelfService.findAll();
		modelAndView.addObject("resshelfIdQuery", listShelf);
		// userId
		List<User> listUser = userService.findAll();
		modelAndView.addObject("resQueryUserLikeName", listUser);
		// productId
		List<Product> listProduct = productService.findAll();
		modelAndView.addObject("resproductIdQuery", listProduct);
		modelAndView.setViewName("checktb");
		return modelAndView;
	}

	// �޸��̵��
	@RequestMapping(value = "updateChecktb.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateChecktb(Checktb checktb) {
		ModelAndView modelAndView = new ModelAndView();
		String result = checktbService.updateCheck(checktb);
		modelAndView.addObject("resUpdateChecktb", result);
		List<Checktb> listChecktb = checktbService.findAll();
		modelAndView.addObject("resQuerychecktb", listChecktb);
		modelAndView.setViewName("checktb");
		return modelAndView;
	}

	// ����Id����checktb
	@RequestMapping(value = "findChecktbById.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findChecktbById(int checkId) {
		System.out.println(34);
		System.out.println(checkId);
		ModelAndView modelAndView = new ModelAndView();
		Checktb checktb = checktbService.findCheckBycheckId(checkId);
		modelAndView.addObject("resFindChecktbById", checktb);
		modelAndView.setViewName("checktb");
		return modelAndView;
	}

}

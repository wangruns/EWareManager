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
	 * 模块页面
	 */

	// 盘点页面
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

	// 库存报警页面
	@RequestMapping(value = "Inventoryalarm.do")
	public ModelAndView Inventoryalarm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("inventoryAlarm");
		return modelAndView;
	}

	/*
	 * 添加页面
	 */
	// 库存盘点添加页面
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
	 * 库存报警模块
	 */
	// 库存报警
	@RequestMapping(value = "Inventory_alarm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Inventory_alarm(Product product) {
		// 这里通过名字将两个变量提取出来
		
		System.out.println(product.getProductId());
		String productName = product.getProductName();
		int productAlertValue = product.getProductAlertValue();
		Product product1 = productService.findProductbyName(productName);
		// 这个变量表示提取的商品的数量
		
		System.out.println(product1==null);
		int Number = product1.getProductNumber();
		String result = productService.updateAlarmValue(product);
		if (productAlertValue > Number) {
			// 这里表示库存不足进行邮件的发送
			try {
				sendemail(productName + "紧急通知", "产品的出库不足，请尽快增加新的库存。");
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

	// 发送邮件的方法
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

	// 静态的消息
	public static MimeMessage createSimpleMail(Session session, String theme, String messages) throws Exception {
		// 创建邮件对象
		MimeMessage message = new MimeMessage(session);
		// 指明邮件的发件人
		message.setFrom(new InternetAddress("15178945588@163.com"));
		// 指明邮件的收件人
		message.addRecipients(Message.RecipientType.TO, "1004519755@qq.com");
		// 邮件的标题
		message.setSubject(theme);
		// 邮件的文本内容
		message.setText(messages);
		message.saveChanges();
		// 返回创建好的邮件对象
		return message;
	}

	// 根据商品名称查询商品
	@RequestMapping(value = "findProductByProductName.do")
	public ModelAndView findProductByProductName() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("inventoryAlarm");
		return modelAndView;
	}

	// 获取所有的productName
	@RequestMapping(value = "findAllProductName.do")
	public ModelAndView findAllProductName() {
		ModelAndView modelAndView = new ModelAndView();
		List<Product> listProduct = productService.findAll();
		modelAndView.addObject("resFindAllProductName", listProduct);
		modelAndView.setViewName("inventoryAlarm");
		return modelAndView;
	}

	/*
	 * 商品盘点模块
	 */
	// 查询所有盘点表
	@RequestMapping(value = "checktbQuery.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView checktbQuery() {
		ModelAndView modelAndView = new ModelAndView();
		// 获取前台需要展示的的数据
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

	// 添加盘点表
	@RequestMapping(value = "addChecktb.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addChecktb(Checktb checktb) {
		ModelAndView modelAndView = new ModelAndView();
		String result = checktbService.addCheck(checktb);

		// 获取前台需要展示的的数据
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

	// 修改盘点表
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

	// 根据Id查找checktb
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

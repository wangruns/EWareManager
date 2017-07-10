package cn.it.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.Customer;
import cn.it.model.Provider;
import cn.it.model.User;
import cn.it.service.CustomerService;
import cn.it.service.ProviderService;
import cn.it.service.UserService;

@Controller
public class UserManageController {

	@Autowired
	private ProviderService providerService;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private UserService userService;

	/*
	 * ģ��ҳ��
	 */
	// ��Ӧ�̹���ҳ��
	@RequestMapping(value = "provider.do")
	public ModelAndView provider() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("productprovider");
		return modelAndView;
	}

	// �ͻ�����ҳ��
	@RequestMapping(value = "customer.do")
	public ModelAndView customer() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("customer");
		return modelAndView;
	}

	// �û�����ҳ��
	@RequestMapping(value = "user.do")
	public ModelAndView user() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("user");
		return modelAndView;
	}

	/*
	 * ���ҳ��
	 */
	// ��Ӧ�����ҳ��
	@RequestMapping(value = "providerAddPage.do")
	public ModelAndView providerAddPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("productproviderAdd");
		return modelAndView;
	}

	// �ͻ����ҳ��
	@RequestMapping(value = "customerAddPage.do")
	public ModelAndView customerAddPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("customerAdd");
		return modelAndView;
	}

	// �û����ҳ��
	@RequestMapping(value = "userAddPage.do")
	public ModelAndView userAddPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("userAdd");
		return modelAndView;
	}

	/*
	 * ��Ӧ�̹���
	 */

	// ��ѯ���й�Ӧ��
	@RequestMapping(value = "providerQuery.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView providerQuery() {
		ModelAndView modelAndView = new ModelAndView();
		List<Provider> listProvider = providerService.findAllProvider();
		modelAndView.addObject("resQueryLikeName", listProvider);
		modelAndView.setViewName("productprovider");
		return modelAndView;
	}

	// ���ݹ�Ӧ������ģ�����ҹ�Ӧ��
	@RequestMapping(value = "queryProviderLikeName.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView queryProviderLikeName(String providerName) {
		ModelAndView modelAndView = new ModelAndView();
		List<Provider> listProvider = providerService.fidnProviderLikeName(providerName);
		modelAndView.addObject("resQueryLikeName", listProvider);
		modelAndView.setViewName("productprovider");
		return modelAndView;
	}

	// ����Id���ҹ�Ӧ��
	@RequestMapping(value = "findProviderById", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findProviderById(int providerId) {
		ModelAndView modelAndView = new ModelAndView();
		Provider provider = providerService.findProviderByProviderId(providerId);
		modelAndView.addObject("resFindProviderById", provider);
		modelAndView.setViewName("productprovider");
		return modelAndView;
	}

	// ��ӹ�Ӧ��
	@RequestMapping(value = "addProvider.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addProvider(Provider provider) {
		ModelAndView modelAndView = new ModelAndView();
		String result = providerService.addProvider(provider);
		modelAndView.addObject("resAddProvider", result);
		List<Provider> listProvider = providerService.findAllProvider();
		modelAndView.addObject("resQueryLikeName", listProvider);
		modelAndView.setViewName("productprovider");
		return modelAndView;
	}

	// ɾ����Ӧ��
	@RequestMapping(value = "deleteProvider.do")
	public @ResponseBody String deleteProvider(int providerId) {
		String result = providerService.deleteProvider(providerId);
		return result;
	}

	// ���Ĺ�Ӧ��
	@RequestMapping(value = "updateProvider.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateProvider(Provider provider) {
		ModelAndView modelAndView = new ModelAndView();
		String result = providerService.updateProvider(provider);
		modelAndView.addObject("resUpdateProvider", result);
		List<Provider> listProvider = providerService.findAllProvider();
		modelAndView.addObject("resQueryLikeName", listProvider);
		modelAndView.setViewName("productprovider");
		return modelAndView;
	}

	/*
	 * �ͻ�����
	 */
	// ��ѯ���пͻ�
	@RequestMapping(value = "customerQuery.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView customerQuery() {
		ModelAndView modelAndView = new ModelAndView();
		List<Customer> listCustomer = customerService.findAll();
		modelAndView.addObject("resQueryLikeName", listCustomer);
		modelAndView.setViewName("customer");
		return modelAndView;
	}

	// ���ݿͻ���ģ�����ҿͻ�
	@RequestMapping(value = "queryCustomerLikeName.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView queryCustomerLikeName(String customerName) {
		ModelAndView modelAndView = new ModelAndView();
		List<Customer> listCustomer = customerService.findCustomerLikeName(customerName);
		modelAndView.addObject("resQueryLikeName", listCustomer);
		modelAndView.setViewName("customer");
		return modelAndView;
	}

	// ����Id���ҿͻ�
	@RequestMapping(value = "findCustomerById.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findCustomerById(int customerId) {
		ModelAndView modelAndView = new ModelAndView();
		Customer customer = customerService.findCustomerByCustomerId(customerId);
		modelAndView.addObject("resFindProviderById", customer);
		modelAndView.setViewName("customer");
		return modelAndView;
	}

	// ��ӿͻ�
	@RequestMapping(value = "addCustomer.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addCustomer(Customer customer) {
		ModelAndView modelAndView = new ModelAndView();
		String result = customerService.addCustomer(customer);
		modelAndView.addObject("resAddProvider", result);
		List<Customer> listCustomer = customerService.findAll();
		modelAndView.addObject("resQueryLikeName", listCustomer);
		modelAndView.setViewName("customer");
		return modelAndView;
	}

	// ɾ���ͻ�
	@RequestMapping(value = "deleteCustomer.do")
	public @ResponseBody String deleteCustomer(int customerId) {
		String result = customerService.deleteCustomer(customerId);
		return result;
	}

	// ���Ŀͻ�
	@RequestMapping(value = "updateCustomer.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateCustomer(Customer customer) {
		ModelAndView modelAndView = new ModelAndView();
		String result = customerService.updateCustomer(customer);
		modelAndView.addObject("resUpdateCustomer", result);
		List<Customer> listCustomer = customerService.findAll();
		modelAndView.addObject("resQueryLikeName", listCustomer);
		modelAndView.setViewName("customer");
		return modelAndView;
	}

	/*
	 * �û�����
	 */
	// ��ѯ�����û�
	@RequestMapping(value = "userQuery.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView userQuery() {
		ModelAndView modelAndView = new ModelAndView();
		List<User> listUser = userService.findAll();
		modelAndView.addObject("resQueryLikeName", listUser);
		modelAndView.setViewName("user");
		return modelAndView;
	}

	// �����û���ģ�������û�
	@RequestMapping(value = "queryUserLikeName.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView queryUserLikeName(String userName) {
		ModelAndView modelAndView = new ModelAndView();
		List<User> listUser = userService.findUserLikeName(userName);
		modelAndView.addObject("resQueryLikeName", listUser);
		modelAndView.setViewName("user");
		return modelAndView;
	}

	// ����Id�����û�
	@RequestMapping(value = "findUserById.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findUserById(int userId) {
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.findUserById(userId);
		modelAndView.addObject("resFindUserById", user);
		modelAndView.setViewName("userEdit");
		return modelAndView;
	}

	// ����account�����û�
	@RequestMapping(value = "findUserrByAccount.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findUserrByAccount(String account) {
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.findUserByAccount(account);
		modelAndView.addObject("resFindUserByAccount", user);
		modelAndView.setViewName("user");
		return modelAndView;
	}

	// ����û�
	@RequestMapping(value = "addUser.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addUser(User user) {
		ModelAndView modelAndView = new ModelAndView();
		String result = userService.addUser(user);
		modelAndView.addObject("resAddUser", result);
		List<User> listUser = userService.findAll();
		modelAndView.addObject("resQueryLikeName", listUser);
		modelAndView.setViewName("user");
		return modelAndView;
	}

	// ɾ���ͻ�
	@RequestMapping(value = "deleteUser.do")
	public @ResponseBody String deleteUser(int userId) {
		String result = userService.deleteUser(userId);
		return result;
	}

	// ���Ŀͻ�
	@RequestMapping(value = "updateUser.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateUser(User user) {
		ModelAndView modelAndView = new ModelAndView();
		String result = userService.updateUser(user);
		modelAndView.addObject("resUpdateCustomer", result);
		List<User> listUser = userService.findAll();
		modelAndView.addObject("resQueryLikeName", listUser);
		modelAndView.setViewName("user");
		return modelAndView;
	}

	// Ȩ�޹���
	@RequestMapping(value = "permission.do")
	public ModelAndView permission() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("permission");
		return modelAndView;
	}

}

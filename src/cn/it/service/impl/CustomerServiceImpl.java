package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.CustomerDao;
import cn.it.model.Customer;
import cn.it.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDao customerDao;

	public String addCustomer(Customer customer) {
		if (customerDao.addCustomer(customer) > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String deleteCustomer(int customerId) {
		int i = -1;
		try {
			i = customerDao.deleteCustomer(customerId);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String updateCustomer(Customer customer) {
		int i = -1;
		try {
			i = customerDao.updateCustomer(customer);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";
	}

	public List<Customer> findAll() {
		return customerDao.findAll();
	}

	public List<Customer> findCustomerLikeName(String customerName) {
		return customerDao.findCustomerLikeName(customerName);
	}

	public Customer findCustomerByCustomerId(int customerId) {
		return customerDao.findCustomerByCustomerId(customerId);
	}

}

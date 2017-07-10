package cn.it.service;

import java.util.List;

import cn.it.model.Customer;

public interface CustomerService {
	public String addCustomer(Customer customer);

	public String deleteCustomer(int customerId);

	public String updateCustomer(Customer customer);

	public List<Customer> findAll();

	public List<Customer> findCustomerLikeName(String customerName);

	public Customer findCustomerByCustomerId(int customerId);

}

package cn.it.dao;

import java.util.List;

import cn.it.model.Customer;

public interface CustomerDao {
	public int addCustomer(Customer customer);

	public int deleteCustomer(int customerId);

	public int updateCustomer(Customer customer);

	public List<Customer> findAll();

	public List<Customer> findCustomerLikeName(String customerName);

	public Customer findCustomerByCustomerId(int customerId);

}

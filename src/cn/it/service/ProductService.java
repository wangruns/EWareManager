package cn.it.service;

import java.util.List;

import cn.it.model.Product;

public interface ProductService {

	public Product findProductbyName(String productName);
	
	public String updateAlarmValue(Product product);
	
	public List<Product> findAll();
	
	public Product findProductById(int productId);
	
	public int addProduct(Product product);
	
	public int lastInsertId();
	
	public void updateProduct(Product product);
}

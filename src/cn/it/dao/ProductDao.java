package cn.it.dao;

import java.util.List;

import cn.it.model.Product;

public interface ProductDao {

	public int addProduct(Product product);

	public void deleteProduct(int productId);

	public void updateProduct(Product product);

	public int updateAlarmValue(Product product);

	public List<Product> findAll();

	public Product findProductByProductId(int productId);

	public Product findProductByProductName(String productName);
	
	public int lastInsertId();

}

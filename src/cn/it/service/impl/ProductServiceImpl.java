package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.ProductDao;
import cn.it.model.Product;
import cn.it.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;

	public Product findProductbyName(String productName) {
		return productDao.findProductByProductName(productName);
	}

	public String updateAlarmValue(Product product) {
		if(productDao.updateAlarmValue(product)>0){
			return "Success";
		}
		return "Failure";
	}

	public List<Product> findAll() {
		return productDao.findAll();
	}

	public Product findProductById(int productId) {
		return productDao.findProductByProductId(productId);
	}

	public int addProduct(Product product) {
		return productDao.addProduct(product);
	}

	public int lastInsertId() {
		return productDao.lastInsertId();
	}

	public void updateProduct(Product product) {
		productDao.updateProduct(product);
	}

	

}

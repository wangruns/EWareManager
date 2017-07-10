package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.IntbDao;
import cn.it.model.Intb;
import cn.it.service.ProductInService;

@Service("productInService")
public class ProductInServiceImpl implements ProductInService{
	@Autowired
	private IntbDao intbDao;

	public void addProductIn(Intb productIn) {
		intbDao.addIn(productIn);
	}

	public Intb findProductInById(int intbId) {
		return intbDao.findInByInId(intbId);
	}

	public void updateProductIn(Intb intb) {
		intbDao.updateIn(intb);
	}

	public Intb findProductByProductId(int productId) {
		return intbDao.findInByProductId(productId);
	}

	public List<Intb> getAll() {
		return intbDao.findAll();
	}

}

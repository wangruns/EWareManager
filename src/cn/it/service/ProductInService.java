package cn.it.service;

import java.util.List;

import cn.it.model.Intb;

public interface ProductInService {
	public void addProductIn(Intb productIn);
	public Intb findProductInById(int intbId);
	public void updateProductIn(Intb intb);
	public Intb findProductByProductId(int productId);
	public List<Intb> getAll();
}

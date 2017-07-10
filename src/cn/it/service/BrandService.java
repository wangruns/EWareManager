package cn.it.service;

import java.util.List;

import cn.it.model.Brand;

public interface BrandService {
	public List<Brand> queryLikeBrandName(String brandName);

	public String addBrand(Brand brand);

	public String deleteBrand(int brandId);

	public Brand findBrandBybrandName(String brandName);

	public String updateBrand(Brand brand);

	public List<Brand> findAll();

}

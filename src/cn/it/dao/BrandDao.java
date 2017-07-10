package cn.it.dao;

import java.util.List;

import cn.it.model.Brand;

public interface BrandDao {
	public int addBrand(Brand brand);

	public int deleteBrand(int brandId);

	public int updateBrand(Brand brand);

	public Brand findBrandBybrandName(String brandName);

	public List<Brand> findAll();

	public List<Brand> findBrandLikeBrandName(String brandName);

}

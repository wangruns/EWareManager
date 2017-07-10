package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.BrandDao;
import cn.it.model.Brand;
import cn.it.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService {

	@Autowired
	private BrandDao brandDao;

	public List<Brand> queryLikeBrandName(String brandName) {
		return brandDao.findBrandLikeBrandName(brandName);
	}

	public String addBrand(Brand brand) {
		if (brandDao.addBrand(brand) > 0) {
			return "Success";
		}
		return "Failure";
	}

	public List<Brand> findAll() {
		List<Brand> ls = brandDao.findAll();
		return ls;
	}

	public String deleteBrand(int brandId) {
		int i = -1;
		try {
			i = brandDao.deleteBrand(brandId);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String updateBrand(Brand brand) {
		int i = -1;
		try {
			i = brandDao.updateBrand(brand);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";

	}

	public Brand findBrandBybrandName(String brandName) {
		return brandDao.findBrandBybrandName(brandName);
	}

}

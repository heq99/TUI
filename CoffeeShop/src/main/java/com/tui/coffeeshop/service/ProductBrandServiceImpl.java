package com.tui.coffeeshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tui.coffeeshop.dao.ProductBrandDao;
import com.tui.coffeeshop.model.ProductBrand;

@Service("productBrandService")
public class ProductBrandServiceImpl implements ProductBrandService {
	
	@Autowired
	private ProductBrandDao productBrandDao;

	@Override
	public ProductBrand getProductBrandById(Integer brandId) {
		return productBrandDao.get(brandId);
	}
	
	@Override
	public List<ProductBrand> getAllProductBrands() {
		return productBrandDao.getAll();
	}

}

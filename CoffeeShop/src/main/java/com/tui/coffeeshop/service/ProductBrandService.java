package com.tui.coffeeshop.service;

import java.util.List;

import com.tui.coffeeshop.model.ProductBrand;

public interface ProductBrandService {
	
	ProductBrand getProductBrandById(Integer brandId);

	List<ProductBrand> getAllProductBrands();
	
}

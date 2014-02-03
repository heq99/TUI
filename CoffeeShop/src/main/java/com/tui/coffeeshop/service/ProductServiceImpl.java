package com.tui.coffeeshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tui.coffeeshop.dao.ProductDao;
import com.tui.coffeeshop.model.Product;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;

	@Override
	public List<Product> getAllProductByBrand(Integer brandId) {
		return productDao.getAllProductByBrand(brandId);
	}
	
	@Override
	public Product getProductById(Integer productId) {
		return productDao.get(productId);
	}

}

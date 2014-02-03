package com.tui.coffeeshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tui.coffeeshop.dao.ProductAttributeValueDao;
import com.tui.coffeeshop.model.ProductAttributeValue;

@Service("productAttributeValueService")
public class ProductAttributeValueServiceImpl implements
		ProductAttributeValueService {

	@Autowired
	private ProductAttributeValueDao prodAttrValueDao;
	
	@Override
	public ProductAttributeValue getProductAttributeValueById(Integer id) {
		return prodAttrValueDao.get(id);
	}

	
}

package com.tui.coffeeshop.dao;

import org.springframework.stereotype.Repository;

import com.tui.coffeeshop.model.ProductAttributeValue;

@Repository("productAttributeValueDao")
public class ProductAttributeValueDaoJpa extends GenericDaoJpa<ProductAttributeValue> implements
		ProductAttributeValueDao {
	
	public ProductAttributeValueDaoJpa() {
		super(ProductAttributeValue.class);
	}

}

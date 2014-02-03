package com.tui.coffeeshop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tui.coffeeshop.model.Product;

@Repository("productDao")
public class ProductDaoJpa extends GenericDaoJpa<Product> implements ProductDao {
	
	public ProductDaoJpa() {
		super(Product.class);
	}

	@Override
	public List<Product> getAllProductByBrand(Integer brandId) {
		
		return entityManager.createQuery(
				"select p from " + Product.class.getName() + " p where p.productBrand.id=:brandId", Product.class)
				.setParameter("brandId", brandId)
				.getResultList();
	}

}

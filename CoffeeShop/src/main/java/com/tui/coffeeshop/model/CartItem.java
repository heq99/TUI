package com.tui.coffeeshop.model;

import java.util.List;

public class CartItem implements ModelObject {
	
	private Integer id;
	
	private Cart cart;
	
	private Product product;
	
	private List<ProductAttributeValue> attributes;
	
	private Integer quantity;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<ProductAttributeValue> getAttributes() {
		return attributes;
	}

	public void setAttributes(List<ProductAttributeValue> attributes) {
		this.attributes = attributes;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
}

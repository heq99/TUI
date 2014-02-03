package com.tui.coffeeshop.model;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the PRODUCT_BRAND database table.
 * 
 */
@Entity
@Table(name="PRODUCT_BRAND")
@NamedQuery(name="ProductBrand.findAll", query="SELECT p FROM ProductBrand p")
public class ProductBrand implements Serializable, ModelObject {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Integer id;

	@Column(name="LOCATION")
	private String location;

	@Column(name="NAME")
	private String name;

	//bi-directional many-to-one association to Product
	@OneToMany(mappedBy="productBrand", fetch=FetchType.EAGER)
	private List<Product> products;

	public ProductBrand() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Product> getProducts() {
		return this.products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Product addProduct(Product product) {
		getProducts().add(product);
		product.setProductBrand(this);

		return product;
	}

	public Product removeProduct(Product product) {
		getProducts().remove(product);
		product.setProductBrand(null);

		return product;
	}

}
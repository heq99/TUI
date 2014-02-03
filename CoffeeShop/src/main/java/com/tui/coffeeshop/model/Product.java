package com.tui.coffeeshop.model;


import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.List;


/**
 * The persistent class for the PRODUCT database table.
 * 
 */
@Entity
@Table(name="PRODUCT")
@NamedQuery(name="Product.findAll", query="SELECT p FROM Product p")
public class Product implements Serializable, ModelObject {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Integer id;

	@Column(name="DEFAULT_PRICE")
	private Integer defaultPrice;

	@Column(name="DESCRIPTION")
	private String description;

	@Column(name="NAME")
	private String name;

	//bi-directional many-to-one association to ProductBrand
	@ManyToOne
	@JoinColumn(name="PRODUCT_BRAND_ID")
	private ProductBrand productBrand;

	//bi-directional many-to-one association to ProductType
	@ManyToOne
	@JoinColumn(name="PRODUCT_TYPE_ID")
	private ProductType productType;

	//bi-directional many-to-one association to ProductAttribute
	@OneToMany(mappedBy="product", fetch=FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private List<ProductAttribute> productAttributes;

	public Product() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDefaultPrice() {
		return this.defaultPrice;
	}

	public void setDefaultPrice(Integer defaultPrice) {
		this.defaultPrice = defaultPrice;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ProductBrand getProductBrand() {
		return this.productBrand;
	}

	public void setProductBrand(ProductBrand productBrand) {
		this.productBrand = productBrand;
	}

	public ProductType getProductType() {
		return this.productType;
	}

	public void setProductType(ProductType productType) {
		this.productType = productType;
	}

	public List<ProductAttribute> getProductAttributes() {
		return this.productAttributes;
	}

	public void setProductAttributes(List<ProductAttribute> productAttributes) {
		this.productAttributes = productAttributes;
	}

	public ProductAttribute addProductAttribute(ProductAttribute productAttribute) {
		getProductAttributes().add(productAttribute);
		productAttribute.setProduct(this);

		return productAttribute;
	}

	public ProductAttribute removeProductAttribute(ProductAttribute productAttribute) {
		getProductAttributes().remove(productAttribute);
		productAttribute.setProduct(null);

		return productAttribute;
	}

}
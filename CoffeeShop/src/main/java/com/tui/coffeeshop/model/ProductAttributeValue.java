package com.tui.coffeeshop.model;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the PRODUCT_ATTRIBUTE_VALUE database table.
 * 
 */
@Entity
@Table(name="PRODUCT_ATTRIBUTE_VALUE")
@NamedQuery(name="ProductAttributeValue.findAll", query="SELECT p FROM ProductAttributeValue p")
public class ProductAttributeValue implements Serializable, ModelObject {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Integer id;

	@Column(name="DESCRIPTION")
	private String description;

	@Column(name="PRICE")
	private Integer price;

	@Column(name="VALUE")
	private String value;

	//bi-directional many-to-one association to ProductAttribute
	@ManyToOne
	@JoinColumn(name="PRODUCT_ATTRIBUTE_ID")
	private ProductAttribute productAttribute;

	public ProductAttributeValue() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getPrice() {
		return this.price;
	}
	
	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public ProductAttribute getProductAttribute() {
		return this.productAttribute;
	}

	public void setProductAttribute(ProductAttribute productAttribute) {
		this.productAttribute = productAttribute;
	}

}
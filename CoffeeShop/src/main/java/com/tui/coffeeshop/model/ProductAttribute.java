package com.tui.coffeeshop.model;

import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.List;


/**
 * The persistent class for the PRODUCT_ATTRIBUTE database table.
 * 
 */
@Entity
@Table(name="PRODUCT_ATTRIBUTE")
@NamedQuery(name="ProductAttribute.findAll", query="SELECT p FROM ProductAttribute p")
public class ProductAttribute implements Serializable, ModelObject {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Integer id;

	@Column(name="DESCRIPTION")
	private String description;

	@Column(name="MANDATORY")
	private byte mandatory;

	@Column(name="NAME")
	private String name;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="PRODUCT_ID")
	private Product product;

	//bi-directional many-to-one association to ProductAttributeValue
	@OneToMany(mappedBy="productAttribute", fetch=FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private List<ProductAttributeValue> productAttributeValues;

	public ProductAttribute() {
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

	public byte getMandatory() {
		return this.mandatory;
	}

	public void setMandatory(byte mandatory) {
		this.mandatory = mandatory;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<ProductAttributeValue> getProductAttributeValues() {
		return this.productAttributeValues;
	}

	public void setProductAttributeValues(List<ProductAttributeValue> productAttributeValues) {
		this.productAttributeValues = productAttributeValues;
	}

	public ProductAttributeValue addProductAttributeValue(ProductAttributeValue productAttributeValue) {
		getProductAttributeValues().add(productAttributeValue);
		productAttributeValue.setProductAttribute(this);

		return productAttributeValue;
	}

	public ProductAttributeValue removeProductAttributeValue(ProductAttributeValue productAttributeValue) {
		getProductAttributeValues().remove(productAttributeValue);
		productAttributeValue.setProductAttribute(null);

		return productAttributeValue;
	}

}
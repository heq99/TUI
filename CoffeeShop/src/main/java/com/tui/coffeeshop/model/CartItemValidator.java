package com.tui.coffeeshop.model;

import java.util.Iterator;
import java.util.List;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class CartItemValidator implements Validator {

	@Override
	public boolean supports(Class<?> klass) {
		return CartItem.class.isAssignableFrom(klass);
	}

	@Override
	public void validate(Object target, Errors errors) {
		CartItem cartItem = (CartItem) target;
		
		// Validate the "quantity" field
		Integer quantity = cartItem.getQuantity();
		if (quantity==null || quantity==0) {
			errors.rejectValue("quantity", "CartItem.Quantity.ErrMsg", "Please select the quantity.");
		}

		// Validate the necessary product attributes are selected
		List<ProductAttributeValue> selectedAttrValues = cartItem.getAttributes();

		Product product = cartItem.getProduct();
		List<ProductAttribute> productAttrs = product.getProductAttributes();
		if (productAttrs==null || productAttrs.size()==0) return;
		for (int i=0; i<productAttrs.size(); i++) {
			ProductAttribute prodAttr = productAttrs.get(i);
			if (prodAttr.getMandatory()>0) {
				boolean selected = false;
				ProductAttributeValue selectedAttrValue = selectedAttrValues.get(i);
						
				for (Iterator<ProductAttributeValue> j = prodAttr.getProductAttributeValues().iterator(); j.hasNext(); ) {
					ProductAttributeValue prodAttrValue = j.next();
					if (selectedAttrValue.getId() == prodAttrValue.getId()) {
						selected = true;
						break;
					}
				}
				if (!selected) {
					errors.rejectValue("attributes["+i+"].id", 
							"CartItem.ProdAttr.ErrMsg", prodAttr.getName() + " must be selected.");
				}
			}
		}
	}

}

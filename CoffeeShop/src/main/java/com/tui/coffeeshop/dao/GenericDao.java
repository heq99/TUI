package com.tui.coffeeshop.dao;

import java.util.List;

import com.tui.coffeeshop.model.ModelObject;

public interface GenericDao<T extends ModelObject> {

	public T get(Integer id);
	public List<T> getAll();
	public T save(T obj);
	public T update(T obj);
	public T delete(T obj);
	
}

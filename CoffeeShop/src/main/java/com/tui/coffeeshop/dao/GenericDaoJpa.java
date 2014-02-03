package com.tui.coffeeshop.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import com.tui.coffeeshop.model.ModelObject;

public class GenericDaoJpa<T extends ModelObject> implements GenericDao<T> {

	private Class<T> type;
	
	protected EntityManager entityManager;
	
	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	public GenericDaoJpa(Class<T> type) {
		super();
		this.type = type;
	}

	@Override
	@Transactional(readOnly=true)
	public T get(Integer id) {
		if (id==null) {
			return null;
		} else {
			return entityManager.find(type, id);
		}
	}

	@Override
	@Transactional(readOnly=true)
	public List<T> getAll() {
//		return entityManager.createNamedQuery(type.getName() + ".findAll")
//				.getResultList();
		return entityManager.createQuery(
				"select o from " + type.getName() + " o"
				).getResultList();
	}

	@Override
	public T save(T obj) {
		entityManager.persist(obj);
		return obj;
	}

	@Override
	public T update(T obj) {
		entityManager.merge(obj);
		return obj;
	}
	
	@Override
	public T delete(T obj) {
		entityManager.remove(obj);
		return obj;
	}
}

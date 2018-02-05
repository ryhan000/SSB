package edu.daffodil.ssb.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public interface BaseDao<T> {

	void saveOrUpdate(T entity);

	T find(String id);

	void delete(T entity);

	List<T> findAll();
}

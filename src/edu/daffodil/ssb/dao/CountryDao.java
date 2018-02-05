package edu.daffodil.ssb.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
@Component("countryDao")
public class CountryDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}

	
	public void saveOrUpdate(Country entity) {
		session().saveOrUpdate(entity);
		
	}

	
	public Country find(String id) {
		DetachedCriteria criteria= DetachedCriteria.forClass(Country.class);
		criteria.add(Restrictions.eq("countryId", Integer.parseInt(id)));
		return (Country) criteria.getExecutableCriteria(session()).uniqueResult();
	}

	
	public void delete(Country entity) {
		session().delete(entity);
	}
	
	@SuppressWarnings("unchecked")
	public List<Country> findAll() {
		DetachedCriteria criteria=DetachedCriteria.forClass(Country.class);
		return criteria.getExecutableCriteria(session()).list();
	}


	
	

}

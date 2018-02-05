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
@Component("userDao")
@Transactional
public class UserDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}	
	

	public void saveOrUpdate(User entity) {
		session().saveOrUpdate(entity);
	}


	public User find(String id) {
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class); 
		criteria.add(Restrictions.eq("username", id));
		return (User) criteria.getExecutableCriteria(session()).uniqueResult();
	}

	
	public void delete(User entity) {
		session().delete(entity);		
	}
	
	
	@SuppressWarnings("unchecked")
	public List<User> findAll() {
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class); 
		return criteria.getExecutableCriteria(session()).list();
	}

	
}

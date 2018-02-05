package edu.daffodil.ssb.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
@Component("GradeDao")
public class GradeDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}
	
	public void saveGrade(Grade grade){
		session().save(grade);
	}
public Grade showGrade() {
		
		DetachedCriteria criteria = DetachedCriteria.forClass(Grade.class); 
		criteria.addOrder(Order.desc("id"));
		return (Grade) criteria.getExecutableCriteria(session()).uniqueResult();
	}

}

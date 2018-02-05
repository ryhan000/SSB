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
@Component
public class EmployeeDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}
	
	public void saveOrUpdate(Employee entity) {
		session().saveOrUpdate(entity);
	}
	
	public Employee find(String id) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Employee.class);
		criteria.add(Restrictions.eq("employeeId", id));
		return (Employee) criteria.getExecutableCriteria(session()).uniqueResult();
	}
	
	public void delete(Employee entity) {
		session().delete(entity);
	}

	@SuppressWarnings("unchecked")	
	public List<Employee> findAll() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Employee.class); 
		return criteria.getExecutableCriteria(session()).list();
	}

	

}

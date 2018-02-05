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
@Component("AccCaSubGroupsDao")
public class AccCaSubGroupsDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}
	
	@SuppressWarnings({ "unchecked" })
	public List<AccCaSubGroups> showAccCaSubGroupsByGroups(int cag_id){
		DetachedCriteria criteria = DetachedCriteria.forClass(AccCaSubGroups.class);
		criteria.add(Restrictions.eq("cag_id", cag_id));
		return criteria.getExecutableCriteria(session()).list();
	}
}

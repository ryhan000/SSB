package edu.daffodil.ssb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.daffodil.ssb.dao.User;
import edu.daffodil.ssb.dao.UserDao;

@Service("userService")
public class UserService{

	@Autowired
	private UserDao userDao;
	
	
	public void saveOrUpdate(User entity) {
		userDao.saveOrUpdate(entity);
	}

	
	public User find(String id) {
		return userDao.find(id);
	}

	public void delete(User entity) {		
		userDao.delete(entity);		
	}


	public List<User> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}

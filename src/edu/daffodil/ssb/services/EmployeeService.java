package edu.daffodil.ssb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.daffodil.ssb.dao.Employee;
import edu.daffodil.ssb.dao.EmployeeDao;

@Service
public class EmployeeService{

	@Autowired
	private EmployeeDao employeeDao;
	
	
	public void saveOrUpdate(Employee entity) {
		employeeDao.saveOrUpdate(entity);
	}

	
	public Employee find(String id) {
		return employeeDao.find(id);
	}

	
	public void delete(Employee entity) {
		 employeeDao.delete(entity);
		
	}

	
	public List<Employee> findAll() {
		return employeeDao.findAll();
	}

	
}

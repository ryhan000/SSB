package edu.daffodil.ssb.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.daffodil.ssb.dao.Grade;
import edu.daffodil.ssb.dao.GradeDao;

@Service("gradeService")
public class GradeService {
	private GradeDao gradeDao;
	
	@Autowired
	public void setEmployeeDao(GradeDao gradeDao) {
		this.gradeDao = gradeDao;
	}
	
	public void saveGrade(Grade grade) {
		gradeDao.saveGrade(grade);
	}
public Grade showGrade() {
		
		return gradeDao.showGrade();
	}

}

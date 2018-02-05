package edu.daffodil.ssb.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.daffodil.ssb.dao.Student;
import edu.daffodil.ssb.dao.StudentDao;

@Service("studentService")
public class StudentService {
	
	private StudentDao studentDao;
	
	@Autowired
	public void setStudentDao(StudentDao studentDao){
		this.studentDao= studentDao;
	}
	
	public void saveStudentResult(Student student){
		studentDao.saveStudentResult(student);
	}
}

package edu.daffodil.ssb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import edu.daffodil.ssb.dao.Student;
import edu.daffodil.ssb.services.StudentService;

@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	
@RequestMapping(value="/student")
	public String showStudent(){
	return "student";
}
@RequestMapping(value="/saveStudentResult", method=RequestMethod.POST)
public @ResponseBody String saveStudentResult(@RequestBody Student student)
{
	studentService.saveStudentResult(student);
	return "Record Done!";
}

}

package edu.daffodil.ssb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import edu.daffodil.ssb.dao.Grade;
import edu.daffodil.ssb.services.GradeService;

@Controller
public class GradeController {
	private GradeService gradeService;
	@RequestMapping(value="/showGrade",method=RequestMethod.POST)
	public @ResponseBody Grade showGrade(){		
		
		return gradeService.showGrade();
			
	}

}

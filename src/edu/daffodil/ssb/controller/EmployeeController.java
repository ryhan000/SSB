package edu.daffodil.ssb.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.daffodil.ssb.dao.Employee;
import edu.daffodil.ssb.services.CountryService;
import edu.daffodil.ssb.services.EmployeeService;
import edu.daffodil.ssb.services.UserService;



@Controller
@RequestMapping(value="/employee")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;	
	@Autowired
	private CountryService countryService;
	@Autowired
	private UserService userService;

	@RequestMapping(value="/show")
	public ModelAndView showPage(Principal principal){		
		ModelAndView mv=new ModelAndView();
		mv.addObject("countryList",countryService.findAll());
		mv.setViewName("employee");		
		return mv;
	}
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public @ResponseBody String saveEmployee(@RequestParam("employeeId") String employeeId,
			@RequestParam("employeeName") String employeeName,@RequestParam("email") String email,
			@RequestParam("countryId") String countryId,@RequestParam("tempId") String tempId,
			Principal principal){		
		
		try {
			
			Employee employee=new Employee();
			employee.setCountry(countryService.find(countryId));
			employee.setCreatedAt(new Date());
			employee.setEmail(email);
			employee.setEmployeeId(employeeId);
			employee.setEmployeeName(employeeName);
			employee.setUser(userService.find(principal.getName()));	
			
			System.out.println(employee);
			employeeService.saveOrUpdate(employee);
			
		} catch (Exception e) {
			System.out.println("Error..."+e);
			return "EE";
			// TODO: handle exception
		}	
			
		return tempId.trim().equals("") ? "1":"2";
	}
	
	@RequestMapping(value="/showEmployeeList",method=RequestMethod.POST)
	public @ResponseBody List<Employee> showEmployee(){		
		
		return employeeService.findAll();
			
	}
	
	
	@RequestMapping(value="/showEmployeeById",method=RequestMethod.POST)
	public @ResponseBody Employee showEmployeeById(@RequestParam("empId") int empId){	
		return employeeService.find(String.valueOf(empId));
			
	}
}

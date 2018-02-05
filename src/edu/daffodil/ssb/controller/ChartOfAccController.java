package edu.daffodil.ssb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChartOfAccController {
	@RequestMapping("/chartofacc")
	public String showHome(){
		return "chartofacc";
	}
}

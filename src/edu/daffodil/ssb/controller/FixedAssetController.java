package edu.daffodil.ssb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FixedAssetController {

	@RequestMapping("/fixedasset")
	public String showFixedasset(){
		return "fixedasset";
	}
}

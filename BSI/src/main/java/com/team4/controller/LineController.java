package com.team4.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.Service.LineService;
import com.team4.vo.LineVO;

@Controller
@RequestMapping(path = {"/line-khw"})
public class LineController {
	
	@Autowired
	@Qualifier("LineService")
	private LineService lineService;
	
	@GetMapping(path = {"/line"})
	public String line(@RequestParam(defaultValue = "1") String month,
					@RequestParam(defaultValue = "1") String days,Model model) {
		
		List<LineVO> lines = lineService.findAvgUnumber();
		
		model.addAttribute("lines", lines);
		
		return "line-khw/line";
	}
	
	@PostMapping(path= {"/line"})
	@ResponseBody
	public List<LineVO> sAll(String month){
		
		List<LineVO> vo = lineService.findAll(month);
		
		return vo;
	}

}

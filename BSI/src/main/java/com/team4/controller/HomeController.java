package com.team4.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.Service.SubwayService;
import com.team4.vo.JjimVO;
import com.team4.vo.MembersVO;
import com.team4.vo.StationVO;

@Controller
public class HomeController {

	@Autowired
	@Qualifier("subwayService")
	private SubwayService subwayService;

	@RequestMapping(path = { "/", "/home" })
	public String home(@RequestParam(defaultValue = "0") int lname ,Locale locale, Model model, HttpSession session) {
			
	      
		  if((MembersVO)session.getAttribute("loginuser") !=null) {
			  MembersVO s = (MembersVO)session.getAttribute("loginuser"); 
			  String memberId = s.getMemberId();
			  List<JjimVO> jjim = subwayService.findjjim(memberId);
			  model.addAttribute("jjim",jjim);
			  model.addAttribute("s",s);
		  }
		
		  List<StationVO> list = subwayService.findrank();
		  List<Integer> line = subwayService.findline();
//		  
		  StationVO vo = subwayService.findavg();
		  
		  model.addAttribute("line",line);
		  model.addAttribute("list",list);
		  model.addAttribute("vo",vo);
		  
		  List<String> sname = subwayService.findSnameGroupByLine(lname);
			
		  model.addAttribute("sname",sname);
		 
		return "home";
	}
	
	@RequestMapping(path = {"/lname"})
	@ResponseBody
	public List<String> findSnameGroupByLine(Integer lname){
			List<String> sname = subwayService.findSnameGroupByLine(lname);
		return sname;
		
	}

}

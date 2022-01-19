package com.team4.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team4.Service.CustomerService;
import com.team4.Service.SubwayService;
import com.team4.vo.MaxMinVO;
import com.team4.vo.MembersVO;
import com.team4.vo.TimeCustomersVO;

@Controller
@RequestMapping(path= { "/subway" })
public class SubwayController {
	
	@Autowired
	@Qualifier("subwayService")
	private SubwayService subwayService;
	
	@Autowired
	@Qualifier("customerService")
	private CustomerService customerService; 
	
	
	@GetMapping(path= {"/init-data.action"})
	public String initData(HttpServletRequest req) {
		
		//subway 테이블에 데이터 저장
		ServletContext application = req.getServletContext();
		String csvPath = application.getRealPath("/WEB-INF/data-files/bsi_2021.csv");
		
		//subwayService.initData(csvPath);
		//customerService.initData(csvPath);
		System.out.println("test");
		
		return "redirect:/" ;
	}
	@GetMapping(path= { "/2" })
	public String one(@RequestParam(defaultValue = "Max") String MaxMin,Model model) {
		
		List<String> subway = subwayService.getSname();
		
		model.addAttribute("subway",subway);
		model.addAttribute("MaxMin", MaxMin);

		return "subway/2";
	}
	
	@PostMapping(path= { "/2" })
	public String findStationAndMaxMin(@RequestParam(defaultValue = "다대포해수욕장") String station,
									   @RequestParam(defaultValue = "Max") String MaxMin,
										Model model) {
		
		List<String> subway = subwayService.getSname();
		
		model.addAttribute("subway",subway); //역명
		
		List<MaxMinVO> vo = subwayService.findStationAndMaxMin(station, MaxMin);
		MaxMinVO sum = subwayService.findsum(station);
		
		model.addAttribute("vo", vo);
		model.addAttribute("sum",sum);
		model.addAttribute("station", station); //역명 고정
		model.addAttribute("MaxMin", MaxMin); //최대최소 고정
		
		return "subway/2";
	}
	
	
//	@GetMapping(path= { "/3" })
//	public String third() {
//		return "subway/3";
//	} // 김혜원
	
//	@GetMapping(path= { "/4" })
//	public String four() {
//		return "subway/4";
//	} // 김혜원
	
	@GetMapping(path= { "/5" })
	public String five() {
		return "subway/5";
	}
	
	@GetMapping(path= { "/manage" })
	public String manage(Model model) {
		
		//데이터 조회
		List<MembersVO> members = subwayService.findAll();
		
		// View 에서 사용할 수 있도록	 Model 타입의 전달인자에 저장 -> request 객체에 저장
		model.addAttribute("members" , members);
		
		return "subway/manage";
	}
	
	@GetMapping(path= { "/managedetail" })
	public String managedetail(String memberId, Model model) {
		
		// 1. 요청데이터 읽기
		// 2. 데이터베이스에서 데이터 조회(데이터가 없으면 목록으로 이동)
		MembersVO member = subwayService.findMemberByMemberId(memberId);
		
		if(member == null) {
			return "redirect:manage";
		}
		
		//3. view(.jsp)에서 읽을 수 있도록 데이터 저장
		model.addAttribute("member",member);//HttpServlertRequest.setattribute;
		
		return "subway/managedetail";
	}
	@GetMapping(path= { "/manageedit" })
	public String manageedit(String memberId, Model model) {
		
		// 1. 요청데이터 읽기
		// 2. 데이터베이스에서 데이터 조회(데이터가 없으면 목록으로 이동)
		MembersVO member = subwayService.findMemberByMemberId(memberId);
		
		if(member == null) {
			return "redirect:manage";
		}
		
		//3. view(.jsp)에서 읽을 수 있도록 데이터 저장
		model.addAttribute("member",member);//HttpServlertRequest.setattribute;
		
		return "subway/manageedit";
	}
	
	@PostMapping(path= { "/update" })
	public String update(MembersVO member) {
		
		//1. 요청데이터 읽기( 전달인자로 대체 )
		
		//2. 데이터베이스의 데이터 수정
		subwayService.updateMember(member);
		
		return"redirect:managedetail?memberId=" + member.getMemberId();
	}
	@GetMapping(path= { "/delete" })
	public String deleteMember(String memberId) {
		
		//1. 요청데이터 읽기( 전달인자로 대체 )
		
		//2. 데이터베이스의 데이터 수정
		subwayService.deleteMember(memberId);
		
		return"redirect:manage";
	}
	
	// 휘연님 작업 영역 시작
	
	@GetMapping(path = { "/customer-stats1" }) 
	public String showCustomerStats1(Model model) {
		
		List<HashMap<String, Object>> subwayNames = subwayService.findAllSubwayNames();
		
		//System.out.println(subwayNames.get(0));

		model.addAttribute("subwayNames", subwayNames);
		
		return "subway/customer-stats1";
	}
	
	@PostMapping(path = { "/customer-stats1" }) 
	public String showCustomerStats(String snumber, String hour, Model model) {
		
		List<HashMap<String, Object>> subwayNames = subwayService.findAllSubwayNames();
		
		System.out.println(snumber + " / " + hour);
		
		// snumber와 hour를 이용해서 데이터베이스에서 데이터 조회
		List<TimeCustomersVO> vo = subwayService.findTimeCustomers(snumber, hour);
		System.out.println(vo);
		List<TimeCustomersVO> avg = subwayService.findAvgByDate(snumber);
		
 		// 조회된 데이터 저장 ( jsp에서 읽을 수 있도록 )
		model.addAttribute("subwayNames", subwayNames);
		model.addAttribute("selectedSnumber", snumber);
		model.addAttribute("selectedHour", hour.substring(0, hour.indexOf("시")));  // 12시 -> 12
		model.addAttribute("vo", vo);
		model.addAttribute("avg",avg);
		
		return "subway/customer-stats1";
	}
	// 휘연님 작업 영역 끝
}

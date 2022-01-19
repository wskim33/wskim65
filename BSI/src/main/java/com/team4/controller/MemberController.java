package com.team4.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.Service.AuthService;
import com.team4.Service.SubwayService;
import com.team4.vo.JjimVO;
import com.team4.vo.MembersVO;
import com.team4.vo.StationVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	@Qualifier("authService")
	private AuthService authService;
	
	@Autowired
	@Qualifier("subwayService")
	private SubwayService subwayService;
	
	@GetMapping(path= { "/5" })
	public String five() {
		return "member/5";
	}

	@GetMapping(path= { "/edit" })
	public String edit() {
		
		return "member/edit";
	}
	
	@PostMapping(path= { "/edit" })
	public String confirmIdAndpasswd(String memberId, String passwd, HttpSession session) {
		
		MembersVO member = authService.findMemberByIdAndPasswd(memberId, passwd);
		
		MembersVO s = (MembersVO)session.getAttribute("loginuser");
		
		if(member !=null && member.getMemberId().equals(s.getMemberId())) {

			return"member/editdetail";
		} else {
			return"member/edit";
		}
		
	}
	
	@GetMapping(path= { "/editdetail" })
	public String egitMyInfo() {
		
		return "member/editdetail";
	}
	
	@PostMapping(path= { "/update" })
	public String updateMember(@RequestParam(name="memberId") String memberId,
								@RequestParam(name="email") String email,
								@RequestParam(name="passwd") String passwd) {
		
		authService.updateMember(memberId, email, passwd);
		
		return "member/edit";
	}
	
	@GetMapping(path= { "/like" })
	public String like(@RequestParam(defaultValue = "0") int lname, Locale locale, Model model, HttpSession session) {
		
		List<Integer> line = subwayService.findline();
		List<String> sname = subwayService.findSnameGroupByLine(lname);
		
		model.addAttribute("line",line);
		model.addAttribute("sname",sname); //동적 셀렉트
		
		MembersVO s = (MembersVO)session.getAttribute("loginuser");
		String memberId = s.getMemberId();
		
		List<JjimVO> jjim = subwayService.findjjim(memberId);
		model.addAttribute("jjim",jjim);
		
		return "member/like";
	}
	
	@PostMapping(path = {"/like"})
	public String jjim(@RequestParam(defaultValue = "0") int lname,
						@RequestParam(name="sname") String snames,
						Model model, HttpSession session, HttpServletResponse response) throws IOException {
		
		// List<Integer> line = subwayService.findline();
		// List<String> sname = subwayService.findSnameGroupByLine(lname);
		
		// model.addAttribute("line",line);
		// model.addAttribute("sname",sname); //동적 셀렉트
		
		MembersVO s = (MembersVO)session.getAttribute("loginuser");
		String memberId = s.getMemberId(); 
		List<JjimVO> jjim = subwayService.findjjim(memberId);
		//System.out.println(jjim.get(0).getSname());
		//System.out.println(snames.equals(jjim.get(0).getSname()));
		
		subwayService.insertlist(snames, memberId);
		
		model.addAttribute("jjim",jjim);
		
		return "redirect:/member/like";
	}
	
	@PostMapping(path = { "/delete" })
	@ResponseBody
	public String deletejjim(String sname, String memberId) {
		
		subwayService.deletejjim(sname,memberId);
		
		return "redirect:/member/like";
	}
	
	@RequestMapping(path = {"/lname3"})
	@ResponseBody
	public List<String> findSnameGroupByLine(Integer lname){
			List<String> sname = subwayService.findSnameGroupByLine(lname);
		return sname;
		
	}
	@ResponseBody
	@PostMapping(path = {"/nchk"})
	public int snameCheck(String sname, String memberId) {
		
		int check =subwayService.findname(sname, memberId);
		
		return check;
	}
}

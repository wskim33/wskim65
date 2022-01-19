package com.team4.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.Service.AuthService;
import com.team4.Service.SubwayService;
import com.team4.vo.MembersVO;

@Controller
@RequestMapping(path= { "/account" })
public class AccountController {
	
	@Autowired
	@Qualifier("authService")
	private AuthService authService;
	
	@GetMapping(path= { "/login" })
	public String showLoginForm() {
		
		return "account/login";
	}
	@PostMapping(path= { "/login" })
	public String LoginForm(String memberId, String passwd, HttpSession session, Model model) {
		
		//1. 데이터 읽기( 전달인자로 대체 )
		
		//2. 데이터 처리( 데이터베이스에서 데이터 조회 -> 조회 결과에 따라 세션에 데이터 저장 or 로그인 화면으로 이동 )
		MembersVO member = authService.findMemberByIdAndPasswd(memberId, passwd);
		
		if(member !=null) {
			//전달인자로 세션 받은 세션 이용
			session.setAttribute("loginuser", member);//로그인 처리 -> session 객체에 데이터 저장

			//3. 응답컨텐츠 생산하기(jsp로 forward 또는 따른 Servlet으로 redirect)
			return"redirect:/";
		} else {
			model.addAttribute("msg","아이디 또는 비밀번호가 틀렸습니다.");
			model.addAttribute("url","/account/login");
			return"redirect";
		}
	}
	
	@GetMapping(path= { "/register" })
	public String showRegisterForm() {
		
		return "account/register";
	}
	
	@PostMapping(path= { "/register" })
	public String RegisterForm(MembersVO member) {
		
		//1. 데이터읽기 (전달인자로 대체)
		
		//2. 데이터 처리(데이터베이스에 데이터 저장)
		authService.registerMember(member);
		
		return "redirect:login";
	}
	@PostMapping(path= {"/idchk"})
	@ResponseBody
	public String idCheck(String memberId) {
		
		String idchk = authService.findId(memberId);
		
		return idchk;
	}
	@GetMapping(path= { "/logout" })
	public String LogoutForm(HttpSession session) {
		
		session.removeAttribute("loginuser");
		
		return"redirect:/";
	}
}

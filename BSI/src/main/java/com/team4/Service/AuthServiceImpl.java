package com.team4.Service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.team4.common.Util;
import com.team4.dao.CustomerDao;
import com.team4.mapper.SubwayMapper;
import com.team4.vo.MembersVO;

import lombok.Setter;

public class AuthServiceImpl implements AuthService {

	@Setter
	private SubwayMapper subwayMapper;
	
	@Setter
	private CustomerDao customerDao;

	@Override
	public void registerMember(MembersVO member) {
		
		//passwd 암호화
		String hashedPasswd = Util.getHashedString(member.getPasswd(), "SHA-256");
		member.setPasswd(hashedPasswd);
		
		subwayMapper.insertMember(member);
//		customerDao.insertMember(member);
	}

	@Override
	public MembersVO findMemberByIdAndPasswd(String memberId, String passwd) {

		passwd = Util.getHashedString(passwd, "SHA-256");
		
		MembersVO member = subwayMapper.selectMemberIdAndPasswd(memberId, passwd);
		
		return member;
	}

	@Override
	public void updateMember(String memberId, String email, String passwd) {
		
		passwd = Util.getHashedString(passwd, "SHA-256");
		
		subwayMapper.editMember(memberId,email, passwd);
		
	}

	@Override
	public String findId(String memberId) {
		return subwayMapper.IdCheck(memberId);
	}

}

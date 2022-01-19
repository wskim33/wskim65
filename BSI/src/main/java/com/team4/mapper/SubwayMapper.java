package com.team4.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team4.vo.CustomerVO;
import com.team4.vo.JjimVO;
import com.team4.vo.MaxMinVO;
import com.team4.vo.MembersVO;
import com.team4.vo.StationVO;
import com.team4.vo.SubwayVO;
import com.team4.vo.TimeCustomersVO;

public interface SubwayMapper {

	void insertSubway(List<SubwayVO> subways);
	
	void insertCustomer(List<CustomerVO> customers);

	List<StationVO> selectrank();

	StationVO selectAvg();

	void insertMember(MembersVO member);

	MembersVO selectMemberIdAndPasswd(@Param("memberId") String memberId,@Param("passwd") String passwd);

	List<MembersVO> selectAll();

	MembersVO selectMemberId(String memberId);

	void updateMember(MembersVO member);

	void deleteMember(String memberId);

	List<Integer> selectline();

	List<String> selectSnameGroupByLine(int lname);

	List<String> selectSname();

	void editMember(@Param("memberId") String memberId,@Param("email") String email,@Param("passwd") String passwd);

	void insertlist(@Param("sname") String snames, @Param("memberId") String memberId);

	List<JjimVO> selectjjim(@Param("memberId") String memberId);

	void deletejjim(@Param("sname") String sname,@Param("memberId") String memberId);
	
	// 휘연님 작업 영역 시작
	
	List<HashMap<String, Object>> selectAllSubwayNames();

	List<TimeCustomersVO> selectTimeCustomers(@Param("snumber") String snumber,@Param("hour") String hour);

	List<TimeCustomersVO> selectAvgByDate(@Param("snumber") String snumber);
	
	// 휘연님 작업 영역 끝
	List<MaxMinVO> selectStationAndMaxMin(@Param("station") String station, @Param("MaxMin") String MaxMin);

	MaxMinVO selectSum(@Param("station")String station);

	List<String> selectSnameGroupByLine(@Param("lname") String lname);

	int countname(@Param("sname") String sname, @Param("memberId") String memberId);

	String IdCheck(String memberId);
	
}

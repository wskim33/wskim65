package com.team4.Service;

import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.opencsv.CSVReader;
import com.team4.dao.SubwayDao;
import com.team4.mapper.SubwayMapper;
import com.team4.vo.JjimVO;
import com.team4.vo.MaxMinVO;
import com.team4.vo.MembersVO;
import com.team4.vo.StationVO;
import com.team4.vo.SubwayVO;
import com.team4.vo.TimeCustomersVO;

import lombok.Setter;

public class SubwayServiceImpl implements SubwayService{
	
	@Setter
	private SubwayDao subwaydao;
	
	@Setter
	private SubwayMapper subwayMapper;

	@Override
	public void initData(String csvPath) {
		
		List<SubwayVO> list = readbsiFromCsv(csvPath);
		
		//subwaydao.dropSubwayTable();
		
		//subwaydao.createSubwayTable();
		
		//subwaydao.deleteSubwayData();

		 subwaydao.insertSubway(list);
	}

	public List<SubwayVO> readbsiFromCsv(String csvPath) {
		FileReader fr = null;
		CSVReader csvr = null;
		ArrayList<SubwayVO> result = new ArrayList<>();
		try {
			fr = new FileReader(csvPath);
			csvr = new CSVReader(fr);
			
			csvr.readNext(); // skip header row
			
			while(true) {
				String[] row = csvr.readNext();
				if(row==null) {
					break;
				}
				SubwayVO subway = new SubwayVO(String.valueOf(row[2]),
												Integer.parseInt(row[0]),
												Integer.parseInt(row[1]));
				if(!result.contains(subway)) {//중복제거
					result.add(subway);
				}
			}
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			try { csvr.close(); } catch (Exception ex) {}
			try { fr.close(); } catch (Exception ex) {}
		}
		//System.out.println(result);
		return result;
	}

	@Override  //나중에 MemberServicImpl로 이동 
	public List<MembersVO> findAll() {
		
		List<MembersVO> members = subwayMapper.selectAll();
		
		return members;
	}

	@Override
	public MembersVO findMemberByMemberId(String memberId) {
		
		MembersVO member = subwayMapper.selectMemberId(memberId); 
		
		return member;
	}

	@Override
	public void updateMember(MembersVO member) {
		subwayMapper.updateMember(member);
	}

	@Override
	public List<String> getSname() {
		
		List<String> subway = subwayMapper.selectSname();
		
		return subway;
	}

	@Override
	public void deleteMember(String memberId) {
		subwayMapper.deleteMember(memberId);
	}

	@Override
	public List<StationVO> findrank() {
		
		List<StationVO> list = subwayMapper.selectrank();
		
		return list;
	}

	@Override
	public StationVO findavg() {
		
		StationVO vo = subwayMapper.selectAvg();
		
		return vo;
	}

	@Override
	public List<Integer> findline() {
		
		List<Integer> list = subwayMapper.selectline(); 
		
		return list;
	}

	@Override
	public List<String> findSnameGroupByLine(int lname) {
		
		List<String> list = subwayMapper.selectSnameGroupByLine(lname);
		
		return list;
	}

	@Override
	public void insertlist(String snames, String memberId) {
		
		subwayMapper.insertlist(snames, memberId);
	}

	@Override
	public List<JjimVO> findjjim(String memberId) {

		List<JjimVO> jjims = subwayMapper.selectjjim(memberId);
		
		return jjims;
	}

	@Override
	public void deletejjim(String sname, String memberId) {
		subwayMapper.deletejjim(sname, memberId);
		
	}

	// 휘연님 작업 영역 시작
	
	@Override
	public List<HashMap<String, Object>> findAllSubwayNames() {
		return subwayMapper.selectAllSubwayNames();
	}

	@Override
	public List<TimeCustomersVO> findTimeCustomers(String snumber, String hour) {

		List<TimeCustomersVO> vo = subwayMapper.selectTimeCustomers(snumber, hour);
		
		return vo;
	}

	@Override
	public List<TimeCustomersVO> findAvgByDate(String snumber) {

		List<TimeCustomersVO> vo = subwayMapper.selectAvgByDate(snumber);
		
		return vo;
	}

	@Override
	public List<MaxMinVO> findStationAndMaxMin(String station, String MaxMin) {
		
		List<MaxMinVO> vo = subwayMapper.selectStationAndMaxMin(station, MaxMin);
		
		return vo;
	}

	@Override
	public MaxMinVO findsum(String station) {

		MaxMinVO vo = subwayMapper.selectSum(station);
		
		return vo;
	}

	@Override
	public int findname(String sname, String memberId) {
		return subwayMapper.countname(sname, memberId);
	}
	
	// 휘여님 작업 영역 끝


}


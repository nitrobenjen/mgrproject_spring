package com.mgr.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.mgr.dao.AdminDAO;
import com.mgr.dto.AdminTeachVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO dao;

	@Override
	public List<AdminTeachVO> adminTeachListAll(String currentpage2) {
		List<AdminTeachVO> result1 = dao.adminTeachListAll();
		List<AdminTeachVO> result = new ArrayList<AdminTeachVO>();
		int totalrow = result1.size();
		int totalpage;
		int currentpage;
		int listpage; // 미정
		int max = 5;
		

		if (currentpage2 == null || currentpage2.equals("")) {
			currentpage = 1;
		} else {
			currentpage = Integer.parseInt(currentpage2);
		}
		if (totalrow % max != 0) {
			totalpage = (totalrow / max) + 1;
		} else {
			totalpage = totalrow / max;
		}
		
		
		for (int i = currentpage * max - max; i < currentpage * max; i++) {
			if(i == totalrow)
				break;
			AdminTeachVO m = new AdminTeachVO();
			m.setTeacher_id(result1.get(i).getTeacher_id());
			m.setTeacher_name(result1.get(i).getTeacher_name());
			m.setTeacher_ssn(result1.get(i).getTeacher_ssn());
			m.setTeacher_phone(result1.get(i).getTeacher_phone());
			m.setTeacher_hiredate(result1.get(i).getTeacher_hiredate());
			m.setCount_(result1.get(i).getCount_());
			m.setCheck(result1.get(i).getCheck());
			m.setCheck2(result1.get(i).getCheck2());
			m.setTotalrow(totalpage);
			result.add(m);
			
		}

		return result;
	}

	@Override
	public List<AdminTeachVO> adminTeachSublist(String teacher_id) {
		List<AdminTeachVO> result = dao.adminTeachSublist(teacher_id);
		return result;
	}

	@Override
	public List<AdminTeachVO> adminTeachNocheck(String value) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminTeachDelsub(String teacher_id) {

		return 0;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor = {Exception.class,RuntimeException.class, DataAccessException.class})
	@Override
	public int adminTeachModifyinfo(AdminTeachVO t) {

		int code = 100;

		try {
			dao.adminTeachDelsub(t.getTeacher_id());
			dao.adminTeachModifyinfo(t);

			if (t.getSub() != null) {
				for (int i = 0; i < t.getSub().length; i++) {
					t.setSubject_id(t.getSub()[i]);
					dao.adminTeachsubInsert(t);
				}
			}

		} catch (Exception e) {
			code = 200;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}

		return code;
	}

	@Override
	public List<AdminTeachVO> adminBasicsublist(String teacher_id) {
		List<AdminTeachVO> totalsub = dao.adminBasicsublist(); // 전체 과목 목록
		List<AdminTeachVO> result = dao.adminTeachSublist(teacher_id); // 강사 강의가능한 목록
		List<AdminTeachVO> result2 = dao.adminTeachNocheck(teacher_id); // 특정 강사의 강의가능한 과목중 체크 해제 하면 안되는 목록

		for (int i = 0; i < totalsub.size(); i++) {
			for (int j = 0; j < result.size(); j++) {
				if (totalsub.get(i).getSubject_id().equals(result.get(j).getSubject_id())) {
					totalsub.get(i).setCheck("checked");
				}
			}

			// 비교를 통해 일치하는 인덱스의 disabled에 값을 집어넣는다. 이것을 통해 체크 해제 하면 안되는 과목에 비활성화가 가능해진다.
			for (int j = 0; j < result2.size(); j++) {
				if (totalsub.get(i).getSubject_id().equals(result2.get(j).getSubject_id())) {
					totalsub.get(i).setCheck2("disabled"); // 체크 해제 하면 안되는 목록에 disabled속성을 추가한다.
					break;
				}
			}
		}

		return totalsub;
	}

}

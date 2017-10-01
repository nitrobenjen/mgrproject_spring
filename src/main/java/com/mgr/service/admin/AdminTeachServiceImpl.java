package com.mgr.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.mgr.dao.admin.AdminTeachDAO;
import com.mgr.dto.AdminTeachVO;

@Service
public class AdminTeachServiceImpl implements AdminTeachService {

	@Autowired
	private AdminTeachDAO dao;

	@Override
	public List<AdminTeachVO> adminTeachListAll(String currentpage2, AdminTeachVO t) {
		List<AdminTeachVO> result1 = dao.adminTeachListAll(t); //강사 전체 목록
		List<AdminTeachVO> result = new ArrayList<AdminTeachVO>();
		try {
			
			List<AdminTeachVO> disblecheck1 = dao.adminTeachdisable1(t); // 강사 관리 삭제 비활성화 체크, 개설과목과 연결되있는지 확인
			List<AdminTeachVO> disblecheck2 = dao.adminTeachdisable2(t); // 강사 관리 삭제 비활성화 체크, 강의가능과 연결되있는지 확인
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
			
			
			disblecheck1.addAll(disblecheck2);
			
			List<String> disblecheck= new ArrayList<String>();
			for(int i=0; i<disblecheck1.size(); i++) {
				disblecheck.add(disblecheck1.get(i).getTeacher_id());
			}
			
			HashSet<String> hs = new HashSet<String>(); //중복 제거
			hs.addAll(disblecheck);
			disblecheck.clear();
			disblecheck.addAll(hs);
			
		
			
			for (int i = 0; i < result1.size(); i++) {
				for (int j = 0; j < disblecheck.size(); j++) {
					if (result1.get(i).getTeacher_id().equals(disblecheck.get(j))) {
						result1.get(i).setCheck("disabled");
						break;
					}
				}			
			}
			

			for (int i = currentpage * max - max; i < currentpage * max; i++) {
				if (i == totalrow)
					break;
				AdminTeachVO m = new AdminTeachVO();
				m.setTeacher_id(result1.get(i).getTeacher_id());
				m.setTeacher_name(result1.get(i).getTeacher_name());
				m.setTeacher_ssn(result1.get(i).getTeacher_ssn());
				m.setTeacher_phone(result1.get(i).getTeacher_phone());
				m.setTeacher_hiredate(result1.get(i).getTeacher_hiredate());
				m.setCount_(result1.get(i).getCount_());			
				m.setCheck(result1.get(i).getCheck());
				m.setTotalpage(totalpage);
				m.setTotalrow(totalrow);
				result.add(m);

			}

			
		}catch(Exception e) {
			e.printStackTrace();
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

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class, RuntimeException.class,
			DataAccessException.class })
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

	@Override
	public List<AdminTeachVO> adminBasicsublist() {
		List<AdminTeachVO> result = dao.adminBasicsublist(); // 전체 과목 목록
		return result;
	}

	
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class, RuntimeException.class,
			DataAccessException.class })
	@Override
	public int adminteachadd(AdminTeachVO t) {
		int code = 100;
		

		try {
			String teacher_id = dao.adminTeachId();
			t.setTeacher_id(teacher_id);
			dao.adminTeachadd(t);

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
	public int adminteachdel(String teacher_id) {
		int result = 100;
		try {
			 dao.adminTeachDel(teacher_id);
		}catch(Exception e) {
			e.printStackTrace();
			result = 200;
		}
		
		return result;
	}

	
	
}

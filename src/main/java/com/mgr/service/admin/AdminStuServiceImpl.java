package com.mgr.service.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mgr.dao.admin.AdminStuDAO;
import com.mgr.dto.AdminCourseVO;

@Service
public class AdminStuServiceImpl implements AdminStuService {

	@Autowired
	private AdminStuDAO dao;

	// 수강생 정보 등록
	@Override
	public int adminStuInfoAdd(AdminCourseVO t) {
		int result = 100;

		try {
			dao.adminStuInfoAdd(t);

		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<AdminCourseVO> adminStuList(String currentpage2, AdminCourseVO t) {
		List<AdminCourseVO> result1 = dao.adminStuList(t); 
		List<AdminCourseVO> result = new ArrayList<AdminCourseVO>();
		try {

			List<AdminCourseVO> disblecheck = dao.adminStuDisable(t); // 강사 관리 삭제 비활성화 체크, 개설과목과 연결되있는지 확인
			int totalrow = result1.size();
			int totalpage;
			int currentpage;
			int max = 10;

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

			for (int i = 0; i < result1.size(); i++) {
				for (int j = 0; j < disblecheck.size(); j++) {
					if (result1.get(i).getStudent_id().equals(disblecheck.get(j).getStudent_id())) {
						result1.get(i).setDelcheck("disabled");
						break;
					}
				}
			}

			for (int i = currentpage * max - max; i < currentpage * max; i++) {
				if (i == totalrow)
					break;
				AdminCourseVO m = new AdminCourseVO();
				m.setStudent_id(result1.get(i).getStudent_id());
				m.setStudent_name(result1.get(i).getStudent_name());
				m.setStudent_ssn(result1.get(i).getStudent_ssn());
				m.setStudent_phone(result1.get(i).getStudent_phone());
				m.setStudent_regdate(result1.get(i).getStudent_regdate());
				m.setCount_(result1.get(i).getCount_());
				m.setDelcheck(result1.get(i).getDelcheck());
				m.setTotalpage(totalpage);
				m.setTotalrow(totalrow);
				result.add(m);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 수강생 삭제
	@Override
	public int adminStuDel(AdminCourseVO t) {
		int result = 100;

		try {
			dao.adminStuDel(t);

		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}
		return result;
	}

	// 수강생 수정
	@Override
	public int adminStuModify(AdminCourseVO t) {
		int result = 100;
		try {
			 dao.adminStuModify(t);
			
		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}
		return result;
	}
	
	
	//수강생 과정 등록하기 위해 목록 리턴

	@Override
	public List<AdminCourseVO> adminstucourseaddlist(AdminCourseVO t) {
		List<AdminCourseVO> result = dao.adminStuCourseAddList(t);
		List<AdminCourseVO> disablecheck = dao.adminStuCourseAddListCheck(t);
		List<AdminCourseVO> disablecheck2 = dao.adminStuCourseAddListCheck2(t);
		
		
		if(disablecheck.size() != 0) {
			
			for(int i=0; i<result.size(); i++) {
				
				for(int j=0; j<disablecheck.size(); j++) {
					if(result.get(i).getOpen_course_id().equals(disablecheck.get(j).getOpen_course_id())) {
						result.get(i).setAddcheck("disabled");
					}
				}
			}
		}
		
		if(disablecheck2.size() != 0) {
			
			for(int i=0; i<result.size(); i++) {
				
				for(int j=0; j<disablecheck2.size(); j++) {
					if(result.get(i).getOpen_course_id().equals(disablecheck2.get(j).getOpen_course_id())) {
						result.get(i).setDelcheck("disabled");
					}
				}
			}
			
		}
		
		
		
	
		
		return result;
	}

	//수강생 과정 등록
	@Override
	public int adminStuCourseAdd(AdminCourseVO t) {
		int result = 100;
		try {
			 dao.adminStuCourseAdd(t);
			
		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}
		return result;
	}

	//수강생 관리 > 수강 이력
	@Override
	public List<AdminCourseVO> adminstulistcourse(AdminCourseVO t) {
		List<AdminCourseVO> result = dao.adminStuListCourse(t);
		List<AdminCourseVO> finish_day = dao.adminStuListCourseCheck(t);
		
		if(finish_day.size() >0) {
			
			for(int i=0; i<result.size(); i++) {
				
				for(int j=0; j<finish_day.size(); j++) {
					if(result.get(i).getOpen_course_id().equals(finish_day.get(j).getOpen_course_id())) {
						result.get(i).setFinish_day(finish_day.get(j).getFinish_day());
					}
				}
			}
		}
		
		return result;
	}

	@Override
	public int adminstufailadd(AdminCourseVO t) {
		int result = 100;
		try {
			 dao.adminStuFailAdd(t);
			
		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}
		return result;
	}
	
	
	

}

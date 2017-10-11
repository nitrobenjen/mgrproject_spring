package com.mgr.service.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mgr.dao.admin.AdminGradeDAO;
import com.mgr.dto.AdminCourseVO;

@Service
public class AdminGradeServiceImpl implements AdminGradeService {
	
	@Autowired
	private AdminGradeDAO dao;

	//개설과정 리스트
	@Override
	public List<AdminCourseVO> adminGradeCourse(AdminCourseVO t) {
		List<AdminCourseVO> result = dao.adminGradeCourse(t);
		return result;
	}

	//개설과목 리스트
	@Override
	public List<AdminCourseVO> adminGradeSub(AdminCourseVO t) {
		List<AdminCourseVO> result = dao.adminGradeSub(t);
		return result;
	}

	//개설과목별 점수
	@Override
	public List<AdminCourseVO> adminsubgradeview(AdminCourseVO t) {
		List<AdminCourseVO> result = dao.adminsubgradeview(t);
		return result;
	}

	@Override
	public List<AdminCourseVO> adminStuList(String currentpage2, AdminCourseVO t) {
		List<AdminCourseVO> result1 = dao.adminStuList(t); // 강사 전체 목록
		List<AdminCourseVO> result = new ArrayList<AdminCourseVO>();
		try {

			List<AdminCourseVO> disblecheck = dao.adminStuDisable(t); // 강사 관리 삭제 비활성화 체크, 개설과목과 연결되있는지 확인
			int totalrow = result1.size();
			int totalpage;
			int currentpage;
			int listpage; // 미정
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
	

	@Override
	public List<AdminCourseVO> adminstulistcoursegrade(AdminCourseVO t) {
		List<AdminCourseVO> result = dao.adminstulistcoursegrade(t);
		return result;
	}

	@Override
	public List<AdminCourseVO> adminstugrade(AdminCourseVO t) {
		List<AdminCourseVO> result = dao.adminStuGrade(t);
		return result;
	}
	
	
	

}

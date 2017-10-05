package com.mgr.service.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mgr.dao.admin.AdminCourseDAO;
import com.mgr.dto.AdminBasicVO;
import com.mgr.dto.AdminCourseVO;
import com.mgr.dto.AdminTeachVO;

@Service
public class AdminCourseServiceImpl implements AdminCourseService {

	@Autowired
	private AdminCourseDAO dao;

	// 개설과정 리스트
	@Override
	public List<AdminCourseVO> adminCourseList(AdminCourseVO t) {
		List<AdminCourseVO> result = dao.adminCourseList(t); // 개설과목 수 포함

		return result;
	}

	// 개설과정 등록
	@Override
	public int admincourseadd(AdminCourseVO t) {
		int result = 100;

		try {

			dao.adminCourseAdd(t);
		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	// 개설과정 등록을 위한 과정, 강의실
	@Override
	public List<AdminBasicVO> adminCourseAddList() {
		List<AdminBasicVO> course = dao.adminCourseAddList1();
		List<AdminBasicVO> class_ = dao.adminCourseAddList2();
		course.addAll(class_);

		return course;
	}

	@Override
	public int adminCourseDel(AdminCourseVO t) {
		int result = 100;

		try {

			dao.adminCourseDel(t);
		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	// 개설과정 수정
	@Override
	public int adminCourseMdify(AdminCourseVO t) {
		int result = 100;

		try {

			dao.adminCourseModify(t);
		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	// 개설 과정 > 수강생 명단
	@Override
	public List<AdminCourseVO> adminCourseStu(AdminCourseVO t, String currentpage2, String open_course_id) {
		t.setOpen_course_id(open_course_id);
		List<AdminCourseVO> result1 = dao.adminCourseStu(t);
		List<AdminCourseVO> result = new ArrayList<AdminCourseVO>();

		try {

			int totalrow = result1.size();
			int totalpage;
			int currentpage;
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
				if (i == totalrow)
					break;
				AdminCourseVO m = new AdminCourseVO();
				m.setStudent_id(result1.get(i).getStudent_id());
				m.setStudent_name(result1.get(i).getStudent_name());
				m.setStudent_ssn(result1.get(i).getStudent_ssn());
				m.setStudent_phone(result1.get(i).getStudent_phone());
				m.setStudent_regdate(result1.get(i).getStudent_regdate());
				m.setFinish_day(result1.get(i).getFinish_day());
				m.setTotalpage(totalpage);
				m.setTotalrow(totalrow);
				result.add(m);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	////////////// 개설 과목///////

	@Override
	public List<AdminCourseVO> adminOpenSub(AdminCourseVO t, String open_course_id) {

		t.setOpen_course_id(open_course_id);
		List<AdminCourseVO> result = dao.adminOpenSub(t); // 개설과목 수 포함
		List<AdminCourseVO> addcheck = result;
		List<AdminCourseVO> delcheck = dao.adminSubDelCheck(t);
		if (result.size() != 0) {
			for (int i = 0; i < result.size(); i++) {
				int compare = result.get(i).getSub_end_day().compareTo(addcheck.get(i).getCourse_end_day());
				if (compare >= 0) {
					result.get(0).setAddcheck("disabled");
				}
			}
	

			if (delcheck.size() == 0) {
				for (AdminCourseVO m : result) {
					m.setDelcheck("disabled");
				}
			} else {
				
				for (int i = 0; i < result.size(); i++) {

					result.get(i).setDelcheck("disabled");
					for (int j = 0; j < delcheck.size(); j++) {
						
						if(result.get(i).getOpen_sub_id().equals(delcheck.get(j).getOpen_sub_id())) {
							result.get(i).setDelcheck(null);
							break;
						}

					}
				}

			}

		}

		return result;
	}

	@Override
	public List<AdminBasicVO> adminSubAddList() {
		List<AdminBasicVO> sub = dao.adminBasicSub();
		List<AdminBasicVO> book = dao.adminBasicBook();
		sub.addAll(book);
		return sub;
	}

	@Override
	public List<AdminTeachVO> adminSubAddListTeach(String subject_id) {
		List<AdminTeachVO> result = dao.adminSubAddListTeach(subject_id);

		return result;
	}

	// 개설과목 날짜 탐색
	@Override
	public List<AdminCourseVO> adminSubDaySearch(AdminCourseVO t, String open_course_id) {
		t.setOpen_course_id(open_course_id);
		List<AdminCourseVO> result = dao.adminOpenSub(t); // 개설과목 수 포함
		return result;
	}

	// 개설과목 등록
	@Override
	public int adminOpenSubadd(AdminCourseVO t) {

		int result = 100;
		try {

			dao.adminOpenSubadd(t);
		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}
		return result;
	}

	//개설 과목 삭제
	@Override
	public int adminOpenSubDel(AdminCourseVO t) {
		int result = 100;
		try {

			dao.adminOpenSubDel(t);
		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}
		return result;
	}

	//개설과목 수정
	@Override
	public int adminOpenSubModify(AdminCourseVO t) {
		int result = 100;
		try {

			dao.adminOpenSubModify(t);
		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}
		return result;
	}
	
	
	

}

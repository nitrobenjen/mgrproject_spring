package com.mgr.service.admin;

import java.util.List;

import com.mgr.dto.AdminBasicVO;
import com.mgr.dto.AdminCourseVO;
import com.mgr.dto.AdminTeachVO;

public interface AdminCourseService {

	
	//개설과정 리스트
	public List<AdminCourseVO> adminCourseList(AdminCourseVO t);

	//개설과정 등록
	public int admincourseadd(AdminCourseVO t);

	//개설과정 등록을 위한 과정, 강의실 정보 리턴
	public List<AdminBasicVO> adminCourseAddList();

	//개설과정 삭제
	public int adminCourseDel(AdminCourseVO t);

	//개설과정 수정
	public int adminCourseMdify(AdminCourseVO t);

	
	//개설과정 > 수강생 명단
	public List<AdminCourseVO> adminCourseStu(AdminCourseVO t, String currentpage2, String open_course_id);

	
	//개설 과목
	public List<AdminCourseVO> adminOpenSub(AdminCourseVO t, String open_course_id);

	//개설과목 등록을 위한 강사
	public List<AdminBasicVO> adminSubAddList();
	
	//개설과목 등록을 위한 강사
	public List<AdminTeachVO> adminSubAddListTeach(String subject_id);

	//개설과목 날짜 탐색
	public List<AdminCourseVO> adminSubDaySearch(AdminCourseVO t,String open_course_id);

	//개설 과목 등록
	public int adminOpenSubadd(AdminCourseVO t);

	//개설과목 삭제
	public int adminOpenSubDel(AdminCourseVO t);

	//개설 과목 수정
	public int adminOpenSubModify(AdminCourseVO t);

	


}

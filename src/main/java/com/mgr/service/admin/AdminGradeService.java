package com.mgr.service.admin;

import java.util.List;

import com.mgr.dto.AdminCourseVO;

public interface AdminGradeService {

	//개설과정 리스트
	public List<AdminCourseVO> adminGradeCourse(AdminCourseVO t);

	//개설과목 리스트
	public List<AdminCourseVO> adminGradeSub(AdminCourseVO t);

	//개설과목별 점수
	public List<AdminCourseVO> adminsubgradeview(AdminCourseVO t);

	//수강생별 성적확인 1
	public List<AdminCourseVO> adminStuList(String currentpage2, AdminCourseVO t);

	public List<AdminCourseVO> adminstulistcoursegrade(AdminCourseVO t);

	//수강생 개인 과목별 성적
	public List<AdminCourseVO> adminstugrade(AdminCourseVO t);

}

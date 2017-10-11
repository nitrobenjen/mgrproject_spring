package com.mgr.dao.admin;

import java.util.List;

import com.mgr.dto.AdminCourseVO;

public interface AdminGradeDAO {

	//개설과정 성적
	public List<AdminCourseVO> adminGradeCourse(AdminCourseVO t);

	//개설과목 성적
	public List<AdminCourseVO> adminGradeSub(AdminCourseVO t);

	//개설과목별 점수
	public List<AdminCourseVO> adminsubgradeview(AdminCourseVO t);

	//수강생별 성적확인1
	public List<AdminCourseVO> adminStuList(AdminCourseVO t);

	//필요있나?
	public List<AdminCourseVO> adminStuDisable(AdminCourseVO t);

	//특정수강생의 수강이력 과정 > 과목수
	public List<AdminCourseVO> adminstulistcoursegrade(AdminCourseVO t);

	public List<AdminCourseVO> adminStuGrade(AdminCourseVO t);

}

package com.mgr.service.admin;

import java.util.List;

import com.mgr.dto.AdminCourseVO;

public interface AdminStuService {

	//수강생 정보등록
	public int adminStuInfoAdd(AdminCourseVO t);

	//수강생 리스트
	public List<AdminCourseVO> adminStuList(String currentpage2, AdminCourseVO t);

	//수강생 삭제
	public int adminStuDel(AdminCourseVO t);

	//수강생 수정
	public int adminStuModify(AdminCourseVO t);

	//수강생 과정 등록 목록 리턴
	public List<AdminCourseVO> adminstucourseaddlist(AdminCourseVO t);

	//수강생 과정 등록
	public int adminStuCourseAdd(AdminCourseVO t);

	//수강생 -> 수강이력
	public List<AdminCourseVO> adminstulistcourse(AdminCourseVO t);

	//중도탈락 입력
	public int adminstufailadd(AdminCourseVO t);


}

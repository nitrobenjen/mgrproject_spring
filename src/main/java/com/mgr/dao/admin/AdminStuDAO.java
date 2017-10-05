package com.mgr.dao.admin;

import java.util.List;

import com.mgr.dto.AdminCourseVO;

public interface AdminStuDAO {

	//수강생정보등록
	public int adminStuInfoAdd(AdminCourseVO t);

	//수강생 목록
	public List<AdminCourseVO> adminStuList(AdminCourseVO t);

	//수강색 삭제 비활성화
	public List<AdminCourseVO> adminStuDisable(AdminCourseVO t);

	//수강생 삭제
	public int adminStuDel(AdminCourseVO t);

	//수강생 수정
	public int adminStuModify(AdminCourseVO t);

	
	//수강생 개설과정 등록
	public int adminStuCourseAdd(AdminCourseVO t);

	//수강생 개설과정 등록을 위한 목록
	public List<AdminCourseVO> adminStuCourseAddList(AdminCourseVO t);

	//수강생이 듣고 있는 과정 체크용
	public List<AdminCourseVO> adminStuCourseAddListCheck(AdminCourseVO t);

	public List<AdminCourseVO> adminStuCourseAddListCheck2(AdminCourseVO t);

	//수강생 관리 > 수강 이력
	public List<AdminCourseVO> adminStuListCourse(AdminCourseVO t);
	//체크
	public List<AdminCourseVO> adminStuListCourseCheck(AdminCourseVO t);

	//중도탈락
	public int adminStuFailAdd(AdminCourseVO t);

}

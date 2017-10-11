package com.mgr.dao.admin;

import java.util.List;

import com.mgr.dto.AdminBasicVO;
import com.mgr.dto.AdminCourseVO;
import com.mgr.dto.AdminTeachVO;

public interface AdminCourseDAO {

	//개설과정 리스트
	public List<AdminCourseVO> adminCourseList(AdminCourseVO t);

	//개설과정 등록
	public int adminCourseAdd(AdminCourseVO t);

	//////////
	//등록 과정
	public List<AdminBasicVO> adminCourseAddList1();

	//등록 강의실
	public List<AdminBasicVO> adminCourseAddList2();
//////////

	//개설과정삭제
	public int adminCourseDel(AdminCourseVO t);

	//개설과정수정
	public int adminCourseModify(AdminCourseVO t);

	//개설과정 > 수강생 명단
	public List<AdminCourseVO> adminCourseStu(AdminCourseVO t);

	//개설과정 > 수강생 총인원수
	public int adminCourseStuTotal(AdminCourseVO t);

	
	//개설과목 리스트
	public List<AdminCourseVO> adminOpenSub(AdminCourseVO t);

	//////////////////
	
	public List<AdminBasicVO> adminBasicSub();

	public List<AdminBasicVO> adminBasicBook();


	//개설과목 등록을 위한 강사 정보 가져오기
	public List<AdminTeachVO> adminSubAddListTeach(String subject_id);

	//개설과목 등록
	public int adminOpenSubadd(AdminCourseVO t);

	//개설과목 삭제 체크
	public List<AdminCourseVO> adminSubDelCheck(AdminCourseVO t);

	//개설과목 삭제
	public int adminOpenSubDel(AdminCourseVO t);

	//개설과목 수정
	public int adminOpenSubModify(AdminCourseVO t);
	
	
	//////////////////


}

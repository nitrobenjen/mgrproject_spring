package com.mgr.dao.admin;

import java.util.List;

import com.mgr.dto.AdminBasicVO;
import com.mgr.dto.AdminTeachVO;

public interface AdminBasicDAO {

	
	public List<AdminBasicVO> adminBasicCourseList(AdminBasicVO t);
	
	//과정 등록
	public int adminbasiccourseadd(AdminBasicVO t);

	//과정 수정
	public int adminBasicCourseModify(AdminBasicVO t);

	//과정 삭제
	public int adminBasicCourseDel(AdminBasicVO t);
	
	// 과정 삭제 비활성화 체크, 개설과정과 연결되있는지 확인
	public List<AdminBasicVO> adminBasicCourseCheck(AdminBasicVO t);
	
	//과목 리스트
	public List<AdminBasicVO> adminBasicSubList(AdminBasicVO t);
	
	//과목 삭제 비활성화 개설과목
	public List<AdminBasicVO> adminBasicSubDisable1(AdminBasicVO t);
	
	
	//과목 삭제 비활성화 강의가능과목
	public List<AdminBasicVO> adminBasicSubDisable2(AdminBasicVO t);

	//과목 등록
	public int adminBasicSubAdd(AdminBasicVO t);

	//과목 삭제
	public int adminBasicSubDel(AdminBasicVO t);

	//과목 수정
	public int adminBasicSubModify(AdminBasicVO t);

	
	
	
	//교재 등록
	public int adminBasicBookAdd(AdminBasicVO t);

	//교재 목록
	public List<AdminBasicVO> adminBasicBookList(AdminBasicVO t);

	//교재 수정, 삭제 비활성화 체크
	public List<AdminBasicVO> adminBasicBookCheck(AdminBasicVO t);

	//교재 삭제
	public int adminBasicBookDel(AdminBasicVO t);

	//교재 수정
	public int adminBasicBookModify(AdminBasicVO t);

	
	
	//강의실 등록
	public int adminBasicClassAdd(AdminBasicVO t);

	//강의실 목록
	public List<AdminBasicVO> adminBasicClassList(AdminBasicVO t);

	//강의실 수정 비활성화
	public List<AdminBasicVO> adminBasicClassDisable1(AdminBasicVO t);

	//강의실 삭제 비활성화
	public List<AdminBasicVO> adminBasicClassDisable2(AdminBasicVO t);

	//강의실 삭제
	public int adminBasicClassDel(AdminBasicVO t);

	//강의실 수정
	public int adminBasicClassModify(AdminBasicVO t);
	
	

}

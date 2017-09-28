package com.mgr.service;

import java.util.List;

import com.mgr.dto.AdminTeachVO;

public interface AdminService {
	
	// 강사 전체 목록
	public List<AdminTeachVO> adminTeachListAll(String currentpage2);

	// 강사 강의가능한 과목 출력
	public List<AdminTeachVO> adminTeachSublist(String teacher_id);

	// 특정 강사 선택해제 불가능한 과목 목록
	public List<AdminTeachVO> adminTeachNocheck(String value);

	// 강사 강의가능과목 수정을 위한 과목 삭제
	public int adminTeachDelsub(String teacher_id);

	// 강사 기본정보 수정
	public int adminTeachModifyinfo(AdminTeachVO t);
	
	// 전체 과목 목록
	public List<AdminTeachVO> adminBasicsublist(String teacher_id);

}

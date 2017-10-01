package com.mgr.service.admin;

import java.util.List;

import com.mgr.dto.AdminTeachVO;

public interface AdminTeachService {
	
	// 강사 전체 목록
	public List<AdminTeachVO> adminTeachListAll(String currentpage2, AdminTeachVO t);

	// 강사 강의가능한 과목 출력
	public List<AdminTeachVO> adminTeachSublist(String teacher_id);

	// 특정 강사 선택해제 불가능한 과목 목록
	public List<AdminTeachVO> adminTeachNocheck(String value);

	// 강사 강의가능과목 수정을 위한 과목 삭제
	public int adminTeachDelsub(String teacher_id);

	// 강사 기본정보 수정
	public int adminTeachModifyinfo(AdminTeachVO t);
	
	// 전체 과목 목록(선택 비활성화 함께)
	public List<AdminTeachVO> adminBasicsublist(String teacher_id);
	
	// 전체 과목 목록(기초정보)
	public List<AdminTeachVO> adminBasicsublist();
	
	// 강사 등록
	public int adminteachadd(AdminTeachVO t);
	
	// 강사 삭제
	public int adminteachdel(String teacher_id);
	
	
	

}

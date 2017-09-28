package com.mgr.dao;

import com.mgr.dto.*;
import java.util.*;

public interface AdminDAO {

	// 강사 전체 목록
	public List<AdminTeachVO> adminTeachListAll();

	// 강사 강의가능한 과목 출력
	public List<AdminTeachVO> adminTeachSublist(String teacher_id);

	// 특정 강사 선택해제 불가능한 과목 목록
	public List<AdminTeachVO> adminTeachNocheck(String teacher_id);

	// 강사 강의가능과목 수정을 위한 과목 삭제
	public int adminTeachDelsub(String teacher_id);

	// 강사 기본정보 수정
	public int adminTeachModifyinfo(AdminTeachVO t);
	
	// 전체 과목 목록
	public List<AdminTeachVO> adminBasicsublist();
	
	//강의가능한목록 삽입
	public int adminTeachsubInsert(AdminTeachVO t);
	
	

}

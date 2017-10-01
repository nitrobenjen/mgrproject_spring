package com.mgr.dao.admin;

import com.mgr.dto.*;
import java.util.*;

public interface AdminTeachDAO {

	
	//////////////////강사 계정 관리//////////////////////////////
	// 강사 전체 목록
	public List<AdminTeachVO> adminTeachListAll(AdminTeachVO t);

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
	
	//트랜잭션 처리를 위한 강사 id 가져오기
	public String adminTeachId();
	
	// 강사 기본정보 등록
	public int adminTeachadd(AdminTeachVO t);
	
	// 강사 관리 삭제 비활성화 체크, 개설과목과 연결되있는지 확인
	public List<AdminTeachVO> adminTeachdisable1(AdminTeachVO t);
	
	
	// 강사 관리 삭제 비활성화 체크, 강의가능과 연결되있는지 확인
	public List<AdminTeachVO> adminTeachdisable2(AdminTeachVO t);
	
	// 강사 삭제
	public int adminTeachDel(String teacher_id);
	
//////////////////강사 계정 관리 끝//////////////////////////////

}

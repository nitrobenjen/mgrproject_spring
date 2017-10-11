package com.mgr.service.admin;

import java.util.*;

import com.mgr.dto.AdminBasicVO;

public interface AdminBasicService {
	
	//과정 출력
	public List<AdminBasicVO> adminBasicCourseList(AdminBasicVO t);
	
	//과정 입력
	public int adminbasiccourseadd(AdminBasicVO t);

	//과정 수정
	public int adminBasicCourseModify(AdminBasicVO t);

	//과정 삭제
	public int adminBasicCourseDel(AdminBasicVO t);
	
	
	//과목 출력
	public List<AdminBasicVO> adminBasicSubList(AdminBasicVO t);

	//과목 입력
	public int adminBaisicSubadd(AdminBasicVO t);

	//과목 삭제
	public int adminBasicSubDel(AdminBasicVO t);

	//과목 수정
	public int adminBasicSubModify(AdminBasicVO t);

	
	//교재 등록 검색
	public String adminBookAPI(AdminBasicVO t);

	//교재 등록
	public int adminBaisicBookAdd(AdminBasicVO t);

	//교재 리스트
	public List<AdminBasicVO> adminBasicBookList(AdminBasicVO t);

	//교재 수정
	public int adminBasicBookModify(AdminBasicVO t);

	//교재 삭제
	public int adminBasicBookDel(AdminBasicVO t);

	//강의실 등록
	public int adminBaisicClassadd(AdminBasicVO t);

	//강의실 리스트
	public List<AdminBasicVO> adminBasicClassList(AdminBasicVO t);

	//강의실 삭제
	public int adminBasicClassDel(AdminBasicVO t);

	//강의실 수정
	public int adminBasicClassModify(AdminBasicVO t);

}

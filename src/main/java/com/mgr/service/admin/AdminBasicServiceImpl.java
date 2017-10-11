package com.mgr.service.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mgr.dao.admin.AdminBasicDAO;
import com.mgr.dto.AdminBasicVO;
import com.mgr.util.*;

@Service
public class AdminBasicServiceImpl implements AdminBasicService {

	@Autowired
	private AdminBasicDAO dao;

	@Override
	public List<AdminBasicVO> adminBasicCourseList(AdminBasicVO t) {
		List<AdminBasicVO> result = dao.adminBasicCourseList(t);
		List<AdminBasicVO> disblecheck1 = dao.adminBasicCourseCheck(t);

		for (int i = 0; i < result.size(); i++) {
			for (int j = 0; j < disblecheck1.size(); j++) {
				if (result.get(i).getCourse_id().equals(disblecheck1.get(j).getCourse_id())) {
					result.get(i).setCheck("disabled");
					break;
				}
			}
		}

		return result;
	}

	@Override
	public int adminbasiccourseadd(AdminBasicVO t) {
		int result = 100;

		try {
			dao.adminbasiccourseadd(t);

		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int adminBasicCourseModify(AdminBasicVO t) {
		int result = 100;

		try {
			dao.adminBasicCourseModify(t);

		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int adminBasicCourseDel(AdminBasicVO t) {
		int result = 100;

		try {
			dao.adminBasicCourseDel(t);

		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	/////////////// 과목///////////////////////////////
	@Override
	public List<AdminBasicVO> adminBasicSubList(AdminBasicVO t) {
		List<AdminBasicVO> result = dao.adminBasicSubList(t);
		List<AdminBasicVO> disblecheck1 = dao.adminBasicSubDisable1(t);
		List<AdminBasicVO> disblecheck2 = dao.adminBasicSubDisable2(t);

		disblecheck1.addAll(disblecheck2);

		List<String> disblecheck = new ArrayList<String>();
		for (int i = 0; i < disblecheck1.size(); i++) {
			disblecheck.add(disblecheck1.get(i).getSubject_id());
		}

		HashSet<String> hs = new HashSet<String>(); // 중복 제거
		hs.addAll(disblecheck);
		disblecheck.clear();
		disblecheck.addAll(hs);

		for (int i = 0; i < result.size(); i++) {
			for (int j = 0; j < disblecheck.size(); j++) {
				if (result.get(i).getSubject_id().equals(disblecheck.get(j))) {
					result.get(i).setCheck("disabled");
					break;
				}
			}
		}

		return result;
	}

	@Override
	public int adminBaisicSubadd(AdminBasicVO t) {
		int result = 100;

		try {
			dao.adminBasicSubAdd(t);

		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int adminBasicSubDel(AdminBasicVO t) {
		int result = 100;

		try {
			dao.adminBasicSubDel(t);

		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int adminBasicSubModify(AdminBasicVO t) {
		int result = 100;

		try {
			dao.adminBasicSubModify(t);

		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	/////////////// 과목 끝///////////////////////////////
	///////////// 교재/////////////////////////////
	@Override
	public String adminBookAPI(AdminBasicVO t) {
		BookSearch m = new BookSearch();
		String result = "";
		int start = t.getStart();

		if (start == 0) {
			start = 1;
		}

		try {

			result = m.bookimgname(t.getBook_name(), start);

		} catch (IOException e) {

			e.printStackTrace();
		}
		return result;
	}

	// 교재 등록
	@Override
	public int adminBaisicBookAdd(AdminBasicVO t) {
		int result = 100;

		try {
			dao.adminBasicBookAdd(t);

		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	// 교재 목록
	@Override
	public List<AdminBasicVO> adminBasicBookList(AdminBasicVO t) {
		List<AdminBasicVO> result = dao.adminBasicBookList(t);

		List<AdminBasicVO> disblecheck1 = dao.adminBasicBookCheck(t);

		for (int i = 0; i < result.size(); i++) {
			for (int j = 0; j < disblecheck1.size(); j++) {
				if (result.get(i).getBook_id().equals(disblecheck1.get(j).getBook_id())) {
					result.get(i).setCheck("disabled");
					break;
				}
			}
		}

		return result;
	}

	// 교재 수정
	@Override
	public int adminBasicBookModify(AdminBasicVO t) {
		int result = 100;

		try {
			dao.adminBasicBookModify(t);

		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int adminBasicBookDel(AdminBasicVO t) {
		int result = 100;

		try {
			dao.adminBasicBookDel(t);

		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	//////////강의실 시작 //////////////
	//강의실 등록
	@Override
	public int adminBaisicClassadd(AdminBasicVO t) {
		int result = 100;

		try {
			dao.adminBasicClassAdd(t);

		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	//강의실목록
	@Override
	public List<AdminBasicVO> adminBasicClassList(AdminBasicVO t) {
		List<AdminBasicVO> result = dao.adminBasicClassList(t);
		List<AdminBasicVO> disblecheck1 = dao.adminBasicClassDisable1(t);
		List<AdminBasicVO> disblecheck2 = dao.adminBasicClassDisable2(t);

		disblecheck1.addAll(disblecheck2);

		List<String> disblecheck = new ArrayList<String>();
		for (int i = 0; i < disblecheck1.size(); i++) {
			disblecheck.add(disblecheck1.get(i).getClass_id());
		}

		HashSet<String> hs = new HashSet<String>(); // 중복 제거
		hs.addAll(disblecheck);
		disblecheck.clear();
		disblecheck.addAll(hs);

		for (int i = 0; i < result.size(); i++) {
			for (int j = 0; j < disblecheck.size(); j++) {
				if (result.get(i).getClass_id().equals(disblecheck.get(j))) {
					result.get(i).setCheck("disabled");
					break;
				}
			}
		}

		return result;
	}

	//강의실 삭제
	@Override
	public int adminBasicClassDel(AdminBasicVO t) {
		int result = 100;

		try {
			dao.adminBasicClassDel(t);

		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	//강의실 수정
	@Override
	public int adminBasicClassModify(AdminBasicVO t) {
		int result = 100;

		try {
			dao.adminBasicClassModify(t);

		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}
	
	

}

package com.mgr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mgr.dto.AdminTeachVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSession session;

	private static String namespace = "com.management.mapper.AdminMapper";

	
	

	@Override
	public List<AdminTeachVO> adminTeachListAll() {
		List<AdminTeachVO> result = session.selectList(namespace + ".adminTeachListAll");
		return result;
	}


	@Override
	public List<AdminTeachVO> adminTeachSublist(String teacher_id) {
		List<AdminTeachVO> result = session.selectList(namespace + ".adminTeachSublist", teacher_id);
		return result;
	}


	@Override
	public List<AdminTeachVO> adminTeachNocheck(String teacher_id) {
		List<AdminTeachVO> result = session.selectList(namespace + ".adminTeachNocheck", teacher_id);
		return result;
	}


	@Override
	public int adminTeachDelsub(String teacher_id) {
		session.selectList(namespace + ".adminTeachDelsub", teacher_id);
		return 0;
	}


	@Override
	public int adminTeachModifyinfo(AdminTeachVO t) {
		session.selectList(namespace + ".adminTeachModifyinfo", t);
		return 0;
	}


	@Override
	public List<AdminTeachVO> adminBasicsublist() {
		List<AdminTeachVO> result = session.selectList(namespace + ".adminBasicSubList");
		return result;
	}


	@Override
	public int adminTeachsubInsert(AdminTeachVO t) {
		session.insert(namespace + ".adminTeachsubInsert", t);
		return 0;
	}
	
	

}

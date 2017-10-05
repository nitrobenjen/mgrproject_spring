package com.mgr.dao.login;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mgr.dto.LoginVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.management.mapper.LoginMapper";
	
	@Override
	public LoginVO LoginInfo(LoginVO t) {
		LoginVO result = session.selectOne(namespace+".LoginInfo", t);
		return result;
	}

}

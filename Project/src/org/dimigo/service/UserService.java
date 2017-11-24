package org.dimigo.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.dimigo.dao.UserDao;
import org.dimigo.vo.UserVO;

public class UserService extends AbstractService{

	public UserVO login(UserVO user) throws Exception {
		//DB에서 id, pwd 조회
		
		Connection conn = null;
		try {
			conn = getConnection();
			UserDao dao = new UserDao(conn);
			UserVO result = dao.serachUser(user);
			return result;
		} finally {
			if(conn!=null)conn.close();
		}
	}
	
	public List<UserVO> searchUserList() throws Exception {
		List<UserVO> array = new ArrayList<UserVO>();
		array.add(new UserVO("aaa@naver.com", "톰크루즈", "배우아저씨"));
		array.add(new UserVO("bbb@naver.com", "제프리힌튼", "교수아저씨"));
		array.add(new UserVO("ccc@naver.com", "에드시런", "가수아저씨"));
		return array;
	}
	
	public void signup(UserVO user) throws Exception{
		Connection conn = null;
		try {
			conn = getConnection();
			UserDao dao = new UserDao(conn);
			UserVO result = dao.serachUserById(user);
			if(result!=null) {
				throw new Exception("이미 사용중인 아이디입니다");
			}
			dao.insertUser(user); //사용중인 아이디가 아니면 DB에 집어넣음
		} finally {
			if(conn!=null)conn.close();
		}
	}

	public void diary(String diary, String title) throws Exception{
		Connection conn = null;
		try {
			conn = getConnection();
			UserDao dao = new UserDao(conn);
			dao.insertDiary(diary, title);
		}finally {
			if(conn!=null)conn.close();
		}
	}
	public List getDiary(List list) throws Exception{
		Connection conn = null;
		try {
			conn = getConnection();
			UserDao dao = new UserDao(conn);
			list = dao.searchDiary();
			return list;
		}finally {
			if(conn!=null)conn.close();
		}
	}
	public List<String> getCalendar(List<String> list) throws Exception{
		Connection conn = null;
		try {
			conn = getConnection();
			UserDao dao = new UserDao(conn);
			list = dao.getCalendar();
			return list;
		}finally {
			if(conn!=null)conn.close();
		}
	}
	public void insertCal(String text, String date) throws Exception{
		Connection conn = null;
		try {
			conn = getConnection();
			UserDao dao = new UserDao(conn);
			dao.insertCal(text, date);
		}finally {
			if(conn!=null)conn.close();
		}
	}
	public void deleteCal(String name) throws Exception{
		Connection conn = null;
		try {
			conn = getConnection();
			UserDao dao = new UserDao(conn);
			dao.deleteCal(name);
		}finally {
			if(conn!=null)conn.close();
		}
	}
	public void delete2Cal(String name) throws Exception{
		Connection conn = null;
		try {
			conn = getConnection();
			UserDao dao = new UserDao(conn);
			dao.delete2Cal(name);
		}finally {
			if(conn!=null)conn.close();
		}
	}
	

}

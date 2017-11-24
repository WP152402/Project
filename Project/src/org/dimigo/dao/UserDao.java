package org.dimigo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.dimigo.vo.UserVO;
import project.dimiog.user.DiaryList;

public class UserDao {
	private Connection conn = null;
	public UserDao(Connection conn) {
		this.conn = conn;
	}

	public UserVO serachUser(UserVO vo) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM USER WHERE ID=? AND PWD=?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getId()); //물음표 안에 값을 넣어줌
			pstmt.setString(2, vo.getPwd());
			
			rs = pstmt.executeQuery(); //쿼리를 수행하여라
			UserVO result = null;
			if(rs.next()) {
				result = new UserVO();
				result.setId(rs.getString(1));
				result.setName(rs.getString(3));
				result.setNickname(rs.getString(4));
				
			}
			return result;
		} catch (Exception e) {
			throw new Exception("로그인시 오류 발생");
		}finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
		}
	}
	public UserVO serachUserById(UserVO vo) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM USER WHERE ID=?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getId()); //물음표 안에 값을 넣어줌
			
			rs = pstmt.executeQuery(); //쿼리를 수행하여라
			UserVO result = null;
			if(rs.next()) {
				result = new UserVO();
				result.setId(rs.getString(1));
				result.setName(rs.getString(3));
				result.setNickname(rs.getString(4));
				
			}
			return result;
		} catch (Exception e) {
			throw new Exception("오류 발생");
		}finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
		}
	}
	public void insertUser(UserVO vo) throws Exception {
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO USER VALUES(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getId()); //물음표 안에 값을 넣어줌
			pstmt.setString(2, vo.getPwd()); //물음표 안에 값을 넣어줌
			pstmt.setString(3, vo.getName()); //물음표 안에 값을 넣어줌
			pstmt.setString(4, vo.getNickname()); //물음표 안에 값을 넣어줌
			
			//executeQuery : SELCET
			//extcuteUpdate : INSET, UPDATE, DELETE
			int cnt = pstmt.executeUpdate();
			if(cnt==0)throw new Exception("회원 가입에 실패하였습니다");
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("회원가입 시 오류가 발생했습니다");
		}finally {
			if(pstmt!=null)pstmt.close();
		}
	}
	public void insertDiary(String diary, String title) throws Exception{
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO DIARY VALUES(?,?,?)";
		Calendar cal = Calendar.getInstance();
		//현재 년도, 월, 일
		int year = cal.get ( cal.YEAR );
		int month = cal.get ( cal.MONTH ) + 1 ;
		int date = cal.get ( cal.DATE );
		String date2 = year+"년 "+month+"월 "+date+"일";
		System.out.println(date2);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, diary);
			pstmt.setString(3, date2);
			int cnt = pstmt.executeUpdate();
			if(cnt==0)throw new Exception("일기 등록에 오류 발생");
		}catch(Exception e) {
			e.printStackTrace();
			throw new Exception("알 수 없는 오류 발생 in Diary");
		}finally {
			if(pstmt!=null)pstmt.close();
		}
	}
	public List searchDiary() throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM DIARY";
		List<DiaryList> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
		
			rs = pstmt.executeQuery(); //쿼리를 수행하여라
			while(rs.next()) {
				list.add(new DiaryList(rs.getString(1), rs.getString(2), rs.getString(3)));
			}
			return list;
		} catch (Exception e) {
			throw new Exception("오류 발생");
		}finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
		}
	}
	public void insertCal(String text, String date) throws Exception{
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CALENDAR VALUES(?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, text);
			pstmt.setString(2, date);
			int cnt = pstmt.executeUpdate();
			if(cnt==0)throw new Exception("일정 등록에 오류 발생");
		}catch(Exception e) {
			e.printStackTrace();
			throw new Exception("알 수 없는 오류 발생 in Calendar");
		}finally {
			if(pstmt!=null)pstmt.close();
		}
	}

	public List<String> getCalendar() throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT TEXT FROM CALENDAR WHERE DATE=?";
		List<String> list = new ArrayList<>();
		Calendar cal = Calendar.getInstance();
		//현재 년도, 월, 일
		int year = cal.get ( cal.YEAR );
		int month = cal.get ( cal.MONTH ) + 1 ;
		int date = cal.get ( cal.DATE );
		String date2 = year+"-"+month+"-"+date+"";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date2);
			rs = pstmt.executeQuery(); //쿼리를 수행하여라
			while(rs.next()) {
				list.add(new String(rs.getString(1)));
			}
			return list;
		} catch (Exception e) {
			throw new Exception("오류 발생");
		}finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
		}
	}

	public void deleteCal(String name) throws Exception{
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM CALENDAR WHERE TEXT=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			int cnt = pstmt.executeUpdate();
			if(cnt==0)throw new Exception("일정 삭제에 오류 발생");
		}catch(Exception e) {
			e.printStackTrace();
			throw new Exception("알 수 없는 오류 발생 - 일정 삭제");
		}finally {
			if(pstmt!=null)pstmt.close();
		}
	}

	public void delete2Cal(String name) throws Exception{
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM DIARY WHERE TEXT=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			int cnt = pstmt.executeUpdate();
			if(cnt==0)throw new Exception("일기 삭제에 오류 발생");
		}catch(Exception e) {
			e.printStackTrace();
			throw new Exception("알 수 없는 오류 발생 - 일기 삭제");
		}finally {
			if(pstmt!=null)pstmt.close();
		}
	}
}

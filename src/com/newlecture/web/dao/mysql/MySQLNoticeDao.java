package com.newlecture.web.dao.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.newlecture.web.data.dao.NoticeDao;
import com.newlecture.web.data.entity.Member;
import com.newlecture.web.data.entity.Notice;
import com.newlecture.web.data.view.NoticeView;

public class MySQLNoticeDao implements NoticeDao{

	@Override
	public List<NoticeView> getList() {
		return getList(1, "TITLE", "");
	}

	@Override
	public List<NoticeView> getList(int page) {
		return getList(page, "TITLE", "");
	}

	@Override
	public List<NoticeView> getList(int page, String field, String query) {
		String sql = "SELECT * FROM NOTICE_VIEW WHERE BINARY "+field+" LIKE ? LIMIT ?,10"; //데이터에만 ? 사용 가능하기 때문에, title은 "+field+"라고 씀
		List<NoticeView> list = new ArrayList<>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://211.238.142.84/newlecture?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8"; // DB연결
			Connection con = DriverManager.getConnection(url, "newlec", "sclass"); // 드라이브 로드
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, '%'+query+'%');
			st.setInt(2, 10*(page-1));
			
			ResultSet rs = st.executeQuery();
			
			NoticeView notice = null;

			while (rs.next()) {
				notice = new NoticeView();
				notice.setCode(rs.getString("CODE"));
				notice.setTitle(rs.getString("TITLE"));
				notice.setContent(rs.getString("CONTENT"));
				notice.setWriter(rs.getString("WRITER"));
				notice.setRegDate(rs.getDate("REGDATE"));
				notice.setHit(rs.getInt("HIT"));
				//NoticeView 컬럼
				notice.setWriterName(rs.getString("WRITER_NAME"));
				notice.setCommentCount(rs.getInt("COMMENT_COUNT"));
				
				list.add(notice);
			}

			rs.close();
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int getSize() {
		return getSize("TITLE", "");
	}

	@Override
	public int getSize(String field, String query) {
		String sql = "SELECT COUNT(CODE) SIZE FROM NOTICE WHERE BINARY "+field+" LIKE ?"; //NOTICE_VIEW로 하게되면 JOIN한 결과도 검색됨
		int size = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://211.238.142.84/newlecture?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8"; // DB연결
			Connection con = DriverManager.getConnection(url, "newlec", "sclass"); // 드라이브 로드
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, '%'+query+'%');
			
			ResultSet rs = st.executeQuery();

			if(rs.next())
				size = rs.getInt("SIZE");

			rs.close();
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return size;
	}

	@Override
	public int add(Notice notice) {
//		String sql = "INSERT INTO NOTICE VALUES(?, ?, ?, ?, NOW(), ?);"; //데이터에만 ? 사용 가능하기 때문에, title은 "+field+"라고 씀
//		List<NoticeView> list = new ArrayList<>();
//		
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			
//			String url = "jdbc:mysql://211.238.142.84/newlecture?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8"; // DB연결
//			Connection con = DriverManager.getConnection(url, "newlec", "sclass"); // 드라이브 로드
//			PreparedStatement st = con.prepareStatement(sql);
//			st.setString(1, '%'+query+'%');
//			
//			ResultSet rs = st.executeQuery();
//			
//			NoticeView nv = null;
//
//			while (rs.next()) {
//				nv = new NoticeView();
//				nv.setCode(rs.getString("CODE"));
//				nv.setTitle(rs.getString("TITLE"));
//				nv.setContent(rs.getString("CONTENT"));
//				nv.setWriter(rs.getString("WRITER"));
//				nv.setRegDate(rs.getDate("REGDATE"));
//				nv.setHit(rs.getInt("HIT"));
//				//NoticeView 컬럼
//				nv.setWriterName(rs.getString("WRITER_NAME"));
//				nv.setCommentCount(rs.getInt("COMMENT_COUNT"));
//				
//				list.add(nv);
//			}
//
//			rs.close();
//			st.close();
//			con.close();
//			
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
		return 0;
	}

	@Override
	public int add(String title, String content, String writer) {
		// TODO Auto-generated method stub
		return 0;
	}

}

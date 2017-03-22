package com.newlecture.web.dao.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.newlecture.web.dao.NoticeFileDao;
import com.newlecture.web.data.entity.Member;
import com.newlecture.web.data.entity.Notice;
import com.newlecture.web.data.entity.NoticeFile;

public class MySQLNoticeFileDao implements NoticeFileDao{


	public List<NoticeFile> getList(String noticeCode) {
		String sql = "SELECT * FROM NOTICE_FILE";
		List<NoticeFile> list = new ArrayList<>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://211.238.142.84/newlecture?autoReconnect=true&amp;useSSL=false"; // DB연결
			Connection con = DriverManager.getConnection(url, "newlec", "sclass"); // 드라이브 로드
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			//Member member = null;
			NoticeFile noticefile=null;
			while (rs.next()) {
				noticefile = new NoticeFile();
				noticefile.setCode("code");
				noticefile.setNoticeCode("noticeCode");
				list.add(noticefile);
				
//				member = new Member();
//				member.setId(rs.getString("ID"));
//				member.setPwd(rs.getString("PWD"));
//
//				list.add(member);
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
	public int add(NoticeFile file) {
		String sql = "INSERT INTO NOTICE_FILE (CODE, SRC, NOTICE_CODE) VALUES(?,?,?)"; // Member가 갖고 있는것을 꽂아넣는 작업

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");			
			String url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl"; 
			Connection con = DriverManager.getConnection(url, "c##sist", "dclass"); 
			
			// Statement st = con.createStatement(); // 꽂아넣는 능력은 없고 실행만 가능
			
			PreparedStatement st = con.prepareStatement(sql);			
			st.setString(1, file.getCode());
			st.setString(2, file.getSrc());
			st.setString(3, file.getNoticeCode());
	

			// 결과가 있는 쿼리 executeQuery()
			// SELECT
			// 결과가 없는 쿼리 executeUpdate()
			// INSERT, UPDATE, DELETE
			int result = st.executeUpdate();
			
			st.close();
			con.close();
			
			return result;
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int add(String src, String noticeCode) {
		NoticeFile noticefile = new NoticeFile();
		noticefile.setSrc(src);
		noticefile.setNoticeCode(noticeCode);	
		return add(noticefile);
	}

}

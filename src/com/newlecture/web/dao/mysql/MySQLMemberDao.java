package com.newlecture.web.dao.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.newlecture.web.dao.MemberDao;
import com.newlecture.web.data.entity.Member;

public class MySQLMemberDao implements MemberDao {

	@Override
	public List<Member> getList(String query) {
		String sql = "SELECT * FROM MEMBER WHERE ID LIKE '%" + query + "%'";
		List<Member> list = new ArrayList<>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://211.238.142.84/newlecture?autoReconnect=true&amp;useSSL=false"; // DB연결
			Connection con = DriverManager.getConnection(url, "newlec", "sclass"); // 드라이브 로드
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			Member member = null;

			while (rs.next()) {
				member = new Member();
				member.setId(rs.getString("ID"));
				member.setPwd(rs.getString("PWD"));

				list.add(member);
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
	public int add(Member member) {
		
		String sql = "INSERT INTO MEMBER(MID,PWD,NAME,PHONE,REGDATE) VALUES(?,?,?,?,SYSDATE)"; // Member가 갖고 있는것을 꽂아넣는 작업
		//List<Member> list = new ArrayList<>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");			
			String url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl"; 
			Connection con = DriverManager.getConnection(url, "c##sist", "dclass"); 
			
			// Statement st = con.createStatement(); // 꽂아넣는 능력은 없고 실행만 가능
			
			PreparedStatement st = con.prepareStatement(sql);			
			st.setString(1, member.getId());
			st.setString(2, member.getPwd());
			st.setString(3, member.getName());
			st.setString(4, member.getPhone());

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
	public Member get(String id) {
		System.out.println(id);
		String sql = "SELECT * FROM MEMBER WHERE ID ='" + id+"'";
		Member member = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://211.238.142.84/newlecture?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8";
			Connection con = DriverManager.getConnection(url, "newlec", "sclass");
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery(sql);

			if (rs.next()) {
				member = new Member();
				member.setId(rs.getString("ID"));
				member.setPwd(rs.getString("PWD"));
			}

			rs.close();
			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}

}

package com.newlecture.web.dao.mysql;

import java.util.List;
import com.newlecture.web.dao.NoticeDao;


public class TestProgram {

	public static void main(String[] args) {
		NoticeDao noticeDao = new MySQLNoticeDao();
		List<com.newlecture.web.data.entity.NoticeView> list = noticeDao.getList();
		
		for (com.newlecture.web.data.entity.NoticeView view : list) {
			System.out.println(view.getTitle());
		}
		
	}

}

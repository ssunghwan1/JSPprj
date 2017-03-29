package com.newlecture.web.controller.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tiles.TilesContainer;
import org.apache.tiles.access.TilesAccess;
import org.apache.tiles.request.ApplicationContext;

import com.newlecture.web.dao.NoticeDao;
import com.newlecture.web.dao.mysql.MySQLNoticeDao;
import com.newlecture.web.data.entity.NoticeView;

@WebServlet("/customer/notice")
public class NoticeController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// .../notice.jsp?p=5 -->  ==>> .../notice.jsp?p=5&?&? (3가지가 필요!)
		String _page = request.getParameter("p");
		String _field = request.getParameter("f");
		String _query = request.getParameter("q");

		int p = 1;
		String field = "TITLE";
		String query = "";

		if (_page != null && !_page.equals("")) //값이 넘겨진 것이 있다면 && 
			p = Integer.parseInt(_page);

		if (_field != null && !_field.equals("")) //값이 넘겨진 것이 있다면 && 
			field = _field;

		if (_query != null && !_query.equals("")) //값이 넘겨진 것이 있다면 && 
			query = _query;

		NoticeDao noticeDao = new MySQLNoticeDao();
		List<NoticeView> list = noticeDao.getList(p, field, query);

		int size = noticeDao.getSize(field, query);

		request.setAttribute("list", list);
		request.setAttribute("size", size);
		
		request.getRequestDispatcher("notice.jsp").forward(request, response);
		
/*		TilesContainer container = TilesAccess.getContainer((ApplicationContext) request.getServletContext());
		container.render("customer.notice", request, response);
		container.endContext(request, response);*/
	}
}

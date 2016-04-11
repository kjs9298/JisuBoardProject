package com.board.action;

import com.board.controller.CommandAction;
import com.board.dao.BoardDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by jisukim on 2016. 4. 7..
 */
public class DeleteAction implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int idx = 0;
		if(request.getParameter("idx") != null){
			idx = Integer.parseInt(request.getParameter("idx"));
		}

		BoardDao.getInstance().deleteArticle(idx);

		return "delete.jsp";
	}
}

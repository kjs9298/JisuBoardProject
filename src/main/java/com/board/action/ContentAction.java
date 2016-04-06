package com.board.action;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by jisukim on 2016. 4. 7..
 */
public class ContentAction implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		/*String idx = request.getParameter("idx");

		Board article = BoardDao.getInstance().getArticle(Integer.parseInt(idx));
		request.setAttribute("article", article);*/

		return "content.jsp";
	}
}
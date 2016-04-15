package com.board.action;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 * Created by jisukim on 2016. 4. 7..
 */
public class AjaxListAction implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		int page = 0;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}

		ArrayList<Board> articleList = BoardDao.getInstance().getArticleList(page);
		request.setAttribute("articleList", articleList);       // 아직 뷰의 포워드라는 말을 잘 모르겠음..
		request.setAttribute("page", page);
		return "ajaxList.jsp";
	}
}

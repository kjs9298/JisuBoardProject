package com.board.action;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.regex.Pattern;

/**
 * Created by jisukim on 2016. 4. 7..
 */
public class InsertAction implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");

		MultipartRequest multi = null;

		int sizeLimit = 10 * 1024 * 1024;
		String savePath = request.getRealPath("/upload");

		try{
			multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e){
			e.printStackTrace();
		}

		String filename = multi.getFilesystemName("filename");
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		int count = 0;
		String content = multi.getParameter("content");
		String regip = request.getRemoteAddr();

		if(title == "" ||title == null) System.out.println("title이 null입니다.");

		if(writer == "" ||writer == null) System.out.println("wrtier이 null입니다.");
		else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
			System.out.println("이메일 형식이 아닙니다.");

		if(content == "" ||content == null) System.out.println("content가 null입니다.");

		Board article = new Board();

		article.setRegip(regip);
		article.setTitle(title);
		article.setWriter(writer);
		article.setContent(content);
		article.setCount(count);
		article.setFilename(filename);
		BoardDao.getInstance().insertArticle(article);

		return "insert.jsp";
	}
}
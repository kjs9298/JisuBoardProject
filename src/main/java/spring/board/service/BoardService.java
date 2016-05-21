package spring.board.service;

import com.board.beans.Board;
import com.board.dao.BoardDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;
import spring.board.controller.BoardController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

/**
 * Created by jisukim on 2016. 5. 21..
 */
@Service
public class BoardService extends BoardController {

	@Override
	public ModelAndView listAction(@PathVariable Integer page) throws Exception{
		System.out.println("#### page : " + page);
		ArrayList<Board> articleList = BoardDao.getInstance().getArticleList(page);

		ModelAndView mav = new ModelAndView("list");

		mav.addObject("articleList", articleList);
		mav.addObject("page", page);

		System.out.println("#### list : " + mav.toString());
		return mav;
	}

	@Override
	public ModelAndView insertAction(HttpServletRequest request, @ModelAttribute Board article) throws Exception{

		request.setCharacterEncoding("utf-8");

		MultipartRequest multi = null;
		int sizeLimit = 10 * 1024 * 1024 ;
		String savePath = request.getRealPath("/upload");

		try{
			multi=new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		}catch (Exception e) {
			e.printStackTrace();
		}

		int count = 0;

		article.setRegip(request.getRemoteAddr());
		article.setCount(count);

		BoardDao.getInstance().insertArticle(article);

		return new ModelAndView("insert");
	}
}

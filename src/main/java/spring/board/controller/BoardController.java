package spring.board.controller;

import com.board.beans.Board;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by jisukim on 2016. 5. 21..
 */
@RequestMapping("/board")
@Controller
public abstract class BoardController {

	@RequestMapping("/list/{page}")
	public abstract ModelAndView listAction(@PathVariable Integer page) throws Exception;

	@RequestMapping("/insert")
	public abstract ModelAndView insertAction(HttpServletRequest request, @ModelAttribute Board article) throws Exception;

}

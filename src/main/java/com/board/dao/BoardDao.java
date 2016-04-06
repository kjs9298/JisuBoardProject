package com.board.dao;

import com.board.beans.Board;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by jisukim on 2016. 4. 5..
 */
public class BoardDao extends CommonDao {
	public static BoardDao getInstance(){
		BoardDao _instance = new BoardDao();
		_instance.SetDB();
		return _instance;
	}

	public ArrayList<Board> getArticleList(int page) throws SQLException {
		return  (ArrayList<Board>)GetDB().queryForList("getArticleList", null, page, 10);
	}

	public Board getArticle(int idx) throws SQLException {
		return (Board)GetDB().queryForObject("getArticle", idx);
	}
	/*public void insertArticle(Board article) throws SQLException {
		GetDB().insert("insertArticle", article);
	}*/
}
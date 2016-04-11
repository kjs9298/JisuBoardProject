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

	public Board getTestArticle(int idx) throws SQLException {
		return (Board)GetDB().queryForObject("getTestArticle", idx);
	}
	public void insertArticle(Board article) throws SQLException {
		System.out.println("@@@@@@");
		System.out.println(article.getRegip());
		System.out.println(article.getTitle());
		System.out.println(article.getWriter());
		System.out.println(article.getContent());
		System.out.println(article.getCount());
		System.out.println(article.getFilename());
		System.out.println("@@@@@");
		GetDB().insert("insertArticle", article);
	}

	public void deleteArticle(int idx) throws SQLException {
		//System.out.println("### delete action idx : " + idx);
		GetDB().delete("deleteArticle", idx);
	}

	public void setArticleCount(Board article) throws SQLException {
	/*	System.out.println("### update start " );
		System.out.println("### idx : " +article.getIdx());
		System.out.println("### count : " +article.getCount());
	*/	GetDB().update("setArticleCount", article);
	}
}

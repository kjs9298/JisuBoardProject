package com.board.dao;

import com.board.beans.Board;
import com.board.db.sqlconfig.IBatisDBConnector;
import com.ibatis.sqlmap.client.SqlMapClient;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by jisukim on 2016. 4. 5..
 */
public class CommonDao {
	private SqlMapClient myDB;
	public void SetDB(){
		myDB = IBatisDBConnector.getSqlMapInstance();
	}

	protected SqlMapClient GetDB(){
		return myDB;
	}
}

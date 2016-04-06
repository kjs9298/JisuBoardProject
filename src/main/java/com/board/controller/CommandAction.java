package com.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by jisukim on 2016. 4. 4..
 * 요청 파라미터로 명령어를 전달하는 방식의 인터페이스
 */
public interface CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;
}

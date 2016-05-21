<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <script>
        function onDownload(idx){
            var o = document.getElementById("ifrm_filedown");
            o.src = "download.do?idx=" + idx;
        }
    </script>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>게시판 조회</title>
</head>

<body>
<h1>게시판 조회입니당~~</h1>
<table>
    <tr>
        <th>번호</th>
        <td>${article.idx}</td>
        <th>작성자</th>
        <td>${article.writer}</td>
        <th>IP</th>
        <td>${article.regip}</td>
        <th>등록날짜</th>
        <td>${article.regdate}</td>
        <th>조회수</th>
        <td>${article.count}</td>
    </tr>
    <tr>
        <th colspan="2">제목</th>
        <td colspan="6">${article.title}</td>
    </tr>
    <tr>
        <th colspan="2">내용</th>
        <td colspan="6">${article.content}</td>
    </tr>
    <tr>
        <th colspan="2">파일</th>
        <td colspan="8">
            <a href="#" onclick="onDownload(${article.idx})">${article.filename}</a>
        </td>
    </tr>
</table>
<a href="delete.do?idx=${article.idx}">게시글 삭제</a>
<a href="#" onclick="closeContent()">목록으로</a>
<iframe id = "ifrm_filedown" style = "position:absolute; z-index: 1; visibility: hidden;"></iframe>
</body>
</html>
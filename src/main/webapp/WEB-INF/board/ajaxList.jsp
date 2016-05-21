<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>

<c:forEach items="${articleList}" var="article">
    <tr>
        <td>${article.idx}</td>
        <td><a href="count.do?idx=${article.idx}">${article.title}</a></td>
        <td>${article.writer}</td>
        <td>${article.regdate}</td>
        <td>${article.count}</td>
    </tr>
</c:forEach>

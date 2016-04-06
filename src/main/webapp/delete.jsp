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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>게시판 조회</title>
</head>
<%
    String idx = request.getParameter("idx");
    try {
        String driverName = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf8";

        Class.forName(driverName);
        Connection con = DriverManager.getConnection(url, "root", "1234");
        out.println("MySQL 데이터베이스 db에 성공적으로 접속했습니다.");

        Statement stmt = con.createStatement();
        String sql = "DELETE FROM board WHERE idx=" + idx;
        stmt.executeUpdate(sql);
        con.close();
    } catch (Exception e) {
        out.println("MySQL 데이터베이스 db 접속에 문제가 있습니다. <hr>");
        out.println(e.getMessage());
        e.printStackTrace();
    }

%>
<script>
    alert("게시글이 삭제되었습니다.");
    location.href="redirect.jsp";
</script>

<body>
</body>
</html>
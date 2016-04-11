<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>게시글 쓰기</title>
</head>
<body>
    <form action="insert.do" method="post" onsubmit="return formCheck();">
        제목 : <input type="text" name="title" /> <br/>
        작성자 : <input type="text" name="writer" /><br/>
        날짜 : <input type="text" name="regdate" /><br/>
        내용 : <input type="text" name="content" /><br/>
        <input type="submit" />
    </form>

    <script>
        function formCheck(){
            var title = document.forms[0].title.value;
            var writer = document.forms[0].writer.value;
            var regdate = document.forms[0].regdate.value;
            var content = document.forms[0].content.value;

            if(title == null || title == ""){
                alert('제목을 입력하세요');
                document.forms[0].title.focus();
                return false;
            }
            if(writer == null || writer == ""){
                alert('작성자를 입력하세요');
                document.forms[0].writer.focus();
                return false;
            } else if(writer.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null){
                alert('이메일 형식으로 입력하세요');
                document.forms[0].writer.focus();
                return false;
            }
            if(content == null || writer == ""){
                alert('내용을 입력하세요');
                document.forms[0].content.focus();
                return false;
            }
        }
    </script>
</body>
</html>
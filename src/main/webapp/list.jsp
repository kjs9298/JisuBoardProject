<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>게시판 목록</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>

    <script type="text/javascript">
        function openContent(idx){
            $('.mw_layer').addClass('open');
            $.ajax({
                type: 'post',
                url: 'count.do',
                data: ({idx: idx}),
                success: function (data) {
                    $('#layer').html(data);
                }
            });
        }

        function closeContent(){
            $('.mw_layer').removeClass('open');
        }

        jQuery(function($){
            var layerWindow = $('.mw_layer');

            //ESC event
            $(document).keydown(function (event) {
                if (event.keyCode != 27) return true;
                if (layerWindow.hasClass('open')) {
                    layerWindow.removeClass('open');
                }
                return false;
            })

            //Hide Window
            layerWindow.find('>.bg').mousedown(function(event){
                layerWindow.removeClass('open');
                return false;
            });

        });
    </script>

    <style type="text/css">
        html, body { height:100%; margin:10px;}
        .mw_layer {
            display:none; position:fixed;
            _position:absolute;
            top:0;
            left:0;
            z-index:10000;
            width:100%;
            height:100%
        }
        .mw_layer.open { display:block }
        .mw_layer .bg {
            position:absolute;
            top:0;
            left:0;
            width:100%;
            height:100%;
            background:#000;
            opacity:.5;
            filter:alpha(opacity=50)
        }

        #layer {
            position:absolute;
            top:40%; left:40%;
            width:400px; height:400px;
            margin:-150px 0 0 -194px;
            padding:28px 28px 0 28px;
            border:2px solid #555;
            background:#fff;
            font-size:12px;
            font-family:Tahoma, Geneva, sans-serif;
            color:#767676;
            line-height:normal;
            white-space:normal
        }

    </style>

</head>

<body>
<h1>게시판 만들겠음</h1>
<table>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록날짜</th>
        <th>조회수</th>
    </tr>
    <c:forEach items="${articleList}" var="article">
        <tr>
            <td><a href="#layer" onclick="openContent('${article.idx}')">${article.idx}</a></td>
            <td><a href="count.do?idx=${article.idx}">${article.title}</a></td>
            <td>${article.writer}</td>
            <td>${article.regdate}</td>
            <td>${article.count}</td>
        </tr>
    </c:forEach>
</table>

<input type="hidden" name="page" id="page" value="${page}">
<a href="#" onclick="loadNextPage()">더보기</a>

<script>
    function loadNextPage(){
        var page=$('#page').val();
        page=parseInt(page);
        page += 10;

        $.ajax({
            type:'post',
            url:'ajaxList.do',
            data:({page:page}),
            success:function(data){
                $('table').append(data);
                $('#page').val(page);
            }
        });
    }
</script>

</br><a href = "write.jsp">글쓰기</a>
<div class="mw_layer">
    <div class="bg"></div>
    <div id="layer"></div>
</div>

</body>
</html>
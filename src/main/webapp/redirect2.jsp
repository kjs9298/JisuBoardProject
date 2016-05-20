<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>

<script>

    $.ajax({
        type:'post',
        url:'${url}',
        success:function(data){
            $('#content').html(data);
        }
    });


</script>
<div id="content">
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
        $(document).ready(function () {
            $("ul[id*=myid] li").click(function () {
                alert($(this).html()); // gets innerHTML of clicked li
                alert($(this).text()); // gets text contents of clicked li
            });
        });
</script>
</head>
<body>

<ul id='myid'>
        <li id='1'>First</li>
        <li id='2'>Second</li>
        <li id='3'>Third</li>
        <li id='4'>Fourth</li>
        <li id='5'>Fifth</li>
</ul>
</body>
</html>
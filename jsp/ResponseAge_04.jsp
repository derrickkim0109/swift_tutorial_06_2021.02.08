<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>성인 확인 </title>
</head>
<body>
<%
	String STage = request.getParameter("age");
%>
<h1>미성년자 </h1>
	당신의 나이는 <%=STage %>살 이므로 주류 구매가 불가능합니다. <br />
<a href = "ResponseAge_01.jsp" >처음으로 이동 </a>

</body>
</html>
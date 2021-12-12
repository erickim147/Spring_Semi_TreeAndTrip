<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<table >
		<tr>
			<th colspan="5" >예약 현황</th>
		</tr>
		<tr>
			<td>예약번호</td>
			<td>입실날짜</td>
			<td>퇴실날짜</td>
			<td>입실인원</td>
			<td>1박 가격</td>
			<td>예약날짜</td>
		</tr>
		<%-- forEach s --%>
		<c:forEach var="vo" items="${list }">
			<tr>
				<th>${vo.resno }</th>
				<th>${vo.chkin }</th>
				<th>${vo.chkout }</th>
				<th>${vo.pernum }</th>
				<th>${vo.rprice }</th>
				<th>${vo.resdate }</th>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
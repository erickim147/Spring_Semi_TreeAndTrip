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
			<th colspan="5" >���� ��Ȳ</th>
		</tr>
		<tr>
			<td>�����ȣ</td>
			<td>�Խǳ�¥</td>
			<td>��ǳ�¥</td>
			<td>�Խ��ο�</td>
			<td>1�� ����</td>
			<td>���೯¥</td>
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
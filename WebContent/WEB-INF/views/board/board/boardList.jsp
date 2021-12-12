<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>
table {
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

tr {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

td {
	border-bottom: 1px solid #efefef;
	padding: 10px;
}

table .even {
	background: #efefef;
}

.text {
	text-align: center;
	padding-top: 20px;
	color: #000000
}

.text:hover {
	text-decoration: underline;
}

a:link {
	color: #57A0EE;
	text-decoration: none;
}
</style>
<section>
	<h2 align=center>게시판</h2>
	<table align=center>
		<thead align="center">
			<tr>
				<td width="80" align="center">번호</td>
				<td width="500" align="center">제목</td>
				<td width="100" align="center">작성자</td>
				<td width="200" align="center">날짜</td>
				<td width="100" align="center">조회수</td>
			</tr>
		</thead>

		<tbody>

		</tbody>
	</table>

	<input type="button" onclick="location='boardForm'" value="글쓰기">
</section>
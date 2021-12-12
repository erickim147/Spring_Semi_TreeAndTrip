<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
table.type11 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  margin: auto;
  margin-bottom: 50px;
  
}
table.type11 th {
  width: 155px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #dfa974 ;
      text-align: center;
}
table.type11 td {
  width: 155px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
}
</style>

<div class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<span class="resCheck"><a href="resaTotal?hno=${sessionScope.sessionNo }">��������</a></span> <span
						class="resCheck">&nbsp;|&nbsp; </span> <span class="resCheck"><a
						href="resbTotal?hno=${sessionScope.sessionNo }">��������</a></span>
				</div>
			</div>
		</div>
	</div>
</div>

<table class="type11">
  <thead>
  <tr style="text-align: center;">
 	<th scope="cols">�����ȣ</th>
    <th scope="cols">�Խǳ�¥</th>
    <th scope="cols">��ǳ�¥</th>
    <th scope="cols">�Խ��ο�</th>
    <th scope="cols">1�� ����</th>
    <th scope="cols">���೯¥</th>
    <th scope="cols">���̸���</th>
    <th scope="cols">������ó</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="vo" items="${list }">
  <tr>
  	<td>${vo.resno }</td>
    <td>${vo.chkin }</td>
    <td>${vo.chkout }</td>
    <td>${vo.pernum }</td>
    <td>${vo.rprice }</td>
    <td>${vo.resdate }</td>
    <td>${vo.email }</td>
    <td>${vo.pnum }</td>
  </tr>
  </c:forEach>

  </tbody>
</table>

 
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	background: #dfa974;
	text-align: center;
}

table.type11 td {
	width: 155px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #eee;
}

span:hover {
	color: #DFA974;
}

#submitInput {
	width: 100px;
	height: 40px;
	margin-bottom: 20px;
	color: #DFA974;
	font-weight: 700;
}
</style>
<div
	style="display: flex; justify-content: center; margin: 20px 0px 20px 0px;">
	<h2>��� �Ⱓ ��ȸ</h2>
</div>
<form action="searchSales?hno=${sessionScope.sessionNo }" method="post">
	<div
		style="display: flex; justify-content: center; margin: 20px 0px 50px 0px;">
		<input type="text" class="searchInDate" id="searchInDate"
			name="searchIn" style="margin-right: 15px;" value="${searchIn}">
		<span>~</span> <input type="text" class="searchOutDate"
			id="searchOutDate" name="searchOut" style="margin-left: 15px;"
			value="${searchOut}"> <input type="hidden" name="hno"
			value="${hno }">
	</div>
	<div
		style="display: flex; justify-content: center; margin: 10px 0px 0px 0px;">
		<input type="submit" value="��ȸ">
	</div>
</form>

<div class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<span class="resCheck" id="restotal" style="cursor: pointer;">�������</span>
					<span class="resCheck">&nbsp;|&nbsp; </span> <span class="resCheck"
						id="salestotal" style="cursor: pointer;">�������</span> <span
						class="resCheck">&nbsp;|&nbsp; </span> <span class="resCheck"
						id="locationtotal" style="cursor: pointer;">���������</span>
				</div>
			</div>
		</div>
	</div>
</div>

<table class="type11" id="salesTotalTable">
	<thead>
		<tr style="text-align: center;">
			<th scope="cols">���� �Ǽ�</th>
			<th scope="cols">�Ǵ� ��� �����</th>
			<th scope="cols">�� �����</th>

		</tr>
	</thead>
	<tbody>
		<tr>
			<td style="font-weight: 700;">${reserNum}��</td>
			<td style="font-weight: 700;">�� ${averagePrice }</td>
			<td style="font-weight: 700;">�� ${totalPrice }</td>
		</tr>
	</tbody>
</table>

<table class="type11" id="reserTotalTable">
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
		<c:forEach var="rtvo" items="${resList }">
			<tr>
				<td>${rtvo.resno }</td>
				<td>${rtvo.chkin }</td>
				<td>${rtvo.chkout }</td>
				<td>${rtvo.pernum }</td>
				<td>${rtvo.rprice }</td>
				<td>${rtvo.resdate }</td>
				<td>${rtvo.email }</td>
				<td>${rtvo.pnum }</td>
			</tr>
		</c:forEach>

	</tbody>
</table>

<table class="type11" id="locationTotalTable">
	<thead>
		<tr style="text-align: center;">
			<th scope="cols">����</th>
			<th scope="cols">����Ǽ�</th>

		</tr>
	</thead>
	<tbody>
		<c:forEach var="e" items="${locationMap }">
			<tr>
				<td style="font-weight: 700;">${e.key }</td>
				<td style="font-weight: 700;">${e.value }��</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$('#salesTotalTable').hide()
	$('#salestotal').click(function() {
		$('#reserTotalTable').hide()
		$('#locationTotalTable').hide();
		$('#salesTotalTable').show();
	});
	
	$('#reserTotalTable').hide()
	$('#restotal').click(function() {
		$('#salesTotalTable').hide();
		$('#locationTotalTable').hide();
		$('#reserTotalTable').show();
	});
	
	$('#locationTotalTable').hide()
	$('#locationtotal').click(function() {
		$('#salesTotalTable').hide();
		$('#reserTotalTable').hide();
		$('#locationTotalTable').show();
		
	});
</script>
<script>
	$(function() {
		$.datepicker.setDefaults($.datepicker.regional["ko"]);
		$("#searchInDate").datepicker({
			showOn : "both",
			buttonImageOnly : true,
			buttonText : "��¥����",
			dateFormat : "yy-mm-dd",
			changeMonth : true,
		});

		$("#searchOutDate").datepicker({
			showOn : "both",
			buttonImageOnly : true,
			buttonText : "��¥����",
			dateFormat : "yy-mm-dd",
			changeMonth : true,
		});
	});
</script>

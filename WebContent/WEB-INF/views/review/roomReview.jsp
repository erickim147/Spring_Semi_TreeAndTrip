<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="rd-reviews">
<div style="text-align: center; margin-bottom: 40px;">

	   <table style="margin-left: 670px; width: 600px; height: auto;">
	   <tr><h1 style="color: #DFA974;">���� ����</h1></tr>
	     <tr style="border-bottom: solid 2px; color: #DFA974;">
	     <th style="text-align: center;  height: 40px;">�ۼ���</th>&nbsp;
	      <th style="text-align: center">�ı⳻��</th>&nbsp;
	      <th style="text-align: center">�ۼ���</th>&nbsp;
	       <th style="text-align: center">���Һ���</th>&nbsp;
	        </tr>
	     <c:forEach var="rlist" items="${rlist}">
	     <tr >
	     <td>${rlist.name }</td>&nbsp;
	     <td>${rlist.recontent }</td>&nbsp;
	     <td>${rlist.rdate }</td>&nbsp;
	     <td><button type="button"
						onclick="location.href='roomDetail?hno=${rlist.hno }'">���Һ���</button></td>
						 </tr>
	     </c:forEach>
	    
	   
	   </table>
	  
	   </div>
<div style="text-align: center;">
<h1 style="color: #DFA974;">�� ����</h1>

	   <table style="margin-left: 670px; width: 600px; height: auto;">
	     <tr style="border-bottom: solid 2px; color: #DFA974;">
	     <th style="text-align: center;">����ȣ</th>&nbsp;
	      <th style="text-align: center">�� �̸�</th>&nbsp;
	      <th style="text-align: center">����</th>&nbsp;
	       <th style="text-align: center">���ּ�</th>&nbsp;
	        </tr>
	     <c:forEach var="list" items="${list}">
	     <tr >
	     <td>${list.no }</td>&nbsp;
	     <td>${list.name }</td>&nbsp;
	     <td>${list.address }</td>&nbsp;
	       <td>${list.addressdo }</td>&nbsp;
	     </c:forEach>
	    
	   
	   </table>
	  
	  
	   </div>
	   </div>
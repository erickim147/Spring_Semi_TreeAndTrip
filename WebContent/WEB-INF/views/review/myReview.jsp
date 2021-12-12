<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <div class="rd-reviews">
   
       <div style="text-align: center;">
<h1 style="color: #DFA974;">지난 후기</h1>

	   <table style="margin-left: 670px; width: 600px; height: auto;">
	     <tr style="border-bottom: solid 2px; color: #DFA974;">
	      <th style="text-align: center">후기내용</th>&nbsp;
	      <th style="text-align: center">작성일</th>&nbsp;
	       <th style="text-align: center">숙소보기</th>&nbsp;
	        </tr>
	   <c:forEach var="rlist" items="${rlist}">
	     <tr >
	     <td>${rlist.recontent }</td>&nbsp;
	     <td>${rlist.rdate }</td>&nbsp;
	     <td><button type="button"
						onclick="location.href='roomDetail?hno=${rlist.hno }'">숙소보기</button></td>
						 </tr>
	     </c:forEach>
	    
	   
	   </table>
	  
	   </div>
            </div>
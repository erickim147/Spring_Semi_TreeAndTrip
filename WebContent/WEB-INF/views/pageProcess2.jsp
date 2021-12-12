<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.nu a,b {
	float:left;
	padding:4px;
	margin-right:3px;
	width:30px;
	color:#000;
	font:bold 20px tahoma;
	border:1px solid #eee;
	text-decoration:none;
}

b{background-color: #dfa974;
	width:30px;
	color:white; 
	}

.nu a:hover, .nu a:focus {
	color:#fff;
	border:1px solid black;
	background-color:#dfa974;
	


	
</style>   
    
<div class="nu" style="text-align: center; margin: 0 auto;">   
      <!-- 이전페이지  <  -->   
      <c:if test="${paging.startPage != 1 }">
         <a href="${pathVal}?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&location=${location }">&lt;</a>
      </c:if>
      <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b> ${p }</b> <%--현제 페이지 일경우 링크 해제  --%>
            </c:when>
            <c:when test="${p != paging.nowPage }">
               <%-- 다른페이지 링크  --%>
               <a  href="${pathVal}?nowPage=${p }&cntPerPage=${paging.cntPerPage}&location=${location }">${p }</a>
            </c:when>
         </c:choose>
      </c:forEach>
      <!--  다음페이지 > -->
      <c:if test="${paging.endPage != paging.lastPage}">
         <a  href="${pathVal}?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&location=${location }">&gt;</a>
      </c:if>
   </div>
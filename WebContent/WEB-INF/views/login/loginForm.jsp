<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section>
   <div class="booking-continer">
      <div class="booking-form login_form">
         <h3>로그인</h3>
         <form action="loginProcess" method="post">
            <c:if test="${hnoCheck != null}">
               <input type="hidden" name="hno" value="${hnoCheck }">
            </c:if>
            <div class="check-date">
               <label for="" class="font-weight">이메일</label> <input
                  type="email" id="email" name="email">
            </div>
            <div class="check-date">
               <label for="" class="font-weight">비밀번호</label> <input
                  type="password" id="pwd" name="pwd">
            </div>
            <button type="submit" class="submit-btn">확인</button>
         </form>
      </div>
   </div>
</section>
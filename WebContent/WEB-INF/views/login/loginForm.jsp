<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section>
   <div class="booking-continer">
      <div class="booking-form login_form">
         <h3>�α���</h3>
         <form action="loginProcess" method="post">
            <c:if test="${hnoCheck != null}">
               <input type="hidden" name="hno" value="${hnoCheck }">
            </c:if>
            <div class="check-date">
               <label for="" class="font-weight">�̸���</label> <input
                  type="email" id="email" name="email">
            </div>
            <div class="check-date">
               <label for="" class="font-weight">��й�ȣ</label> <input
                  type="password" id="pwd" name="pwd">
            </div>
            <button type="submit" class="submit-btn">Ȯ��</button>
         </form>
      </div>
   </div>
</section>
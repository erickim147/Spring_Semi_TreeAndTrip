<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="breadcrumb-section">
   <div class="container">
      <div class="row">
         <div class="col-lg-12">
            <div class="breadcrumb-text">
               <span class="resCheck"><a href="resMyaTotal?uno=${sessionScope.sessionNo }">예정예약</a></span> <span
                  class="resCheck">&nbsp;|&nbsp; </span> <span class="resCheck"><a
                  href="resMybTotal?uno=${sessionScope.sessionNo }&comment=on">이전예약</a></span>
            </div>
         </div>
      </div>
   </div>
</div>
<section class="rooms-section spad">
   <div class="container">
      <div class="row">
      <c:choose>
         <c:when test="${comment == on}">
               <c:forEach var="vo" items="${list }">
                  <div class="col-lg-4 col-md-6">
                     <div class="room-item">
                        <img src="img/room/room-1.jpg" alt="">
                        <div class="ri-text">
                           <h2>${vo.hname }</h2>
                           <h4>${vo.haddressdo }</h4>
                           <table>
                              <tr>
                                 <td class="r-o">일정</td>
                                 <td style="width: 200px;">${vo.chkin }~ ${vo.chkout }</td>
                              </tr>
                           </table>
                           <a href="rescheckdetail?resno=${vo.resno }" class="primary-btn"style="text-decoration-line: none;">상세예약정보</a>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </c:when>
            <c:when test="${comment != on}">
               <c:forEach var="vo" items="${list }">
                  <div class="col-lg-4 col-md-6">
                     <div class="room-item">
                        <img src="img/room/room-1.jpg" alt="">
                        <div class="ri-text">
                           <h2>${vo.hname }</h2>
                           <h4>${vo.haddressdo }</h4>
                           <table>
                              <tr>
                                 <td class="r-o">일정</td>
                                 <td style="width: 200px;">${vo.chkin }~ ${vo.chkout }</td>
                              </tr>
                           </table>
                           <a href="rescheckdetail?resno=${vo.resno }" class="primary-btn" style="text-decoration-line: none;">상세예약정보</a>
                           <a href="roomDetail?hno=${vo.hno }&hugi=hugi" class="primary-btn" style="margin-left: 20px;text-decoration-line: none;">후기쓰기</a>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </c:when>
      </c:choose>
      <br>
      <br>
      
     
   
 
    





      <!--    <div class="col-lg-12">
            <div class="room-pagination">
               <a href="#">1</a> <a href="#">2</a> <a href="#">Next <i
                  class="fa fa-long-arrow-right"></i></a>
            </div>
         </div> -->
      </div>
         <div id="pageN" style="text-align: center; width:100px ;margin:  0 auto;">
      <%@include file="../pageProcess.jsp" %>
  		</div>
   </div>

</section>
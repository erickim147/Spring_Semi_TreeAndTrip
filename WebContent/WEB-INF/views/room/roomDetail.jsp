<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="urlPath"
   value="${pageContext.request.contextPath }/resources" />
<!-- Breadcrumb Section Begin -->
<div class="breadcrumb-section">
   <div class="container">
      <div class="row">
         <div class="col-lg-12">
            <div class="breadcrumb-text">
               <h2>${vo[0].HNAME }</h2>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- Breadcrumb Section End -->

<!-- Room Details Section Begin -->
<section class="room-details-section spad">
   <div class="container">
      <div class="row">
         <div class="col-lg-8">
            <div class="room-details-item">
               <!-- <img src="resources/img/room/room-details.jpg" alt=""> -->

               <div class="big">
                  <img id="big" src="${urlPath }/imgfile/${vo[0].IMG1}">
               </div>

               <div class="room-details-list">
                  <c:forEach var="vo" items="${vo }">
                     <img class="small" src="${urlPath }/imgfile/${vo.IMG1}">
                  </c:forEach>
               </div>


               <br>
               <h4>지역 : ${vo[0].HADDRESSDO } &nbsp;/&nbsp; 타입 : ${vo[0].HTYPE }
                  &nbsp;/&nbsp; 방개수 : ${vo[0].HRNUM } &nbsp;/&nbsp; 화장실개수 :
                  ${vo[0].HTNUM }</h4>

               <br>
               <div class="rd-text">
                  <div class="rd-title">
                     <h3>${vo[0].HNAME }</h3>
                     <div class="rdt-right">
                        <div class="rating" style="display: flex; align-items: center;">
                           <input type="hidden" id="wish" value="wish"> <span
                              id="target" style="margin-right: 20px; font-size: 30px;"></span><a
                              href="#hugi">후기</a>
                        </div>
                     </div>
                  </div>
                  <h2>￦ ${vo[0].HPRICE }</h2>
                  <H4>숙소 설명</H4>
                  <br>
                  <h4>${vo[0].HINFO }</h4>



               </div>
            </div>
             <div class="rd-reviews">
               <a name="hugi"><h4>지난 후기</h4></a>
               <c:forEach var="rlist" items="${rlist}">
               <div class="review-item">
                  <div class="ri-text">
                     <span>${rlist.rdate}</span>
                     <h5>${rlist.name}</h5>
                     <p>${rlist.recontent}</p>
                  </div>
               </div>  
               </c:forEach>
            </div>
            <c:if test="${hugi != null }">
                <div class="wrap">
                  <h2>후기</h2>
                  <form name="reviewform" class="reviewform" method="post"
                     action="addReview">
                     <input type="hidden" name="hno" id="hno" value="${vo[0].HNO }" />
                      <input type="hidden" name="uno" id="uno" value="${sessionScope.sessionNo}" />
                      
                      
                     <p class="title_star">리뷰를 남겨주세요.</p>
                     <div class="review_contents">
                        <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
                        <textarea rows="10" class="recontent" style="height: 200px;"name="recontent" id="recontent"></textarea>
                     </div>
                     <div class="cmd">
                        <input type="submit" name="save" id="save" value="등록">
                     </div>
                  </form>
               </div>
            </c:if>
         </div>
         <div class="col-lg-4">
            <div class="room-booking">
               <h3>예약</h3>
               <form action="addRes" method="post">
                  <input type="hidden" name="uno" value="${sessionScope.sessionNo}">
                  <input type="hidden" name="hno" value=" ${vo[0].HNO }"> <input
                     type="hidden" name="rprice" value=" ${vo[0].HPRICE }">
                  <div class="check-date">
                     <label for="fromDate">체크인</label> <input type="text"
                        class="fromDate" id="fromDate" name="chkin"> <i
                        class="icon_calendar"></i>
                  </div>
                  <div class="check-date">
                     <label for="toDate">체크아웃(검색 시 검색한 일자 가져옴)</label> <input
                        type="text" class="toDate" id="toDate" name="chkout"> <i
                        class="icon_calendar"></i>
                  </div>
                  <div class="select-option">
                     <label for="guest">인원: (검색 시 검색한 값 가져옴)</label> <select
                        id="guest" name="pernum">

                        <option value="2">성인 2</option>
                        <option value="3">성인 3</option>
                        <option value="4">성인 4</option>
                     </select>

                  </div>
                  <c:choose>
                     <c:when test="${sessionScope.sessionNo == null }">
                        <button type="button"
                           onclick="location.href='loginForm?hno=${vo[0].HNO }'">예약하기</button>
                     </c:when>
                     <c:otherwise>
                        <div class="container">
                           <div class="reser-container1">
                              <div class="reser-btn">
                                 <div class="reser-btn-search"
                                    style="margin-left: -15px; background-color: #dfa974; color: #ffffff">
                                    <span>예약하기 </span>
                                 </div>
                              </div>
                              <div class="booking-continer search-model2">
                                 <div class="booking-form">
                                    <h2
                                       style="text-align: center; background-color: #dfa974; color: #ffffff">예약
                                       확인</h2>

                                    <div style="margin-bottom: 5px;">숙 소 명 : ${vo[0].HNAME }</div>
                                    <div style="margin-bottom: 5px;">
                                       체크인 날짜 : <input type="text" id="target1" name="target1"
                                          value="target1" readonly="readonly">
                                    </div>
                                    <div style="margin-bottom: 5px;">
                                       체크아웃 날짜 : <input type="text" id="target2" name="target2"
                                          value="target2" readonly="readonly">
                                    </div>
                                    <div style="margin-bottom: 5px;">
                                       인 원 : <input type="text" id="target3" name="target3"
                                          value="target3" readonly="readonly"> 명
                                    </div>
                                    <div style="margin-bottom: 5px;">금 액 : ￦
                                       ${vo[0].HPRICE }</div>

                                    <div class="check-date">
                                       <input type="submit" value="예약하기">
                                    </div>

                                 </div>
                                 <div class="search-close-switch2">
                                    <i class="icon_close"></i>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:otherwise>
                  </c:choose>
               </form>

            </div>
         </div>
      </div>
   </div>
</section>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
   $(function() {
      var hno = ${vo[0].HNO};
      $.ajax({
         url : "cal",
         type : "POST",
         data : "hno=" + hno,
         cache : false,
         success : function(data) {
            disavble(data);
         },
      });
   });
</script>
<script>
   var big = document.querySelector("#big");
   var small = document.querySelectorAll(".small");
   for (var i = 0; i < small.length; i++) {
      small[i].addEventListener("mouseover", change);
   }
   function change() {
      var smallP = this.getAttribute("src");
      big.setAttribute("src", smallP);
   }
</Script>
<script>
   $('.reser-btn-search').click(function() {
      var chkino = $('#fromDate').val()
      $('#target1').val(chkino);

   });
   $('.reser-btn-search').click(function() {
      var chkouto = $('#toDate').val()
      $('#target2').val(chkouto);

   });

   $('.reser-btn-search').click(function() {
      var pernumo = $('#guest').val()
      $('#target3').val(pernumo);

   });
</script>
<script>
   $(function() {
      $('#wish').ready(function() {
         var uno = ${sessionScope.sessionNo};
         var hno = ${vo[0].HNO};
         $.ajax({
            url : "wishcheck?uno=" + uno + "&hno=" + hno,//서버의 url, 파람 전달
            cache : false, //ajax통신중 캐시 삭제
            success : function(data) { //콜백
               var resMsg = "";
               if (data === "1") {
                  resMsg = "<i class='icon_heart'></i>";

               } else {
                  resMsg = "<i class='icon_heart_alt'></i>";

               }

               $('#target').html(resMsg);
            }
         });

      });
   });

   $(function() {
      $('#target').click(function() {
         var uno = ${sessionScope.sessionNo};
         var hno = ${vo[0].HNO};
         if (uno == 0) {
            alert("로그인 후 이용이 가능합니다.");
         } else {
            $.ajax({
               url : "wishda?uno=" + uno + "&hno=" + hno,//서버의 url, 파람 전달
               cache : false, //ajax통신중 캐시 삭제
               success : function(data) { //콜백
                  var resMsg = "";
                  if (data === "1") {
                     resMsg = "<i class='icon_heart'></i>";

                  } else {
                     resMsg = "<i class='icon_heart_alt'></i>";

                  }
                  $('#target').html(resMsg);
               }
            });
         }
      });
   });
</script>
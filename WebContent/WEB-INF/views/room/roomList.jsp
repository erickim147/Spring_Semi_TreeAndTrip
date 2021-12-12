<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="urlPath" value="${pageContext.request.contextPath }/resources"/>
<!-- Breadcrumb Section Begin -->
<div class="breadcrumb-section">
   <div class="container">
      <div class="row">
         <div class="col-lg-12">
            <div class="breadcrumb-text">
               <h2>${location } ¼÷¼Ò</h2>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- Breadcrumb Section End -->

<!-- Blog Section Begin -->
<section class="blog-section blog-page spad">
   <div class="container">
      <div class="row">
        <c:forEach var="e" items="${list }">
         <div class="col-lg-4 col-md-6">
            <div class="blog-item set-bg" data-setbg="${urlPath }/imgfile/${e.img1}" onclick="location.href='roomDetail?hno=${e.hno}'" style="cursor: pointer;">
               <div class="bi-text">
                  <span class="b-tag" >${e.htype }</span>
                  <h4>
                     <span class="b-tag">${e.hname}</span>
                  </h4>
                  <div class="b-time">
                     <span class="b-tag" >£Ü ${e.hprice} ¿ø</span>
                  </div>
               </div>
            </div>
         </div>
          </c:forEach>
         </div>
         <div id="pageN" style="text-align: center;width:100px ;margin:  0 auto; ">
      <%@include file="../pageProcess2.jsp" %>
  	</div>
        <!--  <div class="col-lg-12">
            <div class="load-more">
               <a href="#" class="primary-btn">Load More</a>
            </div> -->
         </div>
      </div>
   </div>
</section>
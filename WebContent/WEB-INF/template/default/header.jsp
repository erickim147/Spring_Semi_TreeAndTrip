<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Header Section Begin -->
<header class="header-section">
   <div class="menu-item">
      <div class="container">
         <div class="row">
            <div class="col-lg-2">
               <div class="logo">
                  <a href="main"> <img src="resources/img/logo3.png" alt="">
                  </a>
               </div>
            </div>
            <div class="col-lg-10">
               <div class="nav-menu">
                  <nav class="mainmenu" >
                     <%--이부분은 나중에 host session 확인 후 jstl 적용 --%>
                     <%-- Ajax --%>
                     <c:choose>
                     <c:when test="${sessionScope.sessionHostchk == null}">
                     <ul>
                        <li><a href="main" style="font-weight: 700; text-decoration-line: none;">Home</a></li>
                        <li><a href="#" style="text-decoration-line: none;"><i class="icon_menu"
                              style="font-weight: 700; text-decoration-line: none;"></i></a>
                           <ul class="dropdown" style="text-decoration-line: none;">
                              <li><a href="memberJoin" style="font-weight: 700; ">회원가입</a></li>
                              <li><a href="loginForm" style="font-weight: 700; ">로그인</a></li>
                           </ul></li>
                     </ul>
                     </c:when>
                     <c:when test="${sessionScope.sessionHostchk == 1}">
                     <ul>
                        <li><a href="main" style="font-weight: 700; text-decoration-line: none;">Home</a></li>
                        <li><a href="resaTotal?hno=${sessionScope.sessionNo }" style="font-weight: 700; text-decoration-line: none;">예약현황</a></li>
						<li><a href="searchSales?hno=${sessionScope.sessionNo }" style="font-weight: 700; text-decoration-line: none;">통계자료조회</a></li>
                        <li><a href="main" style="font-weight: 700; text-decoration-line: none;">${sessionScope.sessionName }&nbsp;호스트님</a></li>
                        <li><a href="#" style="text-decoration-line: none;"><i class="icon_menu"
                              style="font-weight: 700; text-decoration-line: none;"></i></a>
                           <ul class="dropdown" style="text-decoration-line: none;">
                              <li><a href="logoutProcess" style="font-weight: 700; text-decoration-line: none;">로그아웃</a></li>
                                 <li><a href="wishlist" style="font-weight: 700;text-decoration-line: none;">찜목록</a></li>
                              <li id="changeUser"><a style="font-weight: 700; text-decoration-line: none; cursor: pointer;">일반유저변경</a></li>
                              <li><a href="hostInfo?hno=${sessionScope.sessionNo}" style="font-weight: 700;text-decoration: none">정보수정</a></li>
                              <li><a href="resMyaTotal?uno=${sessionScope.sessionNo }" style="font-weight: 700; text-decoration-line: none;">마이페이지</a></li>
                                <li><a href="roomReviewList?hno=${sessionScope.sessionNo }"style="font-weight: 700;text-decoration-line: none;">룸 평가 내역</a></li>
                             <li><a href="userReviewList?uno=${sessionScope.sessionNo }" style="font-weight: 700;text-decoration-line: none;">내이용후기</a></li>
                           </ul></li>
                     </ul>
                     </c:when>
                     <c:when test="${sessionScope.sessionHostchk == 0}">
                        <ul>
                        <li><a href="main" style="font-weight: 700; text-decoration-line: none;">Home</a></li>
                        <li><a href="hostJoin" style="font-weight: 700; text-decoration-line: none;">호스트되기</a></li>
                        <li><a href="#" style="font-weight: 700; text-decoration-line: none;">${sessionScope.sessionName } 님</a></li>
                        <li><a href="#" style="text-decoration-line: none;"><i class="icon_menu"
                              style="font-weight: 700; text-decoration-line: none;"></i></a>
                           <ul class="dropdown" style="text-decoration-line: none;" >
                              <li><a href="logoutProcess" style="font-weight: 700;text-decoration-line: none;">로그아웃</a></li>
                                 <li><a href="wishlist" style="font-weight: 700;text-decoration-line: none;">찜목록</a></li>
                              <li><a href="userReviewList?uno=${sessionScope.sessionNo }" style="font-weight: 700;text-decoration-line: none;">내이용후기</a></li>
                              <li><a href="resMyaTotal?uno=${sessionScope.sessionNo }" style="font-weight: 700;text-decoration-line: none;">마이페이지</a></li>
                           </ul></li>
                     </ul>
                     </c:when>
                     </c:choose>
                  </nav>
               </div>
            </div>
         </div>
      </div>
   </div>
</header>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
var pwd = "";
var no = ${sessionScope.sessionNo};

$('#changeUser').click(function() {
	pwkChkFunction();
});

function pwkChkFunction() {
	pwd = prompt("일반 유저로 변경 시 기존 등록하신 숙소는 삭제 됩니다.변경을 원하시면 비밀번호를 입력해주세요.", "");
	if(pwd != null){
		pwChkAjax();
	}
}

function delHostFunction() {
	console.log("호출");
	window.location.href('changeUser?no='+no);
}

function pwChkAjax() {
	$.ajax({
		 url: "hostPwChk",
		 type: "POST",
		 data: {"pwd":pwd, "no":no},
		 cache: false,
		 success: function (data) {
			 if(data === "1") {
				 location.href='changeUser?no='+no; 
			 } else {
				 alert("비밀번호가 틀립니다. 다시 시도해 주세요.");
				 pwkChkFunction();
			 }
		 },
	 });
};


</script>

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
                     <%--�̺κ��� ���߿� host session Ȯ�� �� jstl ���� --%>
                     <%-- Ajax --%>
                     <c:choose>
                     <c:when test="${sessionScope.sessionHostchk == null}">
                     <ul>
                        <li><a href="main" style="font-weight: 700; text-decoration-line: none;">Home</a></li>
                        <li><a href="#" style="text-decoration-line: none;"><i class="icon_menu"
                              style="font-weight: 700; text-decoration-line: none;"></i></a>
                           <ul class="dropdown" style="text-decoration-line: none;">
                              <li><a href="memberJoin" style="font-weight: 700; ">ȸ������</a></li>
                              <li><a href="loginForm" style="font-weight: 700; ">�α���</a></li>
                           </ul></li>
                     </ul>
                     </c:when>
                     <c:when test="${sessionScope.sessionHostchk == 1}">
                     <ul>
                        <li><a href="main" style="font-weight: 700; text-decoration-line: none;">Home</a></li>
                        <li><a href="resaTotal?hno=${sessionScope.sessionNo }" style="font-weight: 700; text-decoration-line: none;">������Ȳ</a></li>
						<li><a href="searchSales?hno=${sessionScope.sessionNo }" style="font-weight: 700; text-decoration-line: none;">����ڷ���ȸ</a></li>
                        <li><a href="main" style="font-weight: 700; text-decoration-line: none;">${sessionScope.sessionName }&nbsp;ȣ��Ʈ��</a></li>
                        <li><a href="#" style="text-decoration-line: none;"><i class="icon_menu"
                              style="font-weight: 700; text-decoration-line: none;"></i></a>
                           <ul class="dropdown" style="text-decoration-line: none;">
                              <li><a href="logoutProcess" style="font-weight: 700; text-decoration-line: none;">�α׾ƿ�</a></li>
                                 <li><a href="wishlist" style="font-weight: 700;text-decoration-line: none;">����</a></li>
                              <li id="changeUser"><a style="font-weight: 700; text-decoration-line: none; cursor: pointer;">�Ϲ���������</a></li>
                              <li><a href="hostInfo?hno=${sessionScope.sessionNo}" style="font-weight: 700;text-decoration: none">��������</a></li>
                              <li><a href="resMyaTotal?uno=${sessionScope.sessionNo }" style="font-weight: 700; text-decoration-line: none;">����������</a></li>
                                <li><a href="roomReviewList?hno=${sessionScope.sessionNo }"style="font-weight: 700;text-decoration-line: none;">�� �� ����</a></li>
                             <li><a href="userReviewList?uno=${sessionScope.sessionNo }" style="font-weight: 700;text-decoration-line: none;">���̿��ı�</a></li>
                           </ul></li>
                     </ul>
                     </c:when>
                     <c:when test="${sessionScope.sessionHostchk == 0}">
                        <ul>
                        <li><a href="main" style="font-weight: 700; text-decoration-line: none;">Home</a></li>
                        <li><a href="hostJoin" style="font-weight: 700; text-decoration-line: none;">ȣ��Ʈ�Ǳ�</a></li>
                        <li><a href="#" style="font-weight: 700; text-decoration-line: none;">${sessionScope.sessionName } ��</a></li>
                        <li><a href="#" style="text-decoration-line: none;"><i class="icon_menu"
                              style="font-weight: 700; text-decoration-line: none;"></i></a>
                           <ul class="dropdown" style="text-decoration-line: none;" >
                              <li><a href="logoutProcess" style="font-weight: 700;text-decoration-line: none;">�α׾ƿ�</a></li>
                                 <li><a href="wishlist" style="font-weight: 700;text-decoration-line: none;">����</a></li>
                              <li><a href="userReviewList?uno=${sessionScope.sessionNo }" style="font-weight: 700;text-decoration-line: none;">���̿��ı�</a></li>
                              <li><a href="resMyaTotal?uno=${sessionScope.sessionNo }" style="font-weight: 700;text-decoration-line: none;">����������</a></li>
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
	pwd = prompt("�Ϲ� ������ ���� �� ���� ����Ͻ� ���Ҵ� ���� �˴ϴ�.������ ���Ͻø� ��й�ȣ�� �Է����ּ���.", "");
	if(pwd != null){
		pwChkAjax();
	}
}

function delHostFunction() {
	console.log("ȣ��");
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
				 alert("��й�ȣ�� Ʋ���ϴ�. �ٽ� �õ��� �ּ���.");
				 pwkChkFunction();
			 }
		 },
	 });
};


</script>

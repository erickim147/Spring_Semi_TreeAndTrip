<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section>
   <div class="booking-continer">
      <div class="booking-form login_form">
         <h3>호스트 정보 수정</h3>
         <form action="hostreup" method="post" enctype="multipart/form-data">
			<input type="hidden" name="hno" value="${sessionScope.sessionNo}">         
            <div class="check-date">
               <label for="date-in" class="font-weight">숙소이름</label> <input
                  type="text" id="hname" name="hname" value="${vo[0].HNAME}">
            </div>
            <div class="check-date">
            <div class="check-date">
				<label for="date-in" class="font-weight">주소</label>
				<select name="haddressdo">
						<option value="">지역선택</option>
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="경기도">경기도</option>
						<option value="부산">부산</option>
						<option value="울산">울산</option>
						<option value="경상남도">경상남도</option>
						<option value="경상북도">경상북도</option>
						<option value="충청남도">충청남도</option>
						<option value="충청북도">충청북도</option>
						<option value="전라남도">전라남도</option>
						<option value="전라북도">전라북도</option>
						<option value="강원도">강원도</option>
						<option value="광주광역시">광주광역시</option>
						<option value="제주시">제주시</option>
						<option value="세종시">세종시</option>
				</select>
				<br>
				<br>
				<br>
				<label for="date-in" class="font-weight">상세주소</label> 
				<input type="text" id="haddress" name="haddress"value="${vo[0].HADDRESS}">
		
            <div class="check-date">
               <label for="date-in" class="font-weight">수용인원</label> <input
                 type="number" id="hpernum" name="hpernum"value="${vo[0].HPERNUM}">
            </div>
            <div class="check-date">
               <label for="date-in" class="font-weight">방개수</label> <input
                  type="number" id="hrnum" name="hrnum"value="${vo[0].HRNUM}">
            </div>
            <div class="check-date">
               <label for="date-in" class="font-weight">화장실개수</label> <input
                  type="number" id="htnum" name="htnum"value="${vo[0].HTNUM}">
            </div>
            <div class="check-date">
               <label for="date-in" class="font-weight">집형태</label> 
				<select class="check-date" id="htype" name="htype">
					<option value="게스트하우스"> 게스트하우스</option>
					<option value="카라반&캠핑"> 카라반&캠핑</option>
					<option value="풀빌라"> 풀빌라</option>
					<option value="아파트형숙소"> 아파트형숙소</option>
				</select>
				<br>
				<br>
				<br>
            </div>
            
            <div class="check-date">
               <label for="date-in" class="font-weight">가격</label> <input type="text" id="hprice" name="hprice"value="${vo[0].HPRICE}">
            </div>
            
            <div class="check-date">
               <label for="date-in" class="font-weight">상세설명</label>
               <textarea name="hinfo" style="width: 680px; height: 400px;">${vo[0].HINFO}</textarea>
            </div>
 <fieldset>
               <div class="check-date">
                  <label for="date-in" class="font-weight">사진 등록 개수</label> <input
                     type="number" id="code" value="1" min="1" max="5" step="1"
                     onchange="addFile()">
               </div>
               <div id="target" class="check-date">
                  <input type="file" name="mfile2" id="mfile2">
               </div>
            </fieldset>
            <button type="submit" class="submit-btn">확인</button>
         </form>
      </div>
   </div>
</section>
<script>
   function addFile() {
      var code = parseInt(document.getElementById("code").value, "10");
      console.log(code);
      var html = "";
      for (var i = 0; i < code; i++) {
         html += "<input type=\"file\" name=\"mfile2\" id=\"mfile2\"><br>";
      }
      document.getElementById("target").innerHTML = html;
   }
</script>

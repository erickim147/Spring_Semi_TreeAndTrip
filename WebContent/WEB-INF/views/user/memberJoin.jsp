<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<section>

<div class ="booking-continer">
	<div class="booking-form login_form">
		<h3>회원가입</h3>
		<form action="userJoin" method="post">
			<div class="check-date">
				<label for="date-in" class="font-weight">이메일</label> <input
					type="email" id="emailChkInput" name="email" style="margin-bottom: 20px;">
					<input
					type="button" id="emailChkBtn" value="ID 중복확인">
					<div id="target" style="text-align: center;" ></div>
			</div>
			<div class="check-date">
				<label for="date-out" class="font-weight">비밀번호</label> <input
					type="password" id="pwd" name="pwd">
					<label for="date-out" class="font-weight">비밀번호확인</label> <input
					type="password" id="pwdchk" name="pwdchk">
			</div>
			<div class="check-date">
				<label for="date-in" class="font-weight">이름</label> <input
					type="text"  id="name" name="name">
			</div>
			<div class="check-date">
				<label for="date-in" class="font-weight">전화번호</label> <input
					type="text" id="phone" name="pnum">
			</div>
			<div class="check-date">
				<label for="date-in" class="font-weight">주소</label> 
				<select name="addressdo">
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
				<input type="text" id="phone" name="address">
			</div>

			<button type="submit" class="submit-btn">확인</button>
		</form>
	</div>
</div>

</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script> 
$("#emailChkBtn").click(function () {
	var email = $("#emailChkInput").val();
		$.ajax({
		 url: "emailCheck",
		 type: "POST",
		 data: "email=" + email,
		 cache: false,
		 success: function (data) {
		  var resMsg = "";
		  if (data === "1") {
			  resMsg = "<p style='color:red; margin-top: 15px;'>이미 사용중인 이메일 입니다.</p>";
		  } else {
			  resMsg = "<p style='color:blue; margin-top: 15px;'>사용 가능한 이메일 입니다.</p>";
		  }
		  $("#target").html(resMsg);
		 },
	 });
});
</script>
<script>
$(function(){

    $('#pwdchk').blur(function(){
       if($('#pwd').val() != $('#pwdchk').val()){
           if($('#pwdchk').val()!=''){
           alert("비밀번호가 일치하지 않습니다.");
               $('#pwdchk').val('');
              $('#pwdchk').focus();
           }
        }
    })        
 });
</script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<section>

<div class ="booking-continer">
	<div class="booking-form login_form">
		<h3>ȸ������</h3>
		<form action="userJoin" method="post">
			<div class="check-date">
				<label for="date-in" class="font-weight">�̸���</label> <input
					type="email" id="emailChkInput" name="email" style="margin-bottom: 20px;">
					<input
					type="button" id="emailChkBtn" value="ID �ߺ�Ȯ��">
					<div id="target" style="text-align: center;" ></div>
			</div>
			<div class="check-date">
				<label for="date-out" class="font-weight">��й�ȣ</label> <input
					type="password" id="pwd" name="pwd">
					<label for="date-out" class="font-weight">��й�ȣȮ��</label> <input
					type="password" id="pwdchk" name="pwdchk">
			</div>
			<div class="check-date">
				<label for="date-in" class="font-weight">�̸�</label> <input
					type="text"  id="name" name="name">
			</div>
			<div class="check-date">
				<label for="date-in" class="font-weight">��ȭ��ȣ</label> <input
					type="text" id="phone" name="pnum">
			</div>
			<div class="check-date">
				<label for="date-in" class="font-weight">�ּ�</label> 
				<select name="addressdo">
						<option value="">��������</option>
						<option value="����">����</option>
						<option value="��õ">��õ</option>
						<option value="��⵵">��⵵</option>
						<option value="�λ�">�λ�</option>
						<option value="���">���</option>
						<option value="��󳲵�">��󳲵�</option>
						<option value="���ϵ�">���ϵ�</option>
						<option value="��û����">��û����</option>
						<option value="��û�ϵ�">��û�ϵ�</option>
						<option value="���󳲵�">���󳲵�</option>
						<option value="����ϵ�">����ϵ�</option>
						<option value="������">������</option>
						<option value="���ֱ�����">���ֱ�����</option>
						<option value="���ֽ�">���ֽ�</option>
						<option value="������">������</option>
				</select>
				<input type="text" id="phone" name="address">
			</div>

			<button type="submit" class="submit-btn">Ȯ��</button>
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
			  resMsg = "<p style='color:red; margin-top: 15px;'>�̹� ������� �̸��� �Դϴ�.</p>";
		  } else {
			  resMsg = "<p style='color:blue; margin-top: 15px;'>��� ������ �̸��� �Դϴ�.</p>";
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
           alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
               $('#pwdchk').val('');
              $('#pwdchk').focus();
           }
        }
    })        
 });
</script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<section>
   <div class="booking-continer">
      <div class="booking-form login_form">
         <h3>ȣ��Ʈ ���</h3>
         <form action="hostUp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="hno" value="${sessionScope.sessionNo}">         
            <div class="check-date">
               <label for="date-in" class="font-weight">�����̸�</label> <input
                  type="text" id="hname" name="hname">
            </div>
            <div class="check-date">
            <div class="check-date">
				<label for="date-in" class="font-weight">�ּ�</label> 
				<select name="haddressdo">
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
				<br>
				<br>
				<br>
				<label for="date-in" class="font-weight">���ּ�</label> 
				<input type="haddress" id="haddress" name="haddress">
			
            <div class="check-date">
               <label for="date-in" class="font-weight">�����ο�</label> <input
                 type="number" id="hpernum" name="hpernum">
            </div>
            <div class="check-date">
               <label for="date-in" class="font-weight">�氳��</label> <input
                  type="number" id="hrnum" name="hrnum">
            </div>
            <div class="check-date">
               <label for="date-in" class="font-weight">ȭ��ǰ���</label> <input
                  type="number" id="htnum" name="htnum">
            </div>
            <div class="check-date">
               <label for="date-in" class="font-weight">������</label> 
				<select class="check-date" id="htype" name="htype">
					<option value="�Խ�Ʈ�Ͽ콺"> �Խ�Ʈ�Ͽ콺</option>
					<option value="ī���&ķ��"> ī���&ķ��</option>
					<option value="Ǯ����"> Ǯ����</option>
					<option value="����Ʈ������"> ����Ʈ������</option>
				</select>
				<br>
				<br>
				<br>
            </div>
            
            <div class="check-date">
               <label for="date-in" class="font-weight">����</label> <input type="text" id="hprice" name="hprice">
            </div>
            
            <div class="check-date">
               <label for="date-in" class="font-weight">�󼼼���</label>
               <textarea name="hinfo" style="width: 680px; height: 400px;"></textarea>
            </div>

            <fieldset>
               <div class="check-date">
                  <label for="date-in" class="font-weight">���� ��� ����</label> <input
                     type="number" id="code" value="1" min="1" max="5" step="1"
                     onchange="addFile()">
               </div>
               <div id="target" class="check-date">
                  <input type="file" name="mfile2" id="mfile2">
               </div>
            </fieldset>
            
            <button type="submit" class="submit-btn">Ȯ��</button>
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
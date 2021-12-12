<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<section class="hero-section">
	<div class="container">
		<div class="reser-container">
			<div class="reser-btn">
				<div class="reser-btn-text">
					<span>���� ������� ������ ���� �� Tree&Trip�� ���͵帳�ϴ�!</span>
				</div>
				<div class="reser-btn-search">
					<span>���� �˻� <i class="icon_search"></i></span>
				</div>
			</div>
			<div class="booking-continer search-model2">
				<div class="booking-form">
					<h3>
						Enjoy Your Trip <i class="icon_camera"></i>
					</h3>
					<form action="roomList" method="post">
						<div class="check-date" style="margin-bottom: 70px;">
							<label for="fromDate" class="font-weight">��������</label> <select
								name="location" id="search-select">
								<option value="����">����</option>
								<option value="��õ">��õ</option>
								<option value="���">��⵵</option>
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
						</div>
						<div class="select-option">
							<label for="guest" class="font-weight">�ο�</label> <select
								id="guest" name="guest">
								<option value="1">1 ��</option>
								<option value="2">2 ��</option>
								<option value="3">3 ��</option>
								<option value="4">4 ��</option>
								<option value="5">5 ��</option>
								<option value="6">6 ��</option>
								<option value="7">7 ��</option>
								<option value="8">8 ��</option>
							</select>
						</div>
						<div class="check-date">
							<i class="icon_search" style="margin-right: 15px"></i> <input
								type="submit" value="�˻�">
						</div>
					</form>
				</div>
				<div class="search-close-switch2">
					<i class="icon_close"></i>
				</div>
			</div>
		</div>
	</div>
	<div class="hero-slider owl-carousel">
		<div class="hs-item set-bg" data-setbg="resources/img/hero/hero-4.jpg"></div>
		<div class="hs-item set-bg" data-setbg="resources/img/hero/hero-5.jpg"></div>
		<div class="hs-item set-bg" data-setbg="resources/img/hero/hero-1.jpg"></div>
		<div class="hs-item set-bg" data-setbg="resources/img/hero/hero-2.jpg"></div>
		<div class="hs-item set-bg" data-setbg="resources/img/hero/hero-3.jpg"></div>
	</div>
</section>
<!-- Hero Section End -->

<!-- About Us Section Begin -->
<section class="aboutus-section spad">
	<div class="category_text_box">
		<p>��𿡼���, ������ ��ƺ��� �ž�!</p>
	</div>
	<div class="category_img_box">
			<div>
				<a href="selectType?type=1" style="cursor: pointer;"><img src="resources/img/about/guest.jpg"></a>
				<p>�Խ�Ʈ�Ͽ콺</p>
			</div>
			<div>
				<a href="selectType?type=2" style="cursor: pointer;"><img src="resources/img/about/camping.jpg"></a>
				<p>ī���&ķ��</p>
			</div>
			<div>
				<a href="selectType?type=3" style="cursor: pointer;"><img src="resources/img/about/full.jpg"></a>
				<p>Ǯ����</p>
			</div>
			<div>
				<a href="selectType?type=4" style="cursor: pointer;"><img src="resources/img/about/apt.jpg"></a>
				<p>����Ʈ������</p>
			</div>
	</div>
</section>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


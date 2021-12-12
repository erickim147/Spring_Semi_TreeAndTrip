<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<section class="hero-section">
	<div class="container">
		<div class="reser-container">
			<div class="reser-btn">
				<div class="reser-btn-text">
					<span>어디든 상관없이 떠나고 싶을 때 Tree&Trip이 도와드립니다!</span>
				</div>
				<div class="reser-btn-search">
					<span>숙소 검색 <i class="icon_search"></i></span>
				</div>
			</div>
			<div class="booking-continer search-model2">
				<div class="booking-form">
					<h3>
						Enjoy Your Trip <i class="icon_camera"></i>
					</h3>
					<form action="roomList" method="post">
						<div class="check-date" style="margin-bottom: 70px;">
							<label for="fromDate" class="font-weight">지역선택</label> <select
								name="location" id="search-select">
								<option value="서울">서울</option>
								<option value="인천">인천</option>
								<option value="경기">경기도</option>
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
						</div>
						<div class="select-option">
							<label for="guest" class="font-weight">인원</label> <select
								id="guest" name="guest">
								<option value="1">1 명</option>
								<option value="2">2 명</option>
								<option value="3">3 명</option>
								<option value="4">4 명</option>
								<option value="5">5 명</option>
								<option value="6">6 명</option>
								<option value="7">7 명</option>
								<option value="8">8 명</option>
							</select>
						</div>
						<div class="check-date">
							<i class="icon_search" style="margin-right: 15px"></i> <input
								type="submit" value="검색">
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
		<p>어디에서나, 여행은 살아보는 거야!</p>
	</div>
	<div class="category_img_box">
			<div>
				<a href="selectType?type=1" style="cursor: pointer;"><img src="resources/img/about/guest.jpg"></a>
				<p>게스트하우스</p>
			</div>
			<div>
				<a href="selectType?type=2" style="cursor: pointer;"><img src="resources/img/about/camping.jpg"></a>
				<p>카라반&캠핑</p>
			</div>
			<div>
				<a href="selectType?type=3" style="cursor: pointer;"><img src="resources/img/about/full.jpg"></a>
				<p>풀빌라</p>
			</div>
			<div>
				<a href="selectType?type=4" style="cursor: pointer;"><img src="resources/img/about/apt.jpg"></a>
				<p>아파트형숙소</p>
			</div>
	</div>
</section>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


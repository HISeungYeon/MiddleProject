<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"
	type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="view/css/main.css" />
</head>
<body>
	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->

		<div class="simpleContainer" data-transitioned-child="true">
			<div class="centerContainer firstLoad">

				<div class="subpay" data-uia="form-confirm">
					<h2 class="welcome">
						<br>Disney++에 오신 것을 환영합니다. <br> 더 좋은 컨텐츠를 즐겨보세요!
					</h2>
					<br>
					<div class="stepHeader" data-a11y-focus="true">
						<span id="" class="stepIndicator" data-uia="">
							<h1 class="stepTitle" data-uia="stepTitle">결제 정보를 확인하세요</h1>
					</div>
					<li class="orderInfoItem" data-uia="payment-item">매월 3,990원<br>
						결제수단: 카카오페이
					</li> <br>
					<ul class="simpleForm structural ui-grid"></ul>
					<div>
						<div class="checkboxes ui-grid" data-uia="field-consents">

							<div class="summary-error" data-uia="summary-error"></div>
							<ul class="structural">
								<li class="li-termsOfUse"><div class="ui-binary-input">
										<input type="checkbox" class="" name="all" id="cb_termsOfUse"
											value="true" tabindex="0"
											data-uia="field-consents+termsOfUse"><label
											for="cb_termsOfUse"
											data-uia="field-consents+termsOfUse+label"><span
											id="" data-uia="">19세 이상이며, 아래의 약관에 모두 동의합니다. </span></label>
										<div class="helper"></div>
									</div></li>
								<li class="li-personalInfoThirdParties"><div
										class="ui-binary-input">
										<input type="checkbox" class="" name="chb"
											id="cb_personalInfoThirdParties" value="true" tabindex="0"
											data-uia="field-consents+personalInfoThirdParties"><label
											for="cb_personalInfoThirdParties"
											data-uia="field-consents+personalInfoThirdParties+label"><span
											id="" data-uia="">본인의 개인 정보를 제3자에 제공하는 데에 동의합니다.</span></label>
										<div class="helper"></div>
									</div></li>
								<li class="li-personalInfoGateway"><div
										class="ui-binary-input">
										<input type="checkbox" class="" name="chb"
											id="cb_personalInfoGateway" value="true" tabindex="0"
											data-uia="field-consents+personalInfoGateway"><label
											for="cb_personalInfoGateway"
											data-uia="field-consents+personalInfoGateway+label"><span
											id="" data-uia="">본인의 개인 정보를 결제 서비스업체에 제공하는 데에 동의합니다.
										</span></label>
										<div class="helper"></div>
									</div></li>
								<li class="li-cancelMembershipAnytime"><div
										class="ui-binary-input">
										<input type="checkbox" class="" name="chb"
											id="cb_cancelMembershipAnytime" value="true" tabindex="0"
											data-uia="field-consents+cancelMembershipAnytime"><label
											for="cb_cancelMembershipAnytime"
											data-uia="field-consents+cancelMembershipAnytime+label"><span
											id="" data-uia="">멤버십을 해지하지 않으면 Disney++에서 자동으로 멤버십을
												계속하며, 멤버십 요금(현 3,990원)이 등록한 결제 수단으로 매월 청구됩니다.</span></label>
										<div class="helper"></div>
									</div></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col text-center">
					<button type="button" id="update" class="btn btn-primary btn-lg" onclick="location.href='subpay.html'">유료멤버십 시작</button>
				</div>
			</div>
			<!-- footer -->
			<%@include file="footer.jsp"%>
		</div>
		<!-- Scripts -->
		<script src="view/js/jquery.min.js"></script>
		<script src="view/js/jquery.scrollex.min.js"></script>
		<script src="view/js/jquery.scrolly.min.js"></script>
		<script src="view/js/browser.min.js"></script>
		<script src="view/js/breakpoints.min.js"></script>
		<script src="view/js/util.js"></script>
		<script src="view/js/main.js"></script>

		<script>
			console.log($("input[name=all]"));
			$("input[name=all]").on("click", function() {
				// 			alert(this.checked);
				$("input[name=chb]").prop("checked", true);
			})

			$("p.title").on('click', function() {
				$(this).next(".con").slideToggle(100);
			});
		</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="icon" href="../img/core-img/favicon.ico">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(function() {
	$("#pro").click(function() {
		if ($("input:checkbox[name='agree']").is(":checked") == false) {
			alert("약관에 동의하지 않으면 가입할 수 없습니다!");
			$("#frm").submit();
		} else {
			alert("약관에 동의하셨습니다.");
			$("#frm").submit();
		}
	});
	$("#btn").click(function() {
		var test = confirm("회원가입을 포기하고 메인 화면으로 돌아가시겠습니까?");
		if (test) {
			location.href = "main";
		}
	});
});
</script>
<body>
<header class="header-area">
	<%@ include file="../navigation.jsp"%>
</header>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
		<h2>약관 내용</h2>
<textarea style="resize: vertical;width:990px;height:150px;font-size:12px;">
기업마당은 「개인정보보호법」 제15조제1항제1호, 제17조제1항제1호, 제23조제1호, 제24조제1항 제1호에 따라
아래와 같이 개인정보의 수집. 이용에 관하여 귀하의 동의를 얻고자 합니다.

기업마당은 이용자의 사전 동의 없이는 이용자의 개인정보를 함부로 공개하지 않으며, 수집된 정보는 아래와 같이 이용하고 있습니다.
이용자가 제공한 모든 정보는 아래의 목적에 필요한 용도 이외로는 사용되지 않으며 이용 목적이 변경될 시에는 이를 알리고 동의를 구할 것입니다.

개인정보의 수집 및 이용 동의
1. 개인정보의 수집 및 이용 목적
가. 서비스 제공에 관한 업무 이행 - 컨텐츠 제공, 특정 맞춤 서비스 제공(마이페이지, 뉴스레터 등), 기업 애로상담
나. 회원관리
- 회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 가입의사 확인, 가입 및 가입횟수 제한, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 공지사항 전달
2. 수집하는 개인정보의 항목
<개인회원 가입>
필수항목 : 아이디, 비밀번호, 이름, 핸드폰번호, 이메일, 암호화된 이용자 확인값(CI)
선택항목 : 이메일 수신여부, 문자수신여부, 웹진구독여부
<기업회원 가입>
필수항목 : 아이디, 비밀번호, 담당자 이름, 담당자 전화번호, 핸드폰번호, 이메일, (법인기업의 경우 법인등록번호), 기업정보(회사명, 대표자명, 사업자등록번호, 회사전화번호, 주소, 지역, 대표업종), 암호화된 이용자 확인값(CI)
선택항목 : 팩스번호, 홈페이지주소, 회사이메일주소, 창업일자, 부업종, 매출액, 수출액, 상시근로자 수, 주요생산품명, 이메일 수신여부, 문자수신여부, 이메일 수신여부, 문자수신여부, 웹진구독여부
<전문가 가입>
필수항목 : 아이디, 비밀번호, 이름, 핸드폰번호, 이메일, 협약사항, 지역, 암호화된 이용자 확인값(CI)
선택항목 : 소속기관명, 대표자명, 사업자번호, 소속기관 전화번호
전문가정보는 기업애로상담을 위한 목적으로 수집하나 보유하지 않고 비즈니스사업단으로 시스템연계 제공
본인인증시 암호화된 이용자 확인값(CI)은 SSO연계를 위한 용도로 제공
<자동수집>
IP주소, 쿠키, 서비스 이용기록, 방문기록 등
3. 개인정보의 보유 및 이용기간
기업마당은 원칙적으로 보유기간의 경과, 개인정보의 수집 및 이용목적의 달성 등 그 개인정보가 불필요하게 되었을 때에는 지체 없이 파기합니다. 다만, 다른 법령에 따라 보존하여야 하는 경우에는 그러하지 않을 수 있습니다. 불필요하게 되었을 때에는 지체 없이 해당 개인정보를 파기합니다.
회원정보
- 탈퇴 후 지체없이 파기
전문가정보
- 전문가 정보는 기업애로상담을 위한 목적으로 수집하나 보유하지 않고 비즈니스사업단으로 시스템연계 제공함
4. 동의거부권 및 불이익
정보주체는 개인정보 수집에 동의를 거부할 권리가 있습니다. 다만, 필수 항목에 대한 동의를 거부할 시 저희가 제공하는 서비스를 이용할 수 없습니다.
</textarea>
		<form:form method="post" id="frm" commandName="yakganCommand">
		
			<label>
				<form:checkbox path="agree" id="agree" value="true" />&nbsp;동의합니다.<br/>
				<span style="color:red;"> &nbsp;<form:errors path="agree" /></span>
			</label>
			<div align="center">
				<input type="button" id="pro" value="다음으로 진행하기" />&nbsp;<input type="button" id="btn" value="메인으로">
			</div>
		</form:form>
	</div>
</div>

<footer class="footer-area">
	<%@ include file="../footer.jsp"%>
</footer>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/active.js"></script>
<script>
$(function() {
	$("#btn").click(function() {
		var test = confirm("회원가입을 포기하고 메인 화면으로 돌아가시겠습니까?");
		if (test) {
			location.href = "main";
		}
	});
});
</script>
</body>
</html>
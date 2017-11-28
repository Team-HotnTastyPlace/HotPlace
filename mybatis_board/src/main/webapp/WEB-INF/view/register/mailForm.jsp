<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메일 보내기</title>

<!-- Bootstrap core CSS -->
<link href="http://bootstrapk.com/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="http://bootstrapk.com/examples/starter-template/starter-template.css"
	rel="stylesheet">
<script
	src="http://bootstrapk.com/assets/js/ie-emulation-modes-warning.js"></script>

<script>
	function numcheck() {

		var ran = mf2.ran.value;
		var email = document.getElementById("email").value;

		if (ran == '') {
			alert("인증번호를 발급받으세요");
			return false;
		}

		if (!mf2.num.value) {
			alert("인증번호를 입력하세요");
			return false;
		}

		if (mf2.num.value != ran) {
			alert("틀린 인증번호입니다. 인증번호를 다시 입력해주세요");
			mf2.num.value = "";
			return false;
		}

		if (mf2.num.value == ran) {
			alert("인증완료");
			opener.setEmail(email);

			window.close();

		}
	}
</script>
</head>
<body>

	<h4 style="margin-left:10%">메일 보내기1</h4>

	<table class="table" style="width:80%;display:table;margin-left:auto;margin-right:auto">

<tr>
		<th style="width:20%">이메일 입력1</th>
		<th style="width:60%"><form:form method="post" commandName="mf1" action="mailSend">
				<input type="text" id="email" name="email" size="50"
					value="${email }" class="form-control" width="100px">
				<form:errors path="email" />
				
				<th style="width:20%"><input type="submit" value="인증번호 발송" class="form-control"></th>
			</form:form></th>
</tr>
<tr>
<th>
		<form:form method="post" commandName="mf2" action="regForm"
			onsubmit="return numcheck();">
			<input type="text" name="num" size="30" placeholder="인증번호입력" class="form-control" />
			<input type="hidden" name="email" />
			<input type="hidden" name="ran" value="${ran }"><th>
			<input type="submit" value="인증번호 확인" class="form-control" style="width:30%"></th>
		</form:form></th>
		</tr>
	</table>
</body>
</html>
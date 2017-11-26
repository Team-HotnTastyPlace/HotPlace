<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!--주소 : http://localhost:8080/email/register/regForm -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="member.register" /></title>
<script>
	function setEmail(email) {
		document.getElementById("email").value = email;
	}
</script>
<!-- Bootstrap core CSS -->
<link href="http://bootstrapk.com/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="http://bootstrapk.com/examples/starter-template/starter-template.css"
	rel="stylesheet">
<script
	src="http://bootstrapk.com/assets/js/ie-emulation-modes-warning.js"></script>
</head>
<body>

	<h2 style="margin-left:35%;margin-top:10%">
		<spring:message code="member.info" />
	</h2>
	<!-- spring:message code: 룩업할 메세지의 키를 지정해줌. 지정하지 않으면 text에 입력한 값출력 -->


	<!-- 	<button onclick="location.href='mailForm'">이메일 인증</button> -->



	<button
		onclick="window.open('mailForm','인증','width=800, height=300, left=100, top=50')" style="margin-left:35%" class="btn btn-primary">이메일
		인증 </button>

	<form:form action="regSuccess" commandName="formData">

		<table class="table" style="width:30%;display: table; margin-left: auto; margin-right: auto;">
			<tr>
				<th style="width:30%">
					
						<spring:message code="email" /></th> <th><input
							type="text" id="email" name="email" value="${email }"
							readonly="readonly" class="form-control" /> <form:errors path="email" />
						
					
				</th>
			<tr>
				<th>
					
					<spring:message code="name" /></th> <th><form:input
								path="name" class="form-control"/> <form:errors path="name" />
					
				</th>
			</tr>
			<tr>
				<th>
				<spring:message code="password" /></th> <th><form:input
								path="password"  class="form-control" /> <form:errors path="password" />
				</th>
			</tr>
			<tr>
				<th>

					 <spring:message code="password.confirm" /></th> <th><form:input
								path="confirmPassword"  class="form-control" /> <form:errors path="confirmPassword" />
					</th>
			</tr>
			<tr>
				<th colspan="2">
				

						<input type="submit" value="회원 가입" class="btn btn-primary"/> &nbsp; <input type="reset"
							value="다시 작성" class="btn btn-primary"/>
					
				</th>
				
			</tr>
		</table>
	</form:form>
</body>
</html>
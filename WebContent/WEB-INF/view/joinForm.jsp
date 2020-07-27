<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css'>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>
<script
	src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js'></script>
<title>가입</title>
</head>
<body>
<div class="container" >
<hr />
<h5>회원 가입</h5>
<hr />
</div>
	<form action="join.do" method="post">
		<div class="container">
			<div class="form-group mx-sm-3 mb-2">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
					</div>
					<input type="text" class="form-control" name="id"
						value="${param.id}" aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" />
				</div>
				<c:if test="${errors.id}">아이디를 입력하세요.</c:if>
				<c:if test="${errors.duplicateId}">이미 사용중인 아이디입니다.</c:if>
			</div>
			<div class="form-group mx-sm-3 mb-2">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">이름</span>
					</div>
					<input type="text" class="form-control" name="name"
						value="${param.name}" aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" />
				</div>
				<c:if test="${errors.name}">이름을 입력하세요.</c:if>
			</div>
			<div class="form-group mx-sm-3 mb-2">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">암호</span>
					</div>
					<input type="password" class="form-control" name="password"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" />
				</div>
				<c:if test="${errors.password}">암호를 입력하세요.</c:if>
			</div>
			<div class="form-group mx-sm-3 mb-2">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">확인</span>
					</div>
					<input type="password" class="form-control" name="confirmPassword"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" />
				</div>
				<c:if test="${errors.confirmPassword}">비밀번호 확인해주세요.</c:if>
				<c:if test="${errors.notMatch}">암호와 확인이 일치하지 않습니다.</c:if>
			</div>
			<div class="form-group mx-sm-3 mb-2">
				<div class="input-group mb-3">
					<button type="submit" class="btn btn-primary">가입</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
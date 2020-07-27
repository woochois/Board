<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<title>인코딩필터 테스트</title>
</head>
<body>
	<form action="">
		<input type="text" name="name" value="홍기르동"/><br />
		<input type="submit" value="확인" />
	</form>
	<h1>${param.name}</h1>
</body>
</html>
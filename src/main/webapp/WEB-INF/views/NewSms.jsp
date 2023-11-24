<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="sendsms" method="post">
		Mobile  : <input type="Text" name="mobile"/>
			<Br><Br>
		Message : <input type="text" name="msg"/><br><Br>
		
			<input type="submit" value="SendSms"/>
	</form>

</body>
</html>
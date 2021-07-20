<!doctype html>
<html>
	<head>
		<link rel="stylesheet" href="style.css" />
   		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   		<title>Форма</title>
	</head>
	<header>
		<span>Форма обратной связи</span>
	</header>
	<body>
 		<form action = "send.php" method = "post">
 			<input type="text" name="login" required placeholder="ФИО" /> 
 			<input type="tel" name="tel" required placeholder="Телефон" /> 
 			<input type="text" name="adress" class = "biginput" placeholder="Адрес" /> 
 			<input type="email" name="email" class = "biginput" placeholder="Электронная почта" /> 
 			<input type="text" name="comment" class = "biginput" placeholder="Ваш комментарий" /> 
 			<input type="file" name="file" /> 
 			<input type="submit" name="send" value = "Отправить данные" />
 		</form>
	</body>
</html>
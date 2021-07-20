<?php

	$login = $_POST['login'];
	$adress = $_POST['adress'];
	$email = $_POST['email'];
	$tel = $_POST['tel'];
	$comment = $_POST['comment'];
	$file = $_POST['file'];
	if($login == '' or $tel ==''){
		echo 'Вы не заполнили обязательные поля';
	} else if(explode('@', $email)[1] == 'gmail.com'){
		echo 'Не поддерживаем gmail, используйте другую почту';
	} else {
		echo 'Регистрация прошла успешно, ваши данные: ';
		echo "<br /><br /> $login <br /><br /> $adress <br /><br /> $email <br /><br /> $tel <br /><br /> $comment";
	}

?>
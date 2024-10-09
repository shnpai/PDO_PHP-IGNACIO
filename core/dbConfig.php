<?php
$host = "localhost";
$user = "root";
$password ="";
$dbname = "ignacio"; //name of database connected to

$dsn = "mysql:host={$host};dbname={$dbname}"; //establish connection

$pdo = new PDO($dsn, $user, $password); //instance to connect pdo to database

$pdo->exec("SET time_zone = '+08:00';");

?>

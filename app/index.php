<?php

echo "<h1>Hello world!</h1>";

$config = require_once 'config.php';
$mysqli = new mysqli(
   $config['DB_HOST'],
   $config['DB_USER'],
   $config['DB_PASS'],
   $config['DB_NAME']
);

if (mysqli_connect_error()) {
   echo '<h2>Connect Error ' . mysqli_connect_errno() . ': ' . mysqli_connect_error() . '</h2>';
} else {
   echo "<h2>Connected to the database!</h2>";
}


error_log(date('Y-m-d-m-Y-H-i-s') . ': An important event happened'.PHP_EOL, 3, __DIR__ . '/logs/important.log');


echo "<h2>Event logged</h2>";



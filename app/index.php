<?php

echo "<h1>Hello world!</h1>";

$mysqli = new mysqli(
   'localhost',
   'my_user',
   'my_password',
   'my_db' 
);

if (mysqli_connect_error()) {
   echo '<h2>Connect Error ' . mysqli_connect_errno() . ': ' . mysqli_connect_error() . '</h2>';
} else {
   echo "<h2>Connected to the database!</h2>";
}


error_log(date('Y-m-d-m-Y-H-i-s') . ': An important event happened'.PHP_EOL, 3, __DIR__ . '/logs/important.log');


echo "<h2>Event logged</h2>";



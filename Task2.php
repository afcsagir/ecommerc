

<html>
<head>
	<title>Homepage</title>
</head>

<body>



<?php
include_once "classes/Crud.php";
$servername = "localhost";
$username = "root";
$password = "";
$database = 'ecommerce';


$conn = new mysqli($servername, $username, $password,$database);


if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
} 


function getCategoryTree() {


	$category = '';
   $sql = "SELECT * FROM item_category_relations WHERE item_id  ORDER BY category_id asc";
   $result = $GLOBALS['conn']->query($sql);
   //print_r($result);
   if ($result->num_rows > 0) {
	   // output data of each row
	   while($row = $result->fetch_assoc()) {
   
			$category .=  $row['category_id'] . "<br/>";
			$category .= getCategoryTree($row['item_id'], '-');
	   }
   }
   return $category;
   }
   
   function printCategoryTree() {
	   echo getCategoryTree();
   }
   
   printCategoryTree();
   
   
   
?>

</body>
</html>

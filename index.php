<?php
include_once "classes/Crud.php";

$crud = new Crud();


?>

<html>
<head>
	<title>Homepage</title>
</head>

<body>


<a href="Task2.php">Test2</a>

<?php
include_once "classes/Crud.php";

$crud = new Crud();

$result = $crud->getData("SELECT c.cat_name cat_name, count( p.category_id ) product_count FROM categories c INNER JOIN item_category_relations p ON c.cat_id = p.category_id GROUP BY p.category_id ORDER BY product_count DESC");

echo '<table border = "2">
<tr>
<th>Category</th>
<th>Order Value</th>
</tr>';
foreach ($result as $res) {
    $cat_name = $res['cat_name'];
    $product_count = $res['product_count'];

    echo '<tr>
                  <td>' . $cat_name . '</td>
                  <td>' . $product_count . '</td>

              </tr>';
}
?>

</body>
</html>

<?php 
include 'connected.php';
header("Access-Control-Allow-Origin:*");


if (!$conn) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$conn->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

if(isset($_GET))  {
    if ($_GET['isAdd'] == 'true'){

        $name = $_GET['name'];
        $type = $_GET['type'];
        $address = $_GET['address']; 
    
        
  
    $sql="INSERT INTO `useraccount` (`id`, `name`, `type`, `address`, `phone`, `user`, `password`, `avertar`, `lat`, `lng`) VALUES (NULL, '$name', '$type', '$address', '0866805011', 'myuser', '1234', '111', '222', '333')";

        $result=mysqli_query($conn,$sql);
        if ($result){
            echo "true";
        }else{
             echo "false";
        }
    } else echo "Welcome Inser_user.php";
/*
    $sql="INSERT INTO `useraccount` (`id`, `name`, `type`, `address`, `phone`, `user`, `password`, `avertar`, `lat`, `lng`) VALUES (NULL, 'phairot kanthawichit', 'user', '12/22 ', '0866805011', 'myuser', '1234', '111', '222', '333')";

    $result=mysqli_query($conn,$sql);
        if ($result){
            echo "true";
        }else{
             echo "false";
        }
*/
}
mysqli_close($conn);

?>
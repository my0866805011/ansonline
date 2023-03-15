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
        $phone = $_GET['phone'];
        $user = $_GET['user'];
        $password = $_GET['password'];
       
        
        /*
        INSERT INTO `useraccount`(`id`, `name`, `type`, `address`, `phone`, `user`, `password`, `avertar`, `lat`, `lng`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]','[value-6]','[value-7]','[value-8]','[value-9]','[value-10]')
        */

    $sql="INSERT INTO `useraccount` (`id`, `name`, `type`, `address`, `phone`, `user`, `password`) VALUES (NULL, '$name', '$type', '$address', '$phone', '$user', '$password')";

        $result=mysqli_query($conn,$sql);
        if ($result){
            echo "true $name";
        }else{
             echo "false";
        }
    } else echo "Welcome Inser.php";
}
mysqli_close($conn);

?>
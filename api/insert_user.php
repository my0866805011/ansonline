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
    if ($_GET['IsAdd'] == 'true'){

        $name = $_GET['name'];
        $type = $_GET['type'];
        $address = $_GET['address'];
        $phone =$_GET['phone'];
        $user =$_GET['user'];
        $password =$_GET['password'];
        $avartar=$_GET['avartar'];
        $lat = $_GET['lat'];
        $lng =$_GET['lang'];


        $sql="INSERT INTO `useraccount`(`id`, `name`, `type`, `address`, `phone`, `user`, `password`, `avertar`, `lat`, `lng`) VALUES (Null,'$name','$type','$address','$phone','$user','$password','$avartar','$lat','$lng')";

        $result=mysqli_query($conn,$sql);
        if ($result){
            echo "true";
        }else{
             echo "false";
        }
    } else echo "Welcome Inser";
}
mysqli_close($conn);

?>
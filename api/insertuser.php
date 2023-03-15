<?php 
include 'connected.php';

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {

        $name = $_GET['name'];
        $user = $_GET['user'];
        $type = $_GET['type'];
        $password =$_GET['password'];

       // INSERT INTO `usertable`(`id`, `type`, `name`, `user`, `password`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]')    
        
    $sql="INSERT INTO `usertable` (`id`, `type`, `name`, `user`, `password`) VALUES (Null, '$type', '$name', '$user', '$password');";
   
    $result=mysqli_query($conn,$sql);
        if ($result){
			echo "true";
		} else {
			echo "false";
    }
    
  

} else echo "Welcome Master UNG inserdata";
 
    
}
mysqli_close($conn);

 
?>
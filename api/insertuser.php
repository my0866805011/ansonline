<?php 
include 'connected.php';

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {

        $name = $_GET['name'];
        $user = $_GET['user'];
        $type = $_GET['type'];
        $address = $_GET['address'];
        $password =$_GET['password'];

        //;INSERT INTO `usertable`(`id`, `name`, `type`, `user`, `address`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]')
      
        
     $sql ="INSERT INTO `usertable`(`id`, `name`, `type`, `user`, `address`,`ispassword`) VALUES (null,'$name','$type','$user','$address','$password');";


     //$sql ="INSERT INTO `usertable`(`id`, `name`) VALUES (null,'$name');";

    $result=mysqli_query($conn,$sql);
        if ($result){
			echo "true";
		} else {
			echo "false";
    }
    
  

} else echo "Welcome Master Insertuser usertable";
 
    
}
mysqli_close($conn);

 
?>
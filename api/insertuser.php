<?php 
include 'connected.php';

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {

        $name = $_GET['name'];
        $user = $_GET['user'];
        $type = $_GET['type'];
        $address = $_GET['address'];
        $password =$_GET['password'];
        $phone = $_GET['phone'];

        //;INSERT INTO `usertable`(`id`, `name`, `type`, `user`, `address`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]')
       // INSERT INTO `usertable`(`id`, `name`, `type`, `user`, `address`, `ispass`, `phone`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]','[value-6]','[value-7]')
        
     $sql ="INSERT INTO `usertable`( `id`,`ispass`,`name`, `type`, `user`, `address`,`phone`) VALUES (null,'password','$name','$type','$user','$address','phone');";


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
<?php 
include 'myconnect.php';

$fname = $_POST['fname'];
$user = $_POST['user'];
$password =$_POST['password'];
$type =$_POST['type'];

$sql = "INSERT INTO `useraccount` (`id`, `name`, `user`) VALUES (NULL, 'phai', 'user');";

//$sql="INSERT INTO `ans_usertable`(`id`, `name`, `type`, `address`, `phone`, `user`, `password`, `avertar`, `lat`, `lag`) VALUES (NULL,'$fname','$user','$password','$type','[value-6]','[value-7]','[value-8]','[value-9]','[value-10]')";



//$sql="INSERT INTO `useraccount` (`id`, `name`, `user`, `password`,`type` ) VALUES (NULL, '$name', 'user', 'password','type')";

//$sql="INSERT INTO `ans_usertable` ( `name` ) VALUES ( '$fname')";


//$sql="INSERT INTO `ans_usertable` (`id`, `name`, `type`, `address`, `phone`, `user`, `password`) VALUES (NULL, '$name', '$type', 'address', 'phone', '$user', '$password')";

echo "<script> alert('$fname '); </script>";

$result=mysqli_query($conn,$sql);
if ($result){
    echo "<script> alert('บันทึกข้อมูลเรียบร้อย'); </script>";
    echo "<script> window.location='./ans_usertable.php'; </script>";
}else{
    echo "<script> alert('ไม่สามารถ บันทึกข้อมูลได้'); </script>";
}
mysqli_close($conn);

 
?>
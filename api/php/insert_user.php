<?php 
include 'myconnect.php';

$m_name = $_POST['fname'];
$m_user = $_POST['user'];
$m_password =$_POST['password'];
$m_type =$_POST['type'];


$sql="INSERT INTO `usertable` (`id`, `name`, `user`, `password`,`type` ) VALUES (NULL, '$m_name', '$m_user', '$m_password','$m_type')";


$result=mysqli_query($conn,$sql);
if ($result){
    echo "<script> alert('บันทึกข้อมูลเรียบร้อย'); </script>";
    echo "<script> window.location='./myshowuser.php'; </script>";
}else{
    echo "<script> alert('ไม่สามารถ บันทึกข้อมูลได้'); </script>";
}
mysqli_close($conn);

 
?>
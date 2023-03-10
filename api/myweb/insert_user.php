<?php 
include 'myconnect.php';

$m_name = $_POST['fname'];
$m_user = $_POST['user'];
$m_email = $_POST['email'];
$m_phone =$_POST['phone'];
$m_password =$_POST['password'];

#echo $m_name;

/*$sql="INSERT INTO `usertbl` (`name`) VALUES (`$m_name`)";
*/

$sql="INSERT INTO `usertbl` (`id`, `name`, `user`, `email`, `phone`, `password`) VALUES (NULL, '$m_name', '$m_user', '$m_email', '$m_phone', '$m_password')";


$result=mysqli_query($conn,$sql);
if ($result){
    echo "<script> alert('บันทึกข้อมูลเรียบร้อย'); </script>";
    echo "<script> window.location='./myshowuser.php'; </script>";
}else{
    echo "<script> alert('ไม่สามารถ บันทึกข้อมูลได้'); </script>";
}
mysqli_close($conn);

 
?>
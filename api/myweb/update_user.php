<?php 
include 'myconnect.php';
$m_idno = $_POST['midno'];
$m_name = $_POST['mname'];
$m_user = $_POST['muser'];
$m_email = $_POST['memail'];
$m_phone =$_POST['mphone'];
$m_password =$_POST['mpassword'];


$sql="UPDATE `usertbl` SET `name`='$m_name', `user`='$m_user',`email`='$m_email', `phone`='$m_phone', `password`='$m_password' WHERE `id`='$m_idno'" ;


$result=mysqli_query($conn,$sql);
if ($result){
    echo "<script> alert('บันทึกข้อมูลเรียบร้อย'); </script>";
    echo "<script> window.location='./myshowuser.php'; </script>";
}else{
    echo "<script> alert('ไม่สามารถ บันทึกข้อมูลได้'); </script>";
}
mysqli_close($conn);
?>
<?php 
include 'myconnect.php';
$m_idno = $_POST['midno'];
$m_name = $_POST['mname'];
$m_user = $_POST['muser'];
$m_type =$_POST['mtype'];
$m_password =$_POST['mpassword'];


$sql="UPDATE `ans_usertable` SET `name`='$m_name', `user`='$m_user',`password`='$m_password',`type`='$m_type' WHERE `id`='$m_idno'" ;


$result=mysqli_query($conn,$sql);
if ($result){
    echo "<script> alert('บันทึกข้อมูลเรียบร้อย'); </script>";
    echo "<script> window.location='./ans_usertbl.php'; </script>";
}else{
    echo "<script> alert('ไม่สามารถ บันทึกข้อมูลได้'); </script>";
}
mysqli_close($conn);
?>
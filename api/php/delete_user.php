<?php 
include './myconnect.php';
$ids=$_GET['id'];
$sql="DELETE FROM `usertable` WHERE `id`='$ids' ";
if(mysqli_query($conn,$sql)){
    echo "<script> alert('ลบข้อมูลเรียบร้อย');</script>";
    echo "<script> window.location='myshowuser.php';</script>";
}else{
    echo "Error : ". $sql . "<br> " . mysqli_error($conn);
    echo "<script> alert('ไม่สามารถข้อมูลได้');<script>";
}    
mysqli_close($conn);


?>
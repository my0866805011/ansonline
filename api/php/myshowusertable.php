<?php
include 'myconnect.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Web</title>
   
    <link href="./bst/css/bootstrap.min.css" rel="stylesheet" >
    
</head>



<body>
    <div class = "container">
    <div class="h4 text-center alert alert-success mb-4 mt-4 " role = "alert"> แสดงข้อมูลสมาชิก </div>   
    <a href="./frm_user.php" class="btn btn-success mb-4"> Add+</a>    

    <table class="table table-striped">
    <tr>
        <th>ID No</th>
        <th>Name</th>
        <th>Type</th>
        <th>User</th>   
        <th>E-mail</th>
        <th>AddressPhone</th>
        <th>Password</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <?php 
//INSERT INTO `useraccount`(`id`, `name`, `type`, `address`, `phone`, `user`, `password`, `avertar`, `lat`, `lng`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]','[value-6]','[value-7]','[value-8]','[value-9]','[value-10]')

 $sql = "SELECT * FROM usertable";
 $result = mysqli_query($conn,$sql);
 while($row=mysqli_fetch_array($result)){  
    ?>

    <tr>
        <td><?=$row["id"]?></td>
        <td><?=$row["name"]?></td>
        <td><?=$row["type"]?></td>             
        <td><?=$row["user"]?></td>
        <td><?=$row["email"]?></td>
        <td><?=$row["address"]?></td>  
        <td><?=$row["ispassword"]?></td>
        <td><?=$row["type"]?></td>      
        <td><a href="./edit_user.php?id=<?=$row["id"]?>" class="btn btn-warning" >Edit</a> </td>
        <td><a href="./delete_user.php?id=<?=$row["id"]?>" class="btn btn-danger" onclick="Del(this.href);return false;" >Delete</a> </td>
    </tr>
    <?php
     } 
     mysqli_close($conn);
    ?>
    </table>
  </div> 
    
</body>
</html>

<script language="JavaScript">
    function Del(mypage){
        var agree=confirm("ต้องการลบข้อมูล?")
        if(agree){
            window.location=mypage;
        }
    }
</script>
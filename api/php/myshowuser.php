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
        <th>User</th>   
        <th>Password</th>
        <th>Type</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <?php 
 $sql = "SELECT * FROM usertable";
 $result = mysqli_query($conn,$sql);
 while($row=mysqli_fetch_array($result)){  
    ?>

    <tr>
        <td><?=$row["id"]?></td>
        <td><?=$row["name"]?></td>        
        <td><?=$row["user"]?></td>
        <td><?=$row["password"]?></td>
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
<?
include './myconnect.php';
$m_id=$_GET['id'];
$sql = "SELECT * FROM usertbl WHERE id='$m_id' ";
 $result = mysqli_query($conn,$sql);
 $row=mysqli_fetch_array($result); 
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="./bst/css/bootstrap.min.css" rel="stylesheet">
    <title>Add user</title>

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="h4 text-center alert alert-success mb-4 mt-4 " role="alert"> แก้ไขข้อมูลสมาชิก </div>
                <form method="POST" action="./update_user.php">
                <label>id No </label>
                    <input type="text" name="midno" class="form-control" readonly value=<?=$row['id']?> > <br>  
                <label>Name </label>
                    <input type="text" name="mname" class="form-control" value="<?=$row['name']?>" > <br>
                    <label>User </label>
                    <input type="text" name="muser" class="form-control" value=<?=$row['user']?> > <br>  
                    <label>E-maile </label>
                    <input type="text" name="memail" class="form-control" value=<?$row['email']?> > <br>
                    <label>Password </label>
                    <input type="text" name="mpassword" class="form-control"  value=<?$row['password']?> > <br>                    
                    <label>phone </label>
                    <input type="number" name="mphone" class="form-control" value=<?$row['phone']?> > <br>
                    
                    <input type="submit" value="Update" class="btn btn-success" > 
                    <a href="./myshowuser.php" class="btn btn-danger"> Cancel</a>
                </form>
            </div>
        </div>

    </div>

</body>

</html>

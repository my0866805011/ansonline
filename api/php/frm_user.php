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
                <div class="h4 text-center alert alert-success mb-4 mt-4 " role="alert"> เพิ่มข้อมูลสมาชิก </div>
                <form method="POST" action="./insert_user.php">
                    <label>Name </label>
                    <input type="text" name="fname" class="form-control" placeholder="  .. ชื่อ นามสกุล " required > <br>
                    
                    <label>User </label>
                    <input type="text" name="user" class="form-control" placeholder="  .. User " required > <br>  

                    <label>Password </label>
                    <input type="text" name="password" class="form-control" placeholder="  .. รหัสผ่าน " required > <br>
                    
                    <label>type </label>
                    <input type="text" name="type" class="form-control" placeholder=" type  " required> <br>
                    
                    <input type="submit" value="submit" class="btn btn-success" > 
                    <a href="./myshowuser.php" class="btn btn-danger"> Cancel</a>
                </form>
            </div>
        </div>

    </div>

</body>

</html>

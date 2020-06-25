<?php

include 'config.php';
include('../classes/users.php');

$data = new Users();
$error = array();



//signning up
if (isset($_POST['signup'])) {
    $username = htmlspecialchars($_POST['username']);
    $email = htmlspecialchars($_POST['useremail']);
    $password = $_POST['password'];
    $confpassword = $_POST['confpassword'];
    $picture = $_FILES['picture'];
    $status = $_POST['status'];

    //validation
    $error = $data->signupvalidation($username,$email,$password,$confpassword,$picture);

    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    
     $con = $data->connect();
     $emailQuery = "SELECT * FROM users WHERE useremail = ? LIMIT 1";
     $stm = $con->prepare($emailQuery);
     $stm->bind_param('s', $email);
     $stm->execute();
     $result = $stm->get_result();
     $usercount = $result->num_rows;
     if ($usercount > 0) {
        $error['useremail'] = "useremail already exists";
     }
    //checking if the number of error is 0
    if (count($error) === 0) {
        $picture = $_FILES['picture']['name'];
        $upload = "uploads/" . $picture;
        //storing pictures to the uploads file
        move_uploaded_file($_FILES['picture']['tmp_name'], $upload);

        $push = $data->sign_up($username, $email, $password, $picture, $status);

        $error['message']='you logged in';
        header('location:index.php');
    }
}


///////////////////////////////////////////////////////////////////


// logging in 
if (isset($_POST['login'])) {

    $useremail = htmlspecialchars($_POST['useremail']);
    $password = $_POST['password'];

   //validation
    $error = $data->loginvalidation($useremail,$password);
    if (count($error) === 0) {
        //user logging
        $user = $data->Login('users', ['useremail' => $_POST['useremail']]);
        if ($user && password_verify($password, $user['password'])) {
            //login success
            $_SESSION['Id'] = $user['Id'];
            $_SESSION['username'] = $user['username'];
            $_SESSION['useremail'] = $user['useremail'];
            $_SESSION['picture'] = $user['picture'];
            $_SESSION['status'] = $user['status'];
            header("Location:profile.php");
            exit();
        } 
        else {
            $error['login_fail'] = "wrong credition";
        }
      
        //admin logging
        $admin = $data->Login('admins', ['email' => $_POST['useremail']]);
        if ($admin && password_verify($password, $admin['password'])) {
            //login success
            $_SESSION['Id'] = $admin['Id'];
            $_SESSION['admin_name'] = $admin['admin_name'];
            $_SESSION['email'] = $admin['email'];
            $_SESSION['picture'] = $admin['picture'];
            header("Location:admin_panel.php");
            exit();
        }
        else {
            $error['login_fail'] = "wrong credition";
        }
    }
}

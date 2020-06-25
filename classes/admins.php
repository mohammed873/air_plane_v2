<?php

class Admins extends DB
{
    public function insert_admins($admin_name, $email, $password, $upload, $status)
    {
        $sql2 = "INSERT INTO admins (admin_name,email,password,picture,status) VALUES('$admin_name','$email','$password','$upload','$status')";
        $result = $this->connect()->query($sql2);
        return $result;
    }
    public function adminvalidation($admin_name,$email,$password,$confpassword,$picture)
    {
        if(empty($admin_name)){
            $error['admin_name']="admin name required";
        }
        if(empty($email)){
            $error['email']="Email required";
        }
        if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
            $error['email']="Email adress is not valid";
        }
        if($password !== $confpassword){
            $error['password']="The two passwords don't match";
        }
        if(empty($password)){
            $error['password']="Password required";
        }
        if(empty($picture)){
            $error['picture']="Picture required";
        }
        return $error;
    }

}

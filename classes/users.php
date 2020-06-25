<?php

class Users extends DB
{
    public function sign_up($username, $email, $password, $upload, $status)
    {
        $sql2 = "INSERT INTO `users`(username,useremail,password,picture,status) VALUES('$username','$email','$password','$upload','$status')";
        $result = $this->connect()->query($sql2);
        return $result;
    }

    public function signupvalidation($username,$email,$password,$confpassword,$picture)
    {
        if (empty($username)) {
            $error['username'] = "Username required";
        }
        if (empty($email)) {
            $error['useremail'] = "Email required";
        }
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $error['useremail'] = "Email adress is not valid";
        }
        if ($password !== $confpassword) {
            $error['password'] = "The two passwords don't match";
        }
        if (empty($password)) {
            $error['password'] = "Password required";
        }
        if (empty($picture)) {
            $error['picture'] = "Picture required";
        }

        return $error;
    }

    public function Login($table, $condition)
    {
        $conn = $this->connect();
        $sql = "SELECT * FROM $table";
        $i = 0;
        foreach ($condition as $key => $value) {
            if ($i === 0) {
                $sql = $sql . " WHERE $key=?";
            } else {
                $sql = $sql . " AND $key=?";
            }
            $i++;
        }
        $sql = $sql . " LIMIT 1";

        $stm = $conn->prepare($sql);
        $value = array_values($condition);
        $type = str_repeat('s', count($value));
        $stm->bind_param($type, ...$value);
        $stm->execute();
        $result = $stm->get_result()->fetch_assoc();
        return $result;
    }

    public function loginvalidation($useremail,$password)
    {
        if (empty($useremail)) {
            $error['useremail'] = "useremail required";
        }
        if (empty($password)) {
            $error['password'] = "password required";
        }
        return $error;
    }
}



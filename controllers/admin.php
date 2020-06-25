<?php
include "config.php";
include('../classes/admins.php');
include('../classes/flight.php');

$data= new Admins();
$flight = new Flight();
$error= array();

//inserting new admins
if(isset($_POST['add_admin'])){
    $admin_name=htmlspecialchars($_POST['admin_name']);
    $email=htmlspecialchars($_POST['email']);
    $password = $_POST['password'];
    $confpassword = $_POST['confpassword'];
    $picture = $_FILES['picture'];
    $status = $_POST['status'];

    //validation
    $error = $data->adminvalidation($admin_name,$email,$password,$confpassword,$picture);
   
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

   $con = $data->connect();
   $emailQuery = "SELECT * FROM admins WHERE email = ? LIMIT 1";
   $stm=$con->prepare($emailQuery);
   $stm->bind_param('s',$email);
   $stm->execute();
   $result=$stm->get_result();
   $usercount=$result->num_rows;

   if($usercount > 0){
     $error['email']="Email already exists";
   }
 
   //checking if the number of error is 0
   if(count($error)===0){
    
        $picture=$_FILES['picture']['name'];
        $upload="admin_uploads/".$picture;
        //storing pictures to the uploads file
        move_uploaded_file($_FILES['picture']['tmp_name'], $upload);

        $push= $data->insert_admins($admin_name, $email,$password, $upload, $status);
        //set falsh message
        $_SESSION['message']="You are successfuly added an admin";
        header('location:admin_panel.php');
   }   
    else {
        // wrong info
    }
   
}


////////////////////////////////////////////////////////////////////////////


// adding new flights
if(isset($_POST['add_flight'])){
    $flying_from=$_POST['flying_from'];
    $flying_to=$_POST['flying_to'];
    $departing_date=$_POST['departing_date'];
    $returning_date=$_POST['returning_date'];
    $seats=$_POST['seats'];

  //validation
   $error = $flight->flightvalidation($flying_from,$flying_to,$departing_date,$returning_date,$seats);

   //checking if the number of error is 0
   if(count($error)===0){
    
         $flight->insert_flight($flying_from, $flying_to, $departing_date, $returning_date, $seats);
        //set falsh message
        $_SESSION['message']="You have successfuly added a flight";
        header('location:admin_panel.php');
        
   }else {
      // wrong info
   }
}


/////////////////////////////////


/* the cancel function for flight_list */
if(isset($_GET['cancel'])){
  $id=$_GET['cancel'];

    $query="DELETE FROM flights_list WHERE id = ?";
    $con = $data->connect();
    $stmt=$con->prepare($query);
    $stmt->bind_param("i",$id);
    $stmt->execute();
   
}
?>






        